+++
title = "Franklin设置技巧note"
# tags = [ "programming","bioinformatics","genetics","paper","work","daily","random","insight", ... ]
tags = ["programming","julia","franklin"]
showall = true
summary = """
  Franklin一些使用技巧记录.
  """
rss = summary

hasplotly = false
hasmermaid = false
hascode = true
hascomment = true

pubdate = Date("2022-08-13")
+++

{{page_tags}}

## Julia code live evaluation

`````plaintext

```julia:./code/ex1
a = 10
@show a
```
#= code result show func =#
\output{./code/ex1}
\textoutput{./code/ex1}
\show{./code/ex1}

#= code hiding comments: =#
# hide
# hideall

`````



