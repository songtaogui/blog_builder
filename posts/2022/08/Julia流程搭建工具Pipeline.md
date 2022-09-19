+++
title = "Julia流程搭建工具Pipeline"
# tags = [ "programming","bioinformatics","genetics","paper","work","daily","random","insight", ... ]
tags = ["programming", "julia", "pipeline"]
showall = true
summary = """
  用Pipeline.jl搭建生物分析流程, 让julia成为生产力!
  """

hasnutshell = false
hasplotly = false
hasmermaid = false
hascode = true
hascomment = true

pubdate = Date("2022-08-11")
+++

{{page_tags}}

\toc

> 本文是对[Pipeline.jl文档](https://cihga39871.github.io/Pipelines.jl/stable/)的低配翻译

## 快速开始

### 类型

`CmdProgram`和`JuliaProgram`

\julia{
using Pipelines

Program
    CmdProgram      # 命令行工具模版和输入输出参数, 传参用cmd::AbstractCmd
    JuliaProgram    # Julia代码的参数模版, 与CmdProgram的区别是JuliaProgram传参用的是main::Expr
}

### CmdProgram

#### 快速开始

\julia{
using Pipelines
echo = CmdProgram(
    inputs = [
        "REQUIRED",         # 无默认值, any类型
        "TYPED" => String,  # 我默认值, 指定String类型
        "OPTIONAL" => 4,    # 默认值4, any类型
        "FULL" => String => "abc" # 有默认值, 并指定类型
    ],
    cmd = \`echo REQUIRED TYPED OPTINAL FULL\`
)
}

\btip{贴士}{
- 用`run`运行命令,记得区分位置参数和关键字参数(`;`): `run(echo; REQUIRED="Pipelines", TYPED = "are")`;
- 程序会**自动记录`run_id`**, 如果重复提交, 不会重复运行,而是给出warn;
}

#### 具体用法

- `name`: 定义CmdProgram的名字;
- `id_file`: 作业UID的前缀, 如`id_file=".bwt"`会生成`.bwt.xxxxx`的UID;
- `inputs`: `[]`列表, 可以用`=>`添加默认值和类型;

\btip{输入参数用`String`还是`Symbol`?}{
大部分情况下,用String, 只有当参数的改变不会影响结果时, 用Symbol。
比如如果重复提交同一个任务, 只有cpu数目(NTHREADS参数)改变了, 如果想让流程知道这是一个已经跑过的任务, 就要用Symbol的形式传递NTHREADS参数:`:NTHREADS => Int => 8`, Symbol类型的参数不会用于生成UID。
}

- `outputs & infer_outputs`: 动态生成输出, 用法如下

    \julia{
    infer_outputs = quote
        Dict(
            "OUTPUT_FILE" => joinpath(
                pwd(), string("out_", INPUT1, ".txt")
            )
        ) 
    end
    }

    - 注意: 输出必须是outputs变量为key的字典
    - 几个辅助函数: `replaceext`, `removeext`, `to_str`, `to_cmd`

- `validate_inputs`: 检查输入依赖

    \julia{
    validate_inputs = quote
        check_dependency_file(IN1) && check_dependency_file(IN2)
    end
    }

\bhack{个人感叹:}{
    有类型标注就是好啊, 检查输入只用检查文件存在就行了, 在shell里还得自己判断是不是数字等等。
}

- `prerequisites`: 在运行主程序前预先执行一些操作, 比如创建输出目录等

    \julia{
    prerequisites = quote
        mkpath(dirname(BAM))
    end
    }

- `validate_outputs`: 检查输出结果

    \julia{
    validate_outputs = quote
        check_dependency_file(BAM)
    end
    }

- `wrap_up`: 打包操作, 如清理临时文件等等

    \julia{
    wrap_up = quote
        run(\`samtools index $BAM\`)
    end
    }

\julia{
CmdProgram(;
    name::String                            = "Command Program",
    id_file::String                         = "",
    info_before::String                     = "auto",
    info_after::String                      = "auto",
    cmd_dependencies::Vector{CmdDependency} = Vector{CmdDependency}(),
    inputs                                  = Vector{String}(),
    validate_inputs::Expr                   = do_nothing,  # vars of inputs
    infer_outputs::Expr                     = do_nothing,  # vars of inputs
    prerequisites::Expr                     = do_nothing,  # vars of inputs and outputs
    cmd::Base.AbstractCmd                   = \`\`,
    outputs                                 = Vector{String}(),
    validate_outputs::Expr                  = do_nothing,  # vars of outputs
    wrap_up::Expr                           = do_nothing,   # vars of inputs and outputs
    mod::Module                             = Pipelines    # please change to @__MODULE__
) -> CmdProgram
}

#### 运行

\julia{
success, outputs = run(
    p::Program;
    program_kwargs...,
    dir::AbstractString="",
    check_dependencies::Bool=true,
    skip_when_done::Bool=true,
    touch_run_id_file::Bool=true,
    verbose=true,
    retry::Int=0,
    dry_run::Bool=false,
    stdout=nothing,
    stderr=nothing,
    stdlog=nothing,
    append::Bool=false
) -> (success::Bool, outputs::Dict{String})
}
- **verbose:** `true/:all`输出所有log;`:min`输出最小info和error; `:none/false`只输出error
- **retry**: 尝试N次重跑
- **dry_run**: 不真跑, 输出运行命令
- stdout/err/log/append: 重定向输出, `stdlog`是julia中`@info, @warn, @error`等日志的io

\bwarn{重定向可能多核不安全}{
julia中的重定向不是多线程安全的, 所以多tasks或多线程任务时候建议不用重定向。
}

运行的内在过程:

1. 进入工作目录, 建立重定向(如果有);
2. 检查工作流程和输入输出的兼容性, 合法性;
3. 检查工作流是否跑过了;
4. 检查依赖;
5. 验证输入;
6. 生成可执行的命令;
7. 预操作(prerequisites);
8. 执行命令;
9. 验证输出;
10. 打包wrap_up;
11. 成功完事, 生成run_id, 返回(bool, outputs)

#### 作业管理

同一作者开发的类似PBS的作业管理工具包: [JobSchedulers.jl](https://github.com/cihga39871/JobSchedulers.jl), 和Pipelines完全兼容, 可以用`Job()`指令代替`run()`指令, 用submit!(::Job)提交作业。\stodo{TODO: 挖个坑, 先不学这个了}


### Julia Program

\julia{
JuliaProgram <: Program

JuliaProgram(;
    name::String                            = "Julia Program",
    id_file::String                         = "",
    info_before::String                     = "auto",
    info_after::String                      = "auto",
    cmd_dependencies::Vector{CmdDependency} = Vector{CmdDependency}(),
    inputs                                  = Vector{String}(),
    validate_inputs::Expr                   = do_nothing,  # vars of inputs
    infer_outputs::Expr                     = do_nothing,  # vars of inputs
    prerequisites::Expr                     = do_nothing,  # vars of inputs and outputs
    main::Expr                              = do_nothing,  # vars of inputs and outputs
    outputs                                 = Vector{String}(),
    validate_outputs::Expr                  = do_nothing,  # vars of outputs
    wrap_up::Expr                           = do_nothing   # vars of inputs and outputs
) -> JuliaProgram
}

大部分JuliaProgram的内容跟CmdProgram类似, 一些区别如下: 

\bnote{JuliaProgram vs CmdProgram}{
- jp有主代码:jp.main, 可以`quote..end`定义;
- 如果jp.main是表达式(Expr), run的时候是替换表达式中的变量为 `inputs["VAR"]`; 如果jp.main是函数, 则直接调用main(inputs,outputs).
- 如果jp.main返回一个Dict, 在validate_outputs的时候可能会覆盖outputs(不太明白, 基本不会遇到这种情况吧)
- jp在dry run的时候返回的是推测的outputs类型;
}


### CmdDependency

依赖的软件是否存在或者是否是合适的版本

\julia{
CmdDependency(;
    exec::Base.AbstractCmd='',           # 执行的软件, 如gcc
    test_args::Base.AbstractCmd='',      # 判断的参数, 如--version
    validate_success::Bool=false,        # 是否判断退出码
    validate_stdout::Function=do_nothing,# 对命令的stdout执行函数
    validate_stderr::Function=do_nothing,# 对命令的stderr执行函数
    exit_when_fail::Bool=true            # 判断失败后是否退出并抛出异常
)
}

例如:

\julia{
julia = CmdDependency(
    exec = "julia",
    test_args = "--version",
    validate_success = true,
    validate_stdout = x -> occursin(r"^julia version", x),
    validate_stderr = do_nothing,
    exit_when_fail = true
)
}

通常如果在`CmdProgram`中定义了`CmdDependency`, 会自动检查的, 但也可以通过`check_dependency()`手动检查。

\julia{
dep1 = CmdDependency(...)
dep2 = CmdDependency(...)

prog = CmdProgram(
    cmd_dependencies = [dep1, dep2],
    cmd = "$dep1 --args" & "$dep2 --args"
)

run(prog, inputs; check_dependencies = true)
}

### MISC



- `Program`抽象类型是`CmdProgram`和`JuliaProgram`的父类型;
- 一些有用的小函数:

\julia{
replaceext(path, replacement)
removeext(path)
split(c::Cmd) = c.exec :: Vector{String}
to_str(x), str(x) # Cmd to String
to_cmd(x) # string to cmd
do_noting(x...) = nothing
isok(x) # return true, 除非x为 n, no, null, f, false, 0
}




