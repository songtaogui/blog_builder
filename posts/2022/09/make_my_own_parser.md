+++
title = "Make my own bioinformatics parser with Automa.jl"
tags = ["bioinformatics","julia"]
summary = """
    Parse WGA chain file into dict of IntervalCollections
    """
pubdate = Date("2022-09-20")

# showall = true
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

\toc

\bhack{Problems to solve}{

Parse [UCSC chain format](https://genome.ucsc.edu/goldenPath/help/chain.html), and return a IntervalCollections with the query intervals as the values of the ref intervals.

\plain{
# UCSC chain format: a demo
chain 4900 chrY 58368225 + 25985406 25985566 chr5 151006098 - 43549808 43549970 2
16      0       2
60      4       0
10      0       4
70
}

}

## Design

⇾The \Snote{chain} format for each record could be briefly part into three:

1. The **header** line of \cnote{chain score tName tSize tStrand tStart tEnd qName qSize qStrand qEnd id};
2. The **alignment** body of \cinfo{size dt dq};
3. The **alignment** last line of \cinfo{size}, and a blank line.

⇾The \snote{parser} thus could be devided into four part:

1. The \stip{header} parsing step: add actions for each cell in header line, return the whole *header* var
2. The \stip{alignment} parsing step: add actions for each alignment body, push each alignment record to *alignment* var
3. The \stip{alignment end} parsing step: detect the alignment end, return the *alignment* var
4. The \stip{record} parsing step: detect the end of the record, return the whole *record* var,  maybe convert during this step

\tip{To speed up the file IO and parsing step (or to simplify the coding), we **may not do string convertion** during parsing, instead, we will convert the UInt8 IOstream to the format we required after the whole parsing step is done.}

\hhack{Dependencies}{
- [Automa](https://biojulia.net/Automa.jl/latest/index.html): for parser
- [GenomicFeatures](https://biojulia.net/GenomicFeatures.jl/stable): for converter
- [TranscodingStreams](https://juliaio.github.io/TranscodingStreams.jl/stable/): for IOStream
}

## Implementation

### Define Structure

#### The final storage structure: `ChainMap <: IntervalCollection`

The \snote{chain} format needs to be parsed as a set of `IntervalCollection` (\shack{[ chr:start-end:strand:value, ... ]}), with the ability to pair each target interval to its query interval matched. In a similar implementation (`CrossMap`) in python, the query regions was passed as the values of the target regions (as Strings) [:How CrossMap.py store chain maps](#CrossMapUtilL331L334). In julia, I think we could do it more effectively, by nesting the `IntervalTree` of query as the value of the `IntervaTree` of target.

\julia{
using GenomicFeatures
using Formatting

julia> demo_array = [
    Interval(
        "tchr1",
        j,
        j+100,
        '+',
        Interval("qchr1", j+5, j+105, '+', sprintf1("QID%02d", i))
    ) for (i, j) in enumerate(1:10)
]

julia> typeof(demo_array)
Vector{Interval{Interval{String}}} (alias for Array{Interval{Interval{String}}, 1}) 

julia> demo_map = IntervalCollection(demo_array);
julia> typeof(demo_map)
IntervalCollection{Interval{String}}

}

### The intermediate structure: `ChainRecord`

Like those in [Bed.jl](/posts/2022/09/automa_basic_usage#ways_used_in_the_biojulia_pkgs_automastream), we would define a structure that stores all `IOStreams` related to one chain record, and the positions of each item in the `IOStream`, and define a function to convert it to the `ChainMap` format.

\julia{

mutable struct Record
    # ChainRecord, data and filled range
    data   ::Vector{UInt8}
    filled ::UnitRange{Int}
    # number of align subintervals
    naln   ::Int
    # indexes for header line
    score  ::UnitRange{Int}
    tname  ::UnitRange{Int}
    tsize  ::UnitRange{Int}
    tstrand::UnitRange{Int}
    tstart ::UnitRange{Int}
    tend   ::UnitRange{Int}
    qname  ::UnitRange{Int}
    qsize  ::UnitRange{Int}
    qstrand::UnitRange{Int}
    qstart ::UnitRange{Int}
    qend   ::UnitRange{Int}
    id     ::UnitRange{Int}
    # indexes for aligns
    alndata::Vector{UnitRange{Int}}
    alnend ::UnitRange{Int}
end
}

\todo{
    TO BE CONTINUE...
}

# :x CrossMapUtilL331L334

> Find the source [here](https://github.com/liguowang/CrossMap/blob/8935dbe2f0530d21953c2241d720d320ad408c84/lib/cmmodule/utils.py#L331-L334)

\python{
if target_strand == '+':
    maps[source_name].add_interval( Interval(sfrom, sfrom+size,(target_name,
    tfrom, tfrom+size,target_strand)))
elif  target_strand == '-':
    maps[source_name].add_interval( Interval(sfrom, sfrom+size,(target_name,
    target_size - (tfrom+size), target_size - tfrom, target_strand)))
}
