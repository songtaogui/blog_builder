+++
title = "Notes on franklin's gramma"
tags = ["franklin","julia","hack"]
summary = """
    learn franklin's markdown gramma and make some DIY
    """
pubdate = Date("2022-08-23")

showall = false

# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

# >>>>CONTROLS>>>>
hasnutshell = false
hasplotly = false
hasmermaid = false
hascomment = true
# <<<<CONTROLS<<<<
+++

{{page_tags}}

\bnote{Notes on Franklin's gramma}{
- Records on the Franklin syntax (md, div, variables etc.)
- List the differences (limits) I know for Franklin
}

## Franklin syntax

### Markdown

\btodo{Expreimenting}{using `fd2html` in julia REPL to see how md was converted to html in Franklin:

\html{
"""Set `x` to 1, see [the docs](http://example.com).""" |> fd2html
<p>Set <code>x</code> to 1, see <a href="http://example.com">the docs</a>.</p>\n
}
}

\binfo{Franklin new thing apart from md}{
- `\fig{path}` and `\figalt{alt}{path}` for figure insertion, in addition to markdown's `![alt](full_path)` syntax, the difference is the Franklin version allows **relative** paths;
- `\figenv{alt}{path}{style}`: new command (defined in config.md) suggested by Franklin tutorials to insert img with control of styles such as `width|border|text-align` etc. 
- `\figdiy{path}{img-features}`: my diy command to insert image `\figdiy{/assets/img/bash.svg}{width=100px align="left" }`
- `\textinput{path}`: insert a markdown file
- `\tableinput{headers}{path}`: insert a table from **CSV** file, if headers option left empty, use the first line of the csv file as table header
}

\bwarn{Sth diff from normal markdown}{
- using HTML comments
- `$` should be escaped: `\$` => \$
- HTML entities supported: `&rarr;` => &rarr;
- `\\` for line break
- `~~~ <some html things> ~~~` for insert raw html
- `\toc` or `\tableofcontents` for TOC => in a `franklin-toc` div block, modify `.franklin-toc ol` or `.franklin-toc li` in CSS for styling, set `@def mintoclevel=1` and `@def maxtoclevel=3` to control the header levels
- both single and double back-ticks represent inline code (double back-ticks are useful when code contain `` ` ``): ``"`"``;
}

\berror{Some md things unsupported by Franklin}{
- **no native \cwarn{Admonitions} gramma support**, I made my own [here](/posts/2022/08/Franklin博客中设置提示框和alert高亮), but not very productive;
- **list items** must be **on the same line** due to a [limitation](https://github.com/JuliaLang/julia/issues/30198) of Julia Markdown parser, so code block or table indent to a list item would not happen in Franklin blogs (for now maybe)
- **`~~ strikethrough text ~~` not supported in Franklin:** ~~ I should be strikethrough ~~, use`~~~<del></del>~~~` instead: ~~~<del>I am strikethrough</del>~~~, I wrapped it as a function: `\del` in config.md, so I could also do `\del{I am strikethrough}` and get: \del{I am strikethrough}
}


### Divs and Commands

- Using `@@divclass ... @@` to define custom div blocks. Could be nested.

### Citations

- `\biblabel{short}{name}`: create bibliography list with cite link `short`;
- `\cite{short1, short2}` or `\citet{short3}`: will not add parentheses: `Some text gui et al.(2022)`
- `\citep{short1, short2}`: will add parentheses: `Some text (gui et al.(2022))`


\bhack{example}{
by this:

\plain{
In the text, you may refer to \citep{noether15, bezanson17} while in a bibliography section you would have

* \biblabel{noether15}{Noether (1915)} **Noether**, Korper und Systeme rationaler Funktionen, 1915.
* \biblabel{bezanson17}{Bezanson et al. (2017)} **Bezanson**, **Edelman**, **Karpinski** and **Shah**, [Julia: a fresh approach to numerical computing](https://julialang.org/publications/julia-fresh-approach-BEKS.pdf), SIAM review 2017.
}
we will get:

In the text, you may refer to \citep{noether15, bezanson17} while in a bibliography section you would have

* \biblabel{noether15}{Noether (1915)} **Noether**, Korper und Systeme rationaler Funktionen, 1915.
* \biblabel{bezanson17}{Bezanson et al. (2017)} **Bezanson**, **Edelman**, **Karpinski** and **Shah**, [Julia: a fresh approach to numerical computing](https://julialang.org/publications/julia-fresh-approach-BEKS.pdf), SIAM review 2017.

}

\btodo{Thoughts}{
This may also not so convenient, what if we:
- define a function that auto add bibliography to the end of the file? 
- or, auto add bibliography to a temp file, and a new function say `\biblist` to get all bibliography in the temp file?
- use a BibTex file as database, and use the key as options?
}


### Page variables

\bnote{Page variables}{

define them with `@def`:

\markdown{
@def author = "songtaogui"

 <!-- if text are multi-lines, they MUST be indented -->
@def some_str = """
    abc
    def
    """
}

or define them within `+++` block, the content between `+++` will be evaluated as julia code, all variables will be consided as page variables.

using `{{fill var}}` function to retrieve the page variables: `{{fill author}}`

\hwarn{Updated: 20220921}{
The latest version of Franklin (Xranklin.jl) deprecates the using of `@def`, so here we recommend the use of toml inside `+++` for var definition.
}

}

### HTML functions

list of buildin Franklin HTML functions:

| Format                                                                                                                   | Role                                                                                                                    |
| :----------------------------------------------------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------- |
| `{{fill var}}` or `{{var}}`                                                                                              | retrieve the values from `var` page variables                                                                           |
| `{{fill vname rpath}}`                                                                                                   | place the value of page variable vname defined at `rpath` where `rpath` is a relative path like `blog/pg1`              |
| `{{redirect /some/other/addr.html}}`                                                                                     | adds a redirect page: when a user goes to `(baseurl)/some/other/addr.html`, they will be redirected to the current page |
| `{{insert fpath}}`                                                                                                       | insert the content of the file at `fpath` where fpath is taken relative to the `_layout` folder                         |
| `{{if var}} ... {{elseif var2}} ... {{else}} ... {{end}}`                                                                | Conditional blocks                                                                                                      |
| `{{ispage path}}`,`{{isnotpage path}}`, `{{is(not)def var}}`, `{{is(not)empty var}}` | dedicated conditional blocks | | |                                                                                                                         |
| `{{for (x,y) in var}} ... {{fill x}} ...{{fill y}} ... {{end}}`                                                          | For loops, with eg.: var = [(1,2),(3,4)]                                                                                |

### Global page variables

\binfo{Global page var}{

- `author`
- `prepath`,`prefix`,`base_path`
- `date_format`
- `date_days`,`date_shortdays`,`date_(short)months`
- `div_content`
- `ignore`: indicate files should be ignored by Franklin. to ignore a file add it's relative path like `"path/to/file.md"`, to ignore a directory end the path with a `/` like `"path/to/dir/"`..
- `autocode`
- `automath`

> Refer to other buildin variables [here](https://franklinjl.org/syntax/page-variables/).
}





