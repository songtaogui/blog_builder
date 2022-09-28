+++
title = "Julia中的反模式"
tags = ["julia","hack"]
summary = """
    低配翻译Julia大佬Frames的博客.
    """
pubdate = Date("2022-09-21")

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

> 原文地址: [HERE](https://www.oxinabox.net/2020/04/19/Julia-Antipatterns.html)

\hhack{什么是"反模式"}{"反模式"是随着"设计模式"的概念而出现的词, 指\cwarn{在实践中明显出现, 但低效或有待优化的设计模式, 是用来解决问题的带有共性的不良方法}(参考[WIKI](https://zh.m.wikipedia.org/zh-hans/%E5%8F%8D%E9%9D%A2%E6%A8%A1%E5%BC%8F)定义)。}

这篇博文中, 作者主要列举了Julia中四大反模式:[^1]

\toc


接下来将一一介绍。

## 未实现异常(NotImplemented Exceptions)

在julia中, 如果用一个未定义某函数方法的类去调用该函数, 会抛出未实现的错误:

\julia{
function foo(x::Int) return x + 1 end
foo("abc") #This caused a methodError, since String is not a type implementing the function foo
}

通常这可以提供非常有用而且明确的信息, 但有时候也会给用户debug带来问题, 考虑以下例子:

\julia{

abstract type AbstractModel end

"""
    probability_estimate(model, observation::AbstractArray)::Real

For a given `model`, returns the likelihood of the `obervation` occurring.
"""
function probability_estimate(model::AbstractModel, observation::AbstractArray)
    error("`probability_estimate` has not been implemented for $(typeof(model))")
end

## 现在定义一个使用该函数的新类型
"""
    GuessingModel <: AbstractModel

A model that just guesses. Not even educated guesses. Just random guessing.
"""
struct GuessingModel <: AbstractModel
end

probability_estimate(guesser::GuessingModel, observation::AbstractMatrix) = rand()

## GuessingModel类型下调用该函数:
probability_estimate(GuessingModel(), [1,2,3])
## 会报错:
## `probability_estimate` has not been implemented for GuessingModel
}

很奇怪吧, 明明定义了`GuessingModel`对应的函数方法, 为啥会报这个错误? 细心的读者可能早发现了, 原因是定义`GuessingModel`对应的`probability_estimate`方法时, 传入的第二个参数是`AbstractMatrix`, 但是在调用时, 第二个参数是`Vector`类型, 所以实际上调用的最开始适用于`AbstractModel`的方法。但是这个报错对解决这个BUG基本上没有帮助(反而还会误导)。

\binfo{如何避免出现错误的未定义报错?}{
最直接的, 不要引入不必要的类型标注, 但是很多时候是需要详细的类型标注的. 这时, 我们可以预先定义一个没有任何行为的泛型函数, 然后再通过多重分派定义新的方法:
\julia{
"""
    probability_estimate2(model, observation::Vector)::Real

For a given `model`, returns the likelihood of the `observation` occurring.
"""
function probability_estimate2 end

probability_estimate2(guesser::GuessingModel, observation::AbstractMatrix) = rand()
}
这时再调用`probability_estimate2(GuessingModel(), [1,2,3])`, 报错就会更加清晰:
\error{
```plaintext                                                                 
No method matching `probability_estimate2` with arguments types: 
   (1) ::GuessingModel                                           
   (2) ::Vector                                                  
                                                                 
No alternative candidates found                                  
```                                                              
}
}


## 宏编程的滥用

\warn{这里的反模式并不适用于`@inbounds`, `@simd`, `@fastmath`等底层的性能宏, 而是针对能写成函数的情况下, 自己编写的宏。}

Julia中宏编程的初衷并不是性能提升, 而是语法转换: `@view xs[4:end]`会被转成`view(xs, 4:lastindex(xs))`, 这种对`end`的转换在`function`中是无法实现的。

但是, 现在很多人认为写宏会比写函数更快。(作者认为这很可能是由于90年代C语言的影响造成的, 彼时是通过宏进行inline操作, 从而在编译时可获得更好的性能提升)

2019年的Julia大会上, Steven G. Johnson教授在关于"[Adventures in Code Generation](https://www.youtube.com/watch?v=mSgXWpvQEHE)"的演讲上的说法就很有参考意义:

~~~
<iframe width="560" height="315" src="https://www.youtube.com/embed/mSgXWpvQEHE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
~~~

\bnote{函数相比于宏的优势}{

1. **更熟悉更易读**: 大部分用户更熟悉函数;
2. **高扩展性**: 函数更容易进行多重分派, 宏基本上很难扩展;
3. **更容易理解**: 函数的基本行为是类似的, 但不同的宏可能内部逻辑大相径庭;

}

\bwarn{例外情况}{

有时候不得不使用宏:
- 性能非常重要;
- 字面量解析花费大量时间;

举个栗子:

\julia{

using BenchmarkTools

# performance using function
compute_poly(x, coeffs) = sum(a * x^(i-1) for (i, a) in enumerate(coeffs))
@btime compute_poly(1, (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17))

# performance using macro
macro compute_poly(x, coeffs_tuple)
    # a*x^i
    Meta.isexpr(coeffs_tuple, :tuple) || ArgumentError("@compute_poly only accepts a tuple literal as second argument")
    coeffs = coeffs_tuple.args
    terms = map(enumerate(coeffs)) do (i, a)
        a = coeffs[i]
        if a isa Number && x isa Number # it is a literal compute at compile time
            a * x ^ (i-1)
        else
            # an expression, so return an expression
            esc(:($a * $x ^ $(i-1)))
        end
    end
    if all(x isa Number for x in terms)
        # Whole thing can run at compile time
        return sum(terms)
    else
        return Expr(:call, :+, terms...)
    end
end

@btime @compute_poly(1, (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17))

}

宏为啥这么写我暂时还看不太明白, 只需要知道它快就好了:

在我的笔记本上, 函数版用时`~70ns` 宏版用时`1.5ns`;

}

## 哈希/字典的误用

作者表示经常看到有人用字典`Dict{Symbol}`或`Dict{String}`只是用来存储固定的变量(他们想把这些变量打包在一起, 比如配置参数, 模型超参数等)。在Julia 0.7版之前, 这甚至是被提倡的(如果不构建`struct`的话)。这实际上会引发至少两个问题:

\btodo{1. 引入可变状态(mutable state)}{
- 编写代码的时候, 必须时刻保证所有的操作都不会改变存在Dict中的值;
- 在大型项目中, 还要无条件相信别人不会错误地改变Dict中的值;

用**不可变的数据结构**.

}
\btodo{2. 性能变差}{
用Dict虽然可以在`O(1)`的常量时间尺度下赋值和取值, 但这个常量时间通常也不会很短, Dict需要计算Hash, `Symbol`类型的Hash过程很快, 但`String`类型的会慢一些, 如果存储更复杂的结构, hash有可能很慢:

\julia{
dict = Dict([:a=>1, :b=>2, :c=>3, :d=>4, :e=>5])
@btime $(dict)[:d]; # 5ns

str_dict = Dict(string(k)=> v for (k,v) in dict)  # convert all the keys to strings
@btime $(str_dict)["d"]; # 21ns
}

一个可行的替代方案是\ctodo{OrderedCollection包中的LittleDict}, 该结构类似Dict, 但是不会构建hash, 所以比Dict更适用于小集合的存储。

\julia{
using OrderedCollections
little_dict = LittleDict(dict)
@btime $(little_dict)[:d]; # 8ns
}

还可以用`freeze`方法转成不可变类型:
\julia{
frozen_little_dict = freeze(LittleDict(dict))
@btime $(frozen_little_dict)[:d]; # 4ns
}

} 

## 过度类型标注

\hwarn{Frames大佬声明:}{
Julia中的类型标注**只是**用来做\cerror{派发(dispatch)}用的, 如果一个函数没有多种方法, 根本不需要写类型标注! 如果一定要写类型标注, 写的越抽象越好。

\cnote{
NOTE:} 这并不是说类型标注不能用于其他场景, 通常它可以在其他场景被很好地应用。但这不改变它被发明的初衷就是用来做派发的事实。

}

过度类型标注往往来自于以下几个误解:

\herror{误解1: 可以让代码更快}{
Julia的\Swarn{JIT}编译器在优化绝大部分代码的时候是不需要类型限制的, 会根据输入参数对应的具体类型, 优化对应的方法(即针对不同的输入类型生成不同的机器码), 所以不会因为预先标注了类型, 就会有更好的性能优化。而对于非\Swarn{JIT}的高级语言(比如Cython), 预先标注类型可以让其在编译层面作出针对性的优化。

\snote{总之, 由于JIT, julia中真正执行的指令总是针对输入的参数类型优化过的, (这可能也是为啥Julia做静态编译库很困难的主要原因吧)}
}


\herror{误解2: 让代码更安全}{
对静态语言来说, 类型标注毫无疑问是\Swarn{类型安全}的保障(所有可能的问题都在编译期暴露出来)。Julia不是静态类型语言, 也不是预编译语言, 很多bug会在
\snote{执行到具体命令的时候}才报出来。所以添加类型标注并不会让代码更安全。

\binfo{个人想法}{
我认为, 这也许是julia相对于其他语言的一个不足, 但无伤大雅, 因为bug总会暴露出来, 牺牲了在编译期Debug的优势, 换来的是超强的表现力和扩展性, 稳赚好么。Rust的编译器教做人的痛苦, 谁用谁知道。
}

}

\herror{误解3: 让代码更易读(实际上是对的,但...)}{
添加类型标注确实可以让代码更易读, 确实是的。但我们也可以通过其他方法让代码更已读:

- 写详细的文档: Julia的documentation有多强大, 用过的都知道;
- 写好注释: 众所周知, 写代码最多时候都是在写注释;

\binfo{个人想法}{
最开始学Julia的时候, 我恨不得每个变量都加上类型标注, 反而不易读了, 通篇很多`:`,`{}`,`()`,`<:`, 跟Perl一样让人眼花。
}

}

最后, 作者举了几个例子直观表示类型标注有可能带来的问题:

\hinfo{示例1: 约束了AbstractVector, 实际上更想要的是iterator}{

\julia{
function my_average(xs::AbstractVector)
    len = 0
    total = zero(eltype(xs))
    for x in xs
        len += 1
        total += x
    end
    return total/len
end

# error when input tuple:
my_average((1,2,3))

# error when input type unions:
data = [1, 2, 3, missing, 5, 4] # typeof(data) = Vector{Union{Missing, Int64}}
nmdata = skipmissing(data) # typeof(nmdata) = Base.SkipMissing{Vector{Union{Missing, Int64}}}
my_average(nmdata) # type error

}

在这个例子中, 指定了`my_average`函数适用于`AbstractVector`类型, 但是实际上, 有很多可以迭代的类型是不属于`AbstractVector`的, 如果用collect(itr)把他们转成`AbstractVector`又会增加不必要的内存分配, 降低代码性能。

}

\hinfo{示例2: 用`AbstractVector{<:Real}`而不是`AbstractVector`进行多重派发}{

\julia{
using BenchmarkTools
function indmin(x::AbstractVector{<:Real})
    ind=1
    for ii in eachindex(x)
        if x[ii] < x[ind]
           ind = ii
        end
    end
    return ind
end

indmin(1:10)
# the author's returns 385
# but mine correctly returned 1
}

\herror{作者说这里会报错, 而我的并不会}{
可能是在当时的Julia版本(\shack{< V1.6 ?})中, UnitRange{Int64} 并不属于AbstractVector, 但现在属于了吧。 \ctodo{有待验证}。
}

\julia{
data = [1, 2, 3, missing]
indmin(@view(data[1:3]))

# error: @view(data[1:3])返回的数组类型也是Union{Missing, Int64}

}

}



\hinfo{示例3: 函数类型的分派}{

\julia{
apply_inner(func::Function, xss) = [[func(x) for x in xs] for xs in xss]
apply_inner(round, [[0.2, 0.9], [1.2, 1.3, 1.6]]) # works fine
apply_inner(Float32, [[0.2, 0.9], [1.2, 1.3, 1.6]]) # ERROR: Float32 is not a Function
}

为了拓展适用性, 可以把参数类型改成`Base.Callable`, 等同于`Union{Type, Function}`。但这也不是万全之策, 有些可执行的对象也不属于这两类, 如`DiffEqBase.ODESolution`和`Flux.chain`。

}

# 总结

最后, 作者推荐一些julia高性能的参考资料:

- [Julia Performance Tips](https://docs.julialang.org/en/v1/manual/performance-tips/)
- 遵守一个格式规范, 比如作者推荐的[BlueStyle](https://github.com/invenia/BlueStyle)
- 作者的另一篇博文: [Continuous Delivery](https://www.oxinabox.net/2019/09/28/Continuous-Delivery-For-Julia-Packages.html)

还得修炼啊!
