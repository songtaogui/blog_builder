+++
title = "Julia流程搭建工具Pipeline"
# tags = [ "programming","bioinformatics","genetics","paper","work","daily","random","insight", ... ]
tags = ["programming", "julia"]
showall = true
summary = """
  用Pipeline.jl搭建生物分析流程, 让julia成为生产力!
  """
rss = summary
hasplotly = false
hasmermaid = false
hascode = true
hascomment = true

pubdate = Date("2022-08-11")
+++

{{page_tags}}

\toc

> [Pipeline.jl文档](https://cihga39871.github.io/Pipelines.jl/stable/)

## 快速开始

### 类型

`CmdProgram`和`JuliaProgram`

```julia
using Pipelines

Program
    CmdProgram      # 命令行工具模版和输入输出参数, 传参用cmd::AbstractCmd
    JuliaProgram    # Julia代码的参数模版, 与CmdProgram的区别是JuliaProgram传参用的是main::Expr
```

### CmdProgram

```julia
using Pipelines
echo = CmdProgram(
    input = [
        "REQUIRED",         # 无默认值, any类型
        "TYPED" => String,  # 我默认值, 指定String类型
        "OPTIONAL" => 4,    # 默认值4, any类型
        "FULL" => String => "abc" # 有默认值, 并指定类型
    ]
    cmd = `echo REQUIRED TYPED OPTINAL FULL`
)
```
