+++
title = "automa_basic_usage"
tags = ["julia","bioinformatics","automa"]
summary = """
    Learn how to write parser using automa!
    """
pubdate = Date("2022-09-14")

# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

# >>>>CONTROLS>>>>
hasnutshell = true
hasplotly = false
hasmermaid = false
hascomment = true
# <<<<CONTROLS<<<<
+++

{{page_tags}}


\bwarn{BioJulia is awesome, but the tutorials are generally outdated}{
When I first read the blogs in [BioJulia](https://biojulia.net/post), I feel like to make Julia as my main language for bioinformatics related works. However, the BioJulia community suddenly stopped being active several years ago, maybe the core members were busy (re)building useful BioJulia packages.

The package Automa.jl is widely used to generate file parsers in BioJulia, but the [official tutorial](https://biojulia.net/Automa.jl/latest/index.html) for Automa was not so intuitive for newbies like me, and the blog that introduced Automa in BioJulia was stucked in [Part1](https://biojulia.net/post/automa1/).

Here I would record my learning progress of Automa.jl, as a drive to force me finally learn how to write my own parser with Automa.jl

}

## Automa as a efficient tool for building text parser

Automa.jl is a package for generating [finite-state machines (FSMs)](https://en.wikipedia.org/wiki/Finite-state_machine) and tokenizers in Julia.

### Structure of Automa

\julia{
Automa
    regular expressions
    compilers
    code generators
}


#### Regular expressions

Regular expressions in Automa can be built using `Automa.RegExp` module. `RE` in Automa could have actions, which could be used to create FSM. There are currently four actions:

- `:enter`: exec when enter the re
- `:exit`: exec when exit the re
- `:all`: exec in all transitions
- `:final`: exec when reach the final state

assign actions:

\julia{
using Automa
using Automa.RegExp: @re_str
const re = Automa.RegExp

ab = re"ab*"
# assign by symbols
ab.actions[:enter] = [:enter_ab]

# assign to when field to bind the action to all transition within the RE:
ab.when = :cond
}

#### Compilers

compile RE into a FSM: `Automa.Machine` type

\plain{
│              start::Automa.Node│ Automa.Node(<state=1,#edges=1>)           │
│               states::UnitRange│ 1:5                                       │
│              start_state::Int64│ 1                                         │
│  final_states::Automa.StableSet│ Automa.StableSet(Automa.StableDict(5 =>   │
│  eof_actions::Automa.StableDict│ Automa.StableDict(5 =>                    │
}

`execute` function for debugging:

`execute(m::Machine, s::String)`: return a tuple of `(Last_state::Int, action_logs::Vector{Symbol})`

\julia{
machine = Automa.compile(ab)
Automa.execute(machine, "ab")
}

`Tokenizer` type:

\julia{
┌────────────────────────────────────────────────────────┐
   machine      :: Automa.Machine                       
   actions_code :: Vector{Tuple{Symbol, Expr}}           
└────────────────────────────────────────────────────────┘
}

\julia{
tokenizer = Automa.compile(
    re"if|else|while|end"      => :(emit(:keyword)),
    re"[A-Za-z_][0-9A-Za-z_]*" => :(emit(:identifier)),
    re"[0-9]+"                 => :(emit(:decimal)),
    re"="                      => :(emit(:assign)),
    re"("                      => :(emit(:lparen)),
    re")"                      => :(emit(:rparen)),
    re"[-+*/]"                 => :(emit(:operator)),
    re"[\n\t ]+"               => :(),
)
}

 \btip{tokenizer}{
- compile tokenizer by take **a list of pattern** as argument;
- use `emit()` to assign action symbol;
- the **order** matters in pattern list: former position has higher priority;
- the start and end position of the token can be accessed through `ts` and `te` variables in the action code, as well as `p, p_end, p_eof` vars;
}

#### Code generators

Generate Julia code using metaprogramming techniques.

##### Ways suggested in the offical tutorial:

1. define `Dict{Symbol, Expr}` action map;
2. initialize result variables;
3. generate code to initialize variables with `generate_init_code`;
4. set end and EOF positions of data buffer
5. generate code to execute FSM with `generate_exec_code`;
6. check if FSM properly finished;
7. return result
8. generated code was saved in `Automa.CodeGenContext` type:

\plain{
│  vars::Automa.Variables│ Automa.Variables(:p, :p_end, :p_eof, :ts,   │
│     generator::Function│ generate_table_code                         │
│       checkbounds::Bool│ true                                        │
│       loopunroll::Int64│ 0                                           │
│       getbyte::Function│ getindex                                    │
│             clean::Bool│ false                                       │
}

Example:

\julia{
import Automa
import Automa.RegExp: @re_str
const re = Automa.RegExp

word = re"[A-Za-z]+"
words = re.cat(re.opt(word), re.rep(re" +" * word), re" *")
word.actions[:exit] = [:word]
machine = Automa.compile(words)

actions = Dict(:word => :(count += 1)) # step1

context = Automa.CodeGenContext()

@eval function count_words(data)
    count = 0 # step2
    $(Automa.generate_init_code(context, machine)) # step3
    p_end = p_eof = lastindex(data) # step4
    $(Automa.generate_exec_code(context, machine, actions)) # step5
    if cs != 0
        error("failed to count words") # step6
    end
    return count # step7
end
}

\bnote{Some notes:}{

1. the generate function takes input byte sequences ( in the `data` var ), the data object MUST support `Automa.pointerstart` and `Automa.pointerend` methods. \swarn{`pointerstart` and `pointerend`} point to the start and end memory positions. The two methods depend on `Base.pointer` and `Base.sizeof`.
2. \swarn{p} points at **the next byte position** in `data`;
3. \swarn{p_end} -> end position of `data`; 
4. \swarn{p_eof} -> *actual* end of the input sequences; when data is too long to store in memory, `p_eof` would be undefined and set to a negative integer at the beginning, and later set to a suitable position once meet EOF;
5. \swarn{cs} -> **current state** of a machine; when finished, `cs` stores the state of the execution: `cs == 0` means **successfully**, `cs < 0` means failed, `cs > 0` means still running
6. there are three kind of code generators, set by `code=` option in `generate_exec_code`: 
   1. `:table`: use twoo look up tables to pick up next state and actions; \stodo{smallest but slowest}
   2. `:inline`: expand look up tables into if-else branches;
   3. `:goto`: based on `@goto` jumps; \stodo{largest but fastest}

}


##### Ways used in the BioJulia pkgs: Automa.Stream

\bwarn{No offical references avaliable}{
The whole stream sub-module was **NOT included** in neither the offical Automa tutorial nor its API ref. So in this section, I would record what I found, based on what I have learned from the source code of the parsers in the state-of-art BioJulia PKGs.
}

The Automa.jl provides a submodule [Automa.Stream](https://github.com/BioJulia/Automa.jl/blob/master/src/Stream.jl), there are several macros and a generater function in this module that could help building the parser. Below I will list the usage of these things based on my (superficial) understanding.

\binfo{new macros: `@mark`, `@markpos`, `@relpos`, `@abspos`}{

- `@mark()`: mark the current position, return nothing, just pass the `p` var to `buffer.markpos` var;
- `@markpos()`: retrieve the position marked by `@mark()`;
- `@relpos(abspos)`: get the **relative** position of real/absolute position `abspos` (relative to markpos): relpos = abspos - markpos + 1;
- `@abspos(relpos)`: get the absolute postion of relative posion `relpos`: abspos = relpos + markpos - 1;

}

\btip{generate_reader function}{

\julia{
generate_reader(funcname::Symbol, machine::Automa.Machine; kwargs...)
}

Generate a streaming reader function of the name `funcname` from `machine`.
The generated function consumes data from a stream passed as the first argument
and executes the machine with filling the data buffer.
This function returns an expression object of the generated function.  The user
need to evaluate it in a module in which the generated function is needed.

*Keyword Arguments*
- `arguments`: Additional arguments `funcname` will take (default: `()`).
    The default signature of the generated function is `(stream::TranscodingStream,)`,
    but it is possible to supply more arguments to the signature with this keyword argument.
- `context`: Automa's codegenerator (default: `Automa.CodeGenContext()`).
- `actions`: A dictionary of action code (default: `Dict{Symbol,Expr}()`).
- `initcode`: Initialization code (default: `:()`).
- `loopcode`: Loop code (default: `:()`).
- `returncode`: Return code (default: `:(return cs)`).

The generated code looks like this:

\julia{
function {funcname}(stream::TranscodingStream, {arguments}...)
    buffer = stream.state.buffer1
    data = buffer.data
    {declare variables used by the machine}
    {initcode}
    @label __exec__
    {set up the variables and the data buffer}
    {execute the machine}
    {loopcode}
    if cs ≤ 0 || p > p_eof ≥ 0
        @label __return__
        {returncode}
    end
    @goto __exec__
end
}
}

Learn with a case: BED parser in [BED.jl](https://github.com/BioJulia/BED.jl)

\julia{
# the following code was copied from https://github.com/BioJulia/BED.jl/blob/develop/src/reader.jl
# only the Automa related part was copied, go to the original repository to see the whole code.

const record_machine, file_machine = (function ()
    alt = Automa.RegExp.alt
    cat = Automa.RegExp.cat
    rep = Automa.RegExp.rep
    opt = Automa.RegExp.opt

    record = let
        chrom = re"[ -~]*"
        chrom.actions[:enter] = [:pos]
        chrom.actions[:exit] = [:record_chrom]

        chromstart = re"[0-9]+"
        chromstart.actions[:enter] = [:pos]
        chromstart.actions[:exit] = [:record_chromstart]

        chromend = re"[0-9]+"
        chromend.actions[:enter] = [:pos]
        chromend.actions[:exit] = [:record_chromend]

        name = re"[ -~]*"
        name.actions[:enter] = [:pos]
        name.actions[:exit] = [:record_name]

        score = re"[0-9]+"
        score.actions[:enter] = [:pos]
        score.actions[:exit] = [:record_score]

        strand = re"[+\-.?]"
        strand.actions[:enter] = [:record_strand] #Note: single byte.

        thickstart = re"[0-9]+"
        thickstart.actions[:enter] = [:pos]
        thickstart.actions[:exit] = [:record_thickstart]

        thickend = re"[0-9]+"
        thickend.actions[:enter] = [:pos]
        thickend.actions[:exit] = [:record_thickend]

        itemrgb = cat(re"[0-9]+", opt(cat(',', re"[0-9]+", ',', re"[0-9]+")))
        itemrgb.actions[:enter] = [:pos]
        itemrgb.actions[:exit] = [:record_itemrgb]

        blockcount = re"[0-9]+"
        blockcount.actions[:enter] = [:pos]
        blockcount.actions[:exit] = [:record_blockcount]

        # comma-separated values
        csv(x) = cat(rep(cat(x, ',')), opt(x))

        blocksizes = let
            blocksize = re"[0-9]+"
            blocksize.actions[:enter] = [:pos]
            blocksize.actions[:exit] = [:record_blocksizes_blocksize]

            csv(blocksize)
        end
        blocksizes.actions[:exit] = [:record_blocksizes]

        blockstarts = let
            blockstart = re"[0-9]+"
            blockstart.actions[:enter] = [:pos]
            blockstart.actions[:exit] = [:record_blockstarts_blockstart]

            csv(blockstart)
        end
        blockstarts.actions[:exit] = [:record_blockstarts]

        cat(
            chrom, '\t',
            chromstart, '\t',
            chromend,
            opt(cat('\t', name,
            opt(cat('\t', score,
            opt(cat('\t', strand,
            opt(cat('\t', thickstart,
            opt(cat('\t', thickend,
            opt(cat('\t', itemrgb,
            opt(cat('\t', blockcount,
            opt(cat('\t', blocksizes,
            opt(cat('\t', blockstarts)))))))))))))))))))
    end
    record.actions[:enter] = [:mark]
    record.actions[:exit] = [:record]

    hspace = re"[ \t\v]"

    blankline = rep(hspace)

    comment = re"#.*"

    newline = let
        lf = re"\n"
        lf.actions[:enter] = [:countline]

        cat(opt('\r'), lf)
    end

    file = rep(alt(
        cat(record, newline),
        cat(blankline, newline),
        cat(comment, newline),
    ))

    return map(Automa.compile, (record, file))
end)()

#=
write("bed.dot", Automa.machine2dot(file_machine))
run(`dot -Tsvg -o bed.svg bed.dot`)
=#

const record_actions = Dict(
    :mark => :(@mark),
    :pos => :(pos = @relpos(p)),
    :countline => :(),
    :record_chrom => :(record.chrom = (pos:@relpos(p-1)); record.ncols += 1),
    :record_chromstart => :(record.chromstart = (pos:@relpos(p-1)); record.ncols += 1),
    :record_chromend => :(record.chromend = (pos:@relpos(p-1)); record.ncols += 1),
    :record_name => :(record.name = (pos:@relpos(p-1)); record.ncols += 1),
    :record_score => :(record.score = (pos:@relpos(p-1)); record.ncols += 1),
    :record_strand => :(record.strand = @relpos(p); record.ncols += 1),
    :record_thickstart => :(record.thickstart = (pos:@relpos(p-1)); record.ncols += 1),
    :record_thickend => :(record.thickend = (pos:@relpos(p-1)); record.ncols += 1),
    :record_itemrgb => :(record.itemrgb = (pos:@relpos(p-1)); record.ncols += 1),
    :record_blockcount => :(record.blockcount = (pos:@relpos(p-1)); record.ncols += 1),
    :record_blocksizes_blocksize => :(push!(record.blocksizes, (pos:@relpos(p-1)))),
    :record_blocksizes => :(record.ncols += 1),
    :record_blockstarts_blockstart => :(push!(record.blockstarts, (pos:@relpos(p-1)))),
    :record_blockstarts => :(record.ncols += 1),
    :record => :(record.filled = 1:@relpos(p-1))
)

Automa.Stream.generate_reader(
    :index!,
    record_machine,
    arguments = (:(record::Record),),
    actions = record_actions,
    # context = :(),
    initcode = :(pos = 0),
    # loopcode = :()
    # returncode = :()
) |> eval

}

In the case above, the parsers did not directly parse the content of the data into variables, instead, they created a Type `Record` (source code [here](https://github.com/BioJulia/BED.jl/blob/2e082b1a9f8c6c543e5544a90a7f970110ca7e6b/src/record.jl#L4)) that stores the whore data related to the record and the indexes for each track.

So, the `record_machine` FSM records the enter and exit action for both the whole record (per line in a bed format file) and for each track (per cell for each line). The `:enter` action for the whole record was marked `@mark`, in each track's `:enter` action, the `pos` var was assigned to `@relpos`, which means positon relative to the start postion of each record. The output variables were assigned by `var = (pos:@relpos(p-1))` rather than the traditional way `var = String(data[pos:p-1])`, to store the relative positions in the data.

Then, the `file_machine` was used to generate a `readrecord!` function

#### Expand knowledge

- Dealing with streams: [TranscodingStreams](https://juliaio.github.io/TranscodingStreams.jl/stable/)

\btodo{TODO}{

how to write my own parser and reader?

}