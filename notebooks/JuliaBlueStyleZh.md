+++
title = "Julia 代码规范 Blue"
tags = ["Julia","codestyle"]
summary = """
    Julia的一个代码规范,
    与官方规范有一点出入,
    低配翻译一下,
    当作自己以后的代码标准
    """
pubdate = Date("2022-09-27")

# showall = true
# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

# >>>>CONTROLS>>>>
hasnutshell = true
hasplotly = false
hasmermaid = false
hascomment = true
# ["always", "hourly", "daily", "weekly", "monthly", "yearly", "never"]
sitemap_changefreq = "weekly"
sitemap_priority = 0.5
sitemap_exclude = false
# <<<<CONTROLS<<<<
+++

{{page_tags}}

\hnote{徽章标识}{

如果你的Julia项目遵循该代码规范, 可以在项目的`README.md`中通过以下链接添加该徽章[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg?style=for-the-badge&logo=julia&labelColor=202020)](https://github.com/invenia/BlueStyle)

`````plaintext
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg?style=for-the-badge&logo=julia&labelColor=202020)](https://github.com/invenia/BlueStyle)
`````
}

\toc

## 语法概要

- 用\snote{4个空格}缩进
- 一行\snote{92}个字符
- 模块名和类型名用\snote{大骆驼}命名格式
- 方法名用\snote{小写字母+下划线}的形式(\serror{注意区别于官方规则: 官方建议尽量不用下划线})
- 用\snote{using}引入模块, 每个模块一行, 在文件的开头引入
- 写尽可能详细的\snote{注释}
- 合理利用空格增加代码可读性
- 行尾不要空格
- 避免括号后追加空格: `Int64(value)` 好过 `Int64( value )`

## 详细规则

### 代码规范

#### 模块引入

> \snote{[:推荐示例](#YesModule)} \serror{[:不推荐示例](#NoModule)}

- 每次引入一个
- 根据模块名字字母排列
- 引入的函数按照字母或者实际意义顺序排列
- 引入内容很长时, 可以按照合理规则分组
- 推荐用`using`而不是用`import`


\herror{using和import的区别}{
    二者唯一的区别是, using引入的module, 调用其内部函数时需要加module名, 而import引入的则不需要:
```julia
# Yes:
using Example

Example.hello(x::Monster) = "Aargh! It's a Monster!"
Base.isreal(x::Ghost) = false

# No:
import Base: isreal
import Example: hello

hello(x::Monster) = "Aargh! It's a Monster!"
isreal(x::Ghost) = false
```
}


# :x YesModule

\julia{
using A
using B

using Dates: Year, Month, Week, Day, Hour

using AVeryLongPackage: AVeryLongType, AnotherVeryLongType, a_very_long_function,
    another_very_long_function
# or
using AVeryLongPackage: AVeryLongType, AnotherVeryLongType
using AVeryLongPackage: a_very_long_function, another_very_long_function
}

# :x NoModule

\julia{
using A, B
# or
using B
using A

using AVeryLongPackage:
    AVeryLongType,
    AnotherVeryLongType,
    a_very_long_function,
    another_very_long_function

using AVeryLongPackage: AVeryLongType
using AVeryLongPackage: AnotherVeryLongType
using AVeryLongPackage: a_very_long_function
using AVeryLongPackage: another_very_long_function
}

#### 函数输出

- 函数输出语句需要放在模块的头部, 在引入依赖以后;
- 不要对一个`export`语句换行, 要么一行一个, 要么按需分组;
\indent{2em}{

```julia
# Yes:
export foo
export bar
export qux

# Yes:
export get_foo, get_bar
export solve_foo, solve_bar

# No:
export foo,
    bar,
    qux
```
}

#### 全局变量

- 尽量避免使用全局变量;
- 如果需要使用, 加前缀`const`, 命名规则为\snote{全部大写};
- 全局变量在文件的头部位置定义, 紧跟在`imports`和`exports`之后

#### 函数命名

- 函数名需要能表示函数的属性或者功能, 不需要体现参数类型: `submit_bid(bid)`应该改成`submit(bid::Bid)`;
- 函数名尽量控制在\snote{一到两个单词}内, 小写加下划线分隔;
- 函数越简单约好, 尽量把复杂函数拆分;
- 只用于内部使用的函数,用**下划线开头**;

#### 方法定义

- 只有在函数非常短的时候, 才用短函数定义方式
\indent{2em}{
    ```julia
    # Yes:
    foo(x::Int64) = abs(x) + 3

    # No:
    foobar(array_data::AbstractArray{T}, item::T) where {T<:Int64} = T[
        abs(x) * abs(item) + 3 for x in array_data
    ]
    ```
}

- 用长函数定义的语法时, 用`return`显式返回, 且显式声明返回值:
  
\indent{2em}{
```julia
# Yes:
function Foo(x, y)
    # code ...
    return nothing
end
```
}

- 参数列尽量不要换行, 除非特别长, 如果要换行, 就要每个参数一行,或者按照位置参数和关键字参数分组换行, 不要随意地到长度限制再换行:

\indent{2em}{
```julia
# Yes:
function foobar(
    df::DataFrame,
    id::Symbol,
    variable::Symbol,
    value::AbstractString,
    prefix::AbstractString="",
)
    # code
end

# Ok:
function foobar(df::DataFrame, id::Symbol, variable::Symbol, value::AbstractString, prefix::AbstractString="")
    # code
end

# No: Don't put any args on the same line as the open parenthesis if they won't all fit.
function foobar(df::DataFrame, id::Symbol, variable::Symbol, value::AbstractString,
    prefix::AbstractString="")

    # code
end

```
}

- 关键字参数需要用`;`和位置参数区分开

#### 空格

- 紧跟着各种括号内部**不要**空格: `foo(ham[1],[eggs])`好过`foo( ham[ 1 ], [ eggs ] )`
- 逗号和分号前面不要加空格;
- 比较和赋值等二元操作符两端要加空格, `=`,`+=`,`==`, `->`等;
- 一些数值相关的二元操作符两侧不加空格, `^`, `//`, `-1`;
- 在`Range`定义中, `:`两侧不要加空格, 复杂的Range定义用括号括起来, 避免歧义: `(1+2):(3+4)`
- 不要为了对齐引入超过一个的空格:
\indent{2em}{
```julia
# Yes:
x = 1
y = 2
long_variable = 3

# No:
x             = 1
y             = 2
long_variable = 3
```
\hwarn{个人感悟}{
    我经常为了对齐, 加各种空格, 这样好看, 也方便批量修改, 为啥不呢?
}

}

- 不要引入不必要的空行, 比如同一个函数的不同单行分派之间不需要换行;
- 如果函数调用语句中, 参数过长(比如嵌套函数), 则要按照如下规则换行: \snote{函数的左右括号要在同一缩进水平, 参数要多缩进一级, 参数和关键字在多数情况下应该每个一行。}

\indent{2em}{
```julia
constraint = conic_form!(
    SOCElemConstraint(temp2 + temp3, temp2 - temp3, 2 * temp1),
    unique_conic_forms,
)
```
}

- 数组或者元组定义的时候, 括号缩进规则类似:

\indent{2em}{
```julia
arr = [
    some_long_sub_array_A,
    some_long_sub_array_B,
]

nestedarr = [
    [
        some_long_A,
        some_long_B
    ],
    [
        another_long_A,
        another_long_B
    ]
]
```
}

- 三引号, 三反引号需要缩进:

\indent{2em}{
`````plaintext
str = """
    hello
    world!
    """
cmd = ```
    program
        --flag value
        parameter
    ```
`````
}

- 用空行分隔不同的`多行代码块`:

\indent{2em}{
```julia
# Yes:
if foo
    println("Hi")
end

for i in 1:10
    println(i)
end

quote
    x = 1
    y = 2
    a = x + y
end
```
}

- 在控制流和返回语句之间添加空行:

\indent{2em}{
```julia
function foo(bar; verbose=false)
    if verbose
        println("baz")
    end

    return bar
end
```
}

#### 数据结构和控制流

- 具名元组中的`=`类似于关键字参数的用法, 两端不加空格, 空具名元组应该写成`NamedTuple()`而不是`(;)`
- 浮点数不要省略小数点前后的0: `0.1, 2.0`而不是`.1 2.`
- 三元操作符`?:`只能用于单行语句, 如果语句超过单行, 则应该用传统的`if elseif else`的方式
- `for`循环中应该只用`in`关键词, 尽量不要用 `=`或者`∈`, 在列表展开式中也适用

#### 类型标注

- \Snote{类型标注需要尽可能的抽象},而不是尽可能的具体
- 如果需要性能, 则可以用`类型参数`的方式:

\indent{2em}{
```julia
# 类型参数
mutable struct MySubString{T<:AbstractString} <: AbstractString
    string::T
    offset::Integer
    endof::Integer
end
# 相比于传统方式:
mutable struct MySubString <: AbstractString
    string::AbstractString
    offset::Int
    endof::Int
end
```
\note{在类型参数的情况下, 数据结构在定义的时候就确定了, 在整个生命周期中数据类型是限定了的, 所以会有更好的性能优化。可以在开发的时候使用下边这种抽象类型, 在优化的时候再改成类型参数的模式。}
}

#### 版本声明

为了保持简洁和一致性, 声明版本的时候不要使用脱字符`^`:

```julia
# Yes:
DataFrames = "0.17"

# No:
DataFrames = "^0.17"
```

#### 代码注释

- 注释是用来解释(复杂的)代码的逻辑的, 不要在简单代码上也过度注释
- 注释要随着代码的更新而更新
- 注释应该是完整的语句, 首字母大写(除非首字母小写有特殊意义, 比如是代码中的指示词/变量)
- 短注释的末尾句号`.`可以省略, 块注释需要在每句结尾加上句号
- 如果注释不能保证在与代码同行时不超过单行限制, 就不要把注释写在代码同行
- 注释与同行代码之间至少要有\Snote{两个}空格, `#`与注释内容之间有\Snote{一个}空格
- 提到`Julia`的时候, 通常`Julia`指代Julia语言, `julia`指代Julia可执行命令

#### 文档

- 大多数模块、类型、函数都应该有规范的`docstrings`(尤其是需要export的函数), 但是内嵌函数或者很简单的函数不需要额外添加`docstrings`
- 给一个函数添加文档, 而不是给函数的一个方法添加文档
- 只有新方法与老方法有区别时, 才给已有文档的函数的新方法添加文档
- 文档需要用`Markdown`格式书写, 同样遵守`92 chars`的规则
- 复杂参数的方法建议用以下文档模板:

\indent{2em}{

```julia
"""
    mysearch(array::MyArray{T}, val::T; verbose=true) where {T} -> Int

Searches the `array` for the `val`. For some reason we don't want to use Julia's
builtin search :)

# Arguments
- `array::MyArray{T}`: the array to search
- `val::T`: the value to search for

# Keywords
- `verbose::Bool=true`: print out progress details

# Returns
- `Int`: the index where `val` is located in the `array`

# Throws
- `NotFoundError`: I guess we could throw an error if `val` isn't found.
"""
function mysearch(array::AbstractArray{T}, val::T) where T
    ...
end
```

如果参数过多, 可以不用在文档首行中列出:

```julia
"""
    Manager(args...; kwargs...) -> Manager

A cluster manager which spawns workers.

# Arguments

- `min_workers::Integer`: The minimum number of workers to spawn or an exception is thrown
- `max_workers::Integer`: The requested number of workers to spawn

# Keywords

- `definition::AbstractString`: Name of the job definition to use. Defaults to the
    definition used within the current instance.
- `name::AbstractString`: ...
- `queue::AbstractString`: ...
"""
function Manager(...)
    ...
end
```

> 更多文档相关的规范参考[官方文档](https://docs.julialang.org/en/v1/manual/documentation/)

}


### 测试规范

- 测试组

\indent{2em}{
Julia中提供了[测试组(test sets)](https://docs.julialang.org/en/v1/stdlib/Test/#Working-with-Test-Sets-1)来方便用户按照应用逻辑对测试代码进行分组。`runtests.jl`文件最好只包含一个`主测试组`, 其他分组可以嵌套在主分组内。
}

- 比较操作

\indent{2em}{
大多数测试会写成`@test x == y`的形式, `==`不会进行类型检查, 所以`@test 1.0 == 1`是可以通过的, 所以不必要为了类型一致牺牲代码可读性:

```julia
# Yes:
@test value == 0

# No:
@test value == 0.0
```
}



### 性能和优化

> 参考官方的[Julia性能建议](https://docs.julialang.org/en/v1/manual/performance-tips/)

Julia中很多性能提升都是来自于`针对输入类型对实际调用函数进行优化`。

- 尽量不要声明全局变量(会阻碍Julia进行代码优化), 如果要声明, 加上前缀`const`
- 第一次实际调用某函数时, 会根据输入类型编译该函数, 所以测试函数性能不应该测试其第一次执行的性能, `BenchmarkTools`中的`@benchmark`和`@btime`宏可以执行多次函数, 得到更客观的性能测试结果

### 编辑器配置推荐

- Sublime Text 推荐配置: [点这里](https://github.com/invenia/BlueStyle#sublime-text-settings)
- Vim 推荐配置: [点这里](https://github.com/invenia/BlueStyle#vim-settings)
- Atom 推荐配置: [点这里](https://github.com/invenia/BlueStyle#Atom-settings)
- VSCode 推荐配置: [点这里](https://github.com/invenia/BlueStyle#vs-code-settings), 推荐使用[Julia VS-Code插件](https://github.com/julia-vscode/julia-vscode)

