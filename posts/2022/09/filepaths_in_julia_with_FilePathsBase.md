+++
title = "Filepaths in julia with FilePathsBase"
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


\hhack{Type Based Path Operation in Julia}{One of Julia's famous features is its type system. However, the julia base treat files and paths as strings. [FilePathsBase.jl](https://rofinn.github.io/FilePathsBase.jl/stable/) and [FilePaths]() provide a type based approach for filesystems in Julia.}

## FilePathsBase

### Quick start

\note{
- `/`: concat FilePaths and Strings, more expressive than using `*` for path join, e.g.: `p"/path/to" / "prefix" * ".jl"`;
- `cwd()`: similar to `pwd()`, but outputs FilePath type
- `stat()`: stat files with input of FilePath type
- `warklpath()`: walk through FilePaths, return array of paths;
- `relative(P1<:AbstractPath, P2<:AbstractPath)`: return paths of P1 relative to P2;
- `absolute(P<:AbstractPath)`: return the absolute path of P1;
- `islink(P)`: check if P is a link;
- `canonicalize(P)`: get the real path of symlink P
- `parents(P)`: get all parent dirs of P, returns an Array{AbstractPath}
- `mktemp(Systempath)/mktempdir(Systempath)`
- `sync([f::Fucntion,] src, dst; delete=false, overwrite=true)`: recursively copy new and updated files from src to dst, also could apply function;
- `mode(P)`: return the Mode of P, in `Mode` type: "Mode("-rw-rw-rw-")";
- `chmod(P, "+x")`,`m::Mode + executeable(:ALL); m - readable(:ALL)`: change mode
- `rm(P; recursive=true)`;
- `exists(P)`
}


\binfo{Some design throughts and FAQs}{

- **`FilePathsBase.jl` or `FilePaths.jl`**: `FilePathsBase` has less dependency, thus suitable for low level development, `FilePaths` extends `FilePathsBase.jl` at the cost of extra dependencies, thus more suitable for scripts/app-level packages.
- **Write code that works for both Strings and Paths**:
  - Don't [overly constrain](https://white.ucc.asn.au/2020/04/19/Julia-Antipatterns.html#over-constraining-argument-types) your argument types;
  - Avoid manual string manipulations (eg. `match`, `replace`).
  - Stick to the overlapping base filesystem aliases (eg. `joinpath` vs `/`, `normpath` vs `normalize`).
- `@convert`: a macro for method convertions.
}

### Ref List

#### Operations

A table of common operations with Filesystem and FilePathsBase.

| Filesystem                  | FilePathsBase.jl                                  |
| :-------------------------- | :------------------------------------------------ |
| `"/home/user/docs"`         | `p"/home/user/docs"`                              |
| --                          | `Path()`                                          |
| `pwd()`                     | `pwd(SystemPath) or cwd()`                        |
| `homedir()`                 | `homedir(SystemPath) or home()`                   |
| `cd()`                      | `cd()`                                            |
| `joinpath()`                | `/`                                               |
| `basename()`                | `basename()`                                      |
| --                          | `hasparent, parents, parent`                      |
| `splitext`                  | `splitext`                                        |
| --                          | `filename`                                        |
| --                          | `extension`                                       |
| --                          | `extensions`                                      |
| `ispath`                    | `exists`                                          |
| `realpath`                  | `canonicalize`                                    |
| `normpath`                  | `normalize`                                       |
| `abspath`                   | `absolute`                                        |
| `relpath`                   | `relative`                                        |
| `stat`                      | `stat`                                            |
| `lstat`                     | `lstat`                                           |
| `filemode`                  | `mode`                                            |
| `filesize`                  | `filesize`                                        |
| `mtime`                     | `modified`                                        |
| `ctime`                     | `created`                                         |
| `isdir`                     | `isdir`                                           |
| `isfile`                    | `isfile`                                          |
| `islink`                    | `islink`                                          |
| `issocket`                  | `issocket`                                        |
| `isfifo`                    | `isfifo`                                          |
| `ischardev`                 | `ischardev`                                       |
| `isblockdev`                | `isblockdev`                                      |
| `isexecutable (deprecated)` | `isexecutable`                                    |
| `iswritable (deprecated)`   | `iswritable`                                      |
| `isreadable (deprecated)`   | `isreadable`                                      |
| `ismount`                   | `ismount`                                         |
| `isabspath`                 | `isabsolute`                                      |
| `splitdrive()[1]`           | `drive`                                           |
| --                          | `root (property)`                                 |
| `split(p, "/")`             | `segments (property)`                             |
| `expanduser`                | `expanduser`                                      |
| `mkdir`                     | `mkdir`                                           |
| `mkpath`                    | `N/A (use mkdir)`                                 |
| `symlink`                   | `symlink`                                         |
| `cp`                        | `cp`                                              |
| `mv`                        | `mv`                                              |
| `download`                  | `download`                                        |
| `readdir`                   | `readdir`                                         |
| --                          | `readpath`                                        |
| `walkpath`                  | `walkpath`                                        |
| `rm`                        | `rm`                                              |
| `touch`                     | `touch`                                           |
| `tempname()`                | `tempname(::Type{<:AbstractPath}) (or tmpname)`   |
| `tempdir()`                 | `tempdir(::Type{<:AbstractPath}) (or tmpdir)`     |
| `mktemp()`                  | `mktemp(::Type{<:AbstractPath}) (or mktmp)`       |
| `mktempdir()`               | `mktempdir(::Type{<:AbstractPath}) (or mktmpdir)` |
| `chmod`                     | `chmod (recursive unix-only)`                     |
| `chown (unix only)`         | `chown (unix only)`                               |
| `read`                      | `read`                                            |
| `write`                     | `write`                                           |
| `@__DIR__`                  | `@__PATH__`                                       |
| `@__FILE__`                 | `@__FILEPATH__`                                   |

#### Aliases

A slightly reduced list of operations/aliases that will work with both strings and path types.
The `Filesystem` and `FilePathsBase` columns indicate what type will be returned from each
each library. As you'd expect, most return types match the input argument(s).

| Function Name | Filesystem                       | FilePathsBase                  |
| :------------ | :------------------------------- | :----------------------------- |
| cd            | AbstractString                   | AbstractPath                   |
| joinpath      | AbstractString                   | AbstractPath                   |
| basename      | AbstractString                   | AbstractString                 |
| splitext      | (AbstractString, AbstractString) | (AbstractPath, AbstractString) |
| ispath        | Bool                             | Bool                           |
| realpath      | AbstractString                   | AbstractPath                   |
| normpath      | AbstractString                   | AbstractPath                   |
| abspath       | AbstractString                   | AbstractPath                   |
| relpath       | AbstractString                   | AbstractPath                   |
| stat          | StatStruct                       | FilePathsBase.Status           |
| lstat         | StatStruct                       | FilePathsBase.Status           |
| filemode      | UInt64                           | FilePathsBase.Mode             |
| filesize      | Int64                            | Int64                          |
| mtime         | Float64                          | Float64                        |
| ctime         | Float64                          | Float64                        |
| isdir         | Bool                             | Bool                           |
| isfile        | Bool                             | Bool                           |
| islink        | Bool                             | Bool                           |
| issocket      | Bool                             | Bool                           |
| isfifo        | Bool                             | Bool                           |
| ischardev     | Bool                             | Bool                           |
| isblockdev    | Bool                             | Bool                           |
| ismount       | Bool                             | Bool                           |
| isabspath     | Bool                             | Bool                           |
| expanduser    | AbstractString                   | AbstractPath                   |
| mkdir         | AbstractString                   | AbstractPath                   |
| mkpath        | AbstractString                   | AbstractPath                   |
| symlink       | Nothing                          | Nothing                        |
| cp            | AbstractString                   | AbstractPath                   |
| mv            | AbstractString                   | AbstractPath                   |
| download      | AbstractString                   | AbstractPath                   |
| readdir       | AbstractString                   | AbstractString                 |
| rm            | Nothing                          | Nothing                        |
| touch         | AbstractString                   | AbstractPath                   |
| chmod         | AbstractString                   | AbstractPath                   |
| chown         | AbstractString                   | AbstractPath                   |
| read(fp, T)   | T                                | T                              |
| write         | Int64                            | Int64                          |


## FilePaths

[FilePaths](https://github.com/rofinn/FilePaths.jl) extends FilePathsBase with several useful functions:


\bnote{Functions in `FilePaths`}{

**glob**: extend global match package `Glob` to support FilePaths

\julia{
glob(pattern, P::T) where T <: AbstractPath 
}

**URI**: extend URIparser packge `URI` to support FilePaths (I have not used URI)

**`@compat`**: write string and AbstractPath compatible codes:


\julia{
FilePaths.@compat function myrelative(x::AbstractPath, y::AbstractPath)
    return relative(x, y)
end

# the function myrelative could deal with AbstractPaths and Strings:
myrelative(cwd()， home())
myrelative(pwd(), homedir())
myrelative(pwd(), home())
# all return in AbstractPath type
}

}

## More about Mode in FilePathsBase

`Mode` type provides abstraction for working with posix file permissions

\julia{

struct Mode
    m::UInt64
end

# user groups symbols:
:ALL
:USER
:GROUP
:OTHER

# dispatch base functions for dealing with Mode:
+, -, Base.oct, 
isdir, isfile, islink, issocket, isfifo, ischardev, isblockdev
iswritable, isreadable, isexecutable # isexecutable is newly definde in FilePathsBase

# function alias
executable(usr_grps::Symbol...) = Mode(EXEC, usr_grps...)
readable(usr_grps::Symbol...) = Mode(READ, usr_grps...)
writable(usr_grps::Symbol...) = Mode(WRITE, usr_grps...)

}









