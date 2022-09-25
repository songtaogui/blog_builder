+++
title = "Julia v1.8 新特性"
# tags = [ "programming","bioinformatics","genetics","paper","work","daily","random","insight", ... ]
tags = ["Julia"]
showall = true
summary = """
  新鲜出炉的Julia 1.8新的改动(其实已经不新了)
  """

# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasnutshell = false
hasplotly = false
hasmermaid = false
hascomment = true

pubdate = Date("2022-08-19")
+++

{{page_tags}}

\toc

> 今晚不想干活, 翻译一下julia 1.8更新内容, 权当娱乐了, 原文[请戳我](https://julialang.org/blog/2022/08/julia-1.8-highlights/)

## `const`可以用在可变复合类型的字段上了

\julia{
mutable struct T
    x::Int
    const y::Float64
end
}

\shack{挺有用的, 可以把常量定义在复合类型中, 编译器应该也会进行优化}

### 可以在调用时使用`@inline`宏了

之前的`@inline`只能在方法定义的时候添加, 每次调用都会以inline的方式. 现在可以在某个具体的调用时再用inline了:`@inline f(x)`.

\shack{平时不太涉及性能优化, 还没用过@inline, 捂脸!}

### 全局变量可以加类型标注了


\julia{
x::Int = 0
# > 0

x = "string"
# ERROR: MethodError: Cannot `convert` an object of type String to an object of type Int64
}

\shack{很重要, 写代码更不容易出bug, 编译器也更能优化了.}

### 为`@threads`添加了新的调度器

> 可我还没用过`@threads`!

早期的julia对`@threads`是用的静态调度, `iteration => task => thread` 之间的分派关系是预先定义好的: 每个task分配给一个thread. 现在的`:dynamic`可以动态地调度task, 按照每个迭代的工作量一样的前提假设去调度.

举了个栗子:
\julia{
# 一个loop, 指定的时间后终止
julia> function busywait(seconds)
            tstart = time_ns()
            while (time_ns() - tstart) / 1e9 < seconds
            end
        end

julia> @time begin
            Threads.@spawn busywait(5)
            Threads.@threads :static for i in 1:Threads.nthreads()
                busywait(1)
            end
        end
# 6.003001 seconds (16.33 k allocations: 899.255 KiB, 0.25% compilation time)

julia> @time begin
            Threads.@spawn busywait(5)
            Threads.@threads :dynamic for i in 1:Threads.nthreads()
                busywait(1)
            end
        end
# 2.012056 seconds (16.05 k allocations: 883.919 KiB, 0.66% compilation time)
}

### 新的内存引用分配工具

- vscode中自带一个`@profview_allocs`
- 几个工具:`ProfileView.jl`, `Profile.jl`
- 对正在运行的任务进行Profile评估
这个不展开了

### `@time_imports`宏记录Package的加载时间

这个宏在`InteractiveUtils`包中, 是随着REPL启动自动加载的.

### 包的状态可以通过`status`查询

可以指示包能否升级

### 更智能识别系统镜像

v1.8中可以识别julia是加载的包的镜像, 在包版本跟你要安装的版本不一致时给提示.

### 提升预编译表现

也许julia现在最大的掣肘就是预编译时间了, Tim Holy大佬又更新了一波模块预编译的底层逻辑, 简单讲就是预编译的模块现在会保存更多的类型信息, 加载新包时重编译老包的概率降低了。

JuliaCon中还发布了一个静态编译包, 目前还在雏形期, 希望早点搞定啊! 这不直接起飞?!!

### 提升苹果系统的支持

Who cares!






