+++
title = "filepaths_in_julia_with_FilePathsBase"
tags = ["julia"]
summary = """
    Dealing with file paths in julia, using FilePathsBase.jl
    """
pubdate = Date("2022-09-16")

# showall = true
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


One of Julia's famous features is its type system. However, the julia base treat files and paths as strings. [FilePathsBase.jl](https://rofinn.github.io/FilePathsBase.jl/stable/) provides a type based approach for filesystems in Julia.

## Quick start

- `/`
- `cwd()`
- `stat()`

\julia{
using FilePathsBase;
using FilePathsBase: /

# cwd() => pwd() like fuc, but returns a FilePath type:
julia> cwd()
p"C:/Users/GuiSongtao"

# / => path concatenation

# walkpath() => list recursively of files in the current path
}
