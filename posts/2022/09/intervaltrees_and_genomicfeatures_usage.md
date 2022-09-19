+++
title = "IntervalTrees and GenomicFeatures usage"
tags = ["julia","bioinformatics"]
summary = """
    Basic usage of BioJulia IntervalTrees.jl and GenomicFeatures.jld
    """
pubdate = Date("2022-09-13")


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

# IntervalTrees.jl

## Interval Tree

Interval tree is a tree data structure to hold intervals. It allows efficiently search for overlappings. Learn more about Interval tree structure [HERE](https://en.wikipedia.org/wiki/Interval_tree).

## IntervalTrees.jl

> [Offical tutorial](https://biojulia.net/IntervalTrees.jl/stable)

### Types

- `AbstractInterval{T}`: must have `first` and `last` function, and first <= last;
- `Interval{T} <: AbstractInterval{T}`: simple interval, with only first and last methods, `Base.convert` was dispatched to convert `AbstractRange` to `Interval`
- `IntervalValue <: AbstractInterval`: interval with value, `first`, `last`, `value`
- `IntervalTree{K, V}`: dict like structure, stores intervals of type V that have start and end posi of type K, interval K as keys.
- `IntervalMap{K, V}`: typealias of `IntervalTrees{K, IntervalValue{K, V}}`

### Creating

\julia{
# creat empty interval trees
xs = IntervalTree{Int, Interval{Int}}()
# push!
push!(xs, Interval{Int}(500, 1000))

# bulk insertion: should be sorted before
# since the default generator of IntervalTree is IntervalBTree, which use sorted intervals
intervals = [Interval{Int}(x, y) for (x,y) in zip(1:50:151,50:50:200)]
sort!(intervals)
xs = IntervalTree{Int, Interval{Int}}(intervals)

# IntervalMaps
xs = IntervalMap{Int, String}()
xs[(1,100)] = "Low"
xs[(101,1000)] = "Medium"
xs[(1001, 10000)] = "High"
}

### Operations

\julia{
# All standard dict operations could be used to IntervalTree:

# key => value:
xs[Interval(1,100)] # get IntervalValue(1,100,"Low")

# get function, set default value if not found:
get(xs, (1001, 10000), "Not found")

# delete
delete!(xs, (1,100))

# keys & values
keys(xs) # gets Interval{firt, last}
values(xs) # gets values

# Iterating

# normal iterating
for x in xs
    # x is a IntervalValue type
    println("Interval $(x.first), $(x.last) has value $(x.value)")
end

# down limits
from(T::IntervalTree, query::Int)
## return iterator that with subset of T that end >= query

# Intersection

intersect(T::IntervalTree, query::(Any,Any))
intersect(T1::IntervalTree, T2::IntervalTree)
hasintersection(T, position)

}

\berror{Offical tutorial out of date}{
1. Offical tutorial said that we could both create and query IntervalTree through normal range: `(1, 100)`, however in my test, we could only query through `Interval` type: `xs[Interval(1,100)]`;
2. `xs[Interval(1,100)]` returns `IntervalValue(1,100,"Low")`, NOT `"Low"` as said by the offical tutorial;
3. `get` function could use normal range `(1,123)`, maybe because `get` function triggers auto-type-promote?
4. there are no `set` function now!
}


# GenomicFeatures.jl

> Build based on IntervalTrees.jl, but expanded to fit biology regions: chr start end strand metadata ...
> Offical usage: [HERE](https://biojulia.net/GenomicFeatures.jl/stable)

## Types

\bnote{`Interval{T} <: IntervalTrees.AstractInterval{Int64}`}{

\julia{
seqname::String
first::Int64
last::Int64
strand::Strand
metadata::T
}

Strand:

| Symbol | ConstranT   | Meaning                     |
| ------ | ----------- | --------------------------- |
| '?'    | STRAND_NA   | strand unknown              |
| '+'    | STRAND_POS  | positive strand             |
| '-'    | STRAND_NEG  | negative strand             |
| '.'    | STRAND_BOTH | non-strand-specific feature |


\julia{
# To define an Interval: 
Interval("chr1", 1, 100)
Interval("chr1", 1, 100, '+')
Interval("chr1", 1, 100, '+', "gene abc")

# some method on Interval
seqname(i)        # i.seqname
leftposition(i)   # i.first
rightposition(i)  # i.last
strand(i)         # i.strand
metadata(i)       # i.metadata
}
}

\btip{ `intervalCollection`: collection of intervals }{

\Stip{The most important structure in the package.}

\julia{
# structure
trees::Dict
length::Int64
ordered_trees::Vector
ordered_trees_outdated::Bool

# create
col = IntervalCollection{Nothing}()
## normal push!
for i in 1:10:100
    push!(col, Interval("chr1", i, i + 9))
end
## list expansion: which is faster
## should be SORTED vector of Intervals
col = IntervalCollection([Interval("chr1", i, i + 9) for i in 1:10:100])

# filtering
predicate(i) = isodd(leftposition(i))
selected = IntervalCollection(Base,Iterators.filter(predicate, col))
selected = IntervalCollection([x for x in col if predicate(x)])

# overlap query

# isoverlap(interval_a, interval_b)
isoverlapping(Interval("chr1",1,100), Interval("chr1",50, 51))

# eachoverlap()
eachoverlap(a::IntervalCollection{T}, query::Interval; filter)
eachoverlap(a::IntervalCollection, b::IntervalCollection; filter)
eachoverlap(intervals_a, intervals_b, seqname_isless; filter)

# coverage
coverage(ic::IntervalCollection)
coverage(stream, seqname_isless::Function)
}
}