+++
title = "HyperGraphs_in_julia"
# tags = [ "programming","bioinformatics","genetics","paper","work","daily","random","insight", ... ]
tags = ["programming", "julia", "graphic", "learn"]
showall = true
summary = """
  HyperGraphs and related algorithms in julia!
  """
rss = summary
# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasnutshell = false
hasplotly = false
hasmermaid = false
hascomment = true

pubdate = Date("2022-08-15")
+++

{{page_tags}}


## Core

### Structure

#### 抽象类型:

- AbstractHyperGraph
- AbstractHyperEdge
- AbstractIncidenceSet

#### 实体类型:

\bnote{无向, 无权重的超图, 允许自连, 可以为空}{
- HyperEdge
- HyperGraph
- SpeciesSet
- ChemicalHyperEdge
- ChemicalHyperGraph
}

- HyperEdge

```julia
mutable struct HyperEdge{T} <: AbstractHyperEdge
    V::AbstractVector{T}
end
HyperEdge(v::T) where {T} = HyperEdge{T}([v])
HyperEdge{T}() where {T} = HyperEdge{T}([]) # 空
HyperEdge() = HyperEdge{Any}([]) # 空
Base.:(==)(e1::HyperEdge, e2::HyperEdge) = isequal(vertices(e1), vertices(e2)) # 两个超边中的定点相等则两个超边相等
Base.eltype(::HyperEdge{T}) where {T} = T 
multiplicity(v, e::HyperEdge) = num_has_vertex(e, v) 
# count how many times a vertex appears in a hyperedge, according to function f on that hyperedge
num_has_vertex(e::T, v; f::Function=vertices) where {T<:AbstractHyperEdge} = count(_v -> _v == v, f(e))
num_has_vertex(x::T, v; f::Function=vertices) where {T<:AbstractHyperGraph} = sum(vcat([HyperGraphs.num_has_vertex(e, v, f=f) for e in hyperedges(x)]...))
```

- HyperGraph

```julia
# 包含顶点和边
mutable struct HyperGraph{T} <: AbstractHyperGraph
    V::AbstractVector{T}
    E::AbstractVector{HyperEdge{T}}
end
HyperGraph(v::T, es::AbstractVector{HyperEdge{T}}) where {T} = HyperGraph{T}([v], es) # 一个v对多个e
HyperGraph(vs::AbstractVector{T}, e::HyperEdge{T}) where {T} = HyperGraph{T}(vs, [e]) # 多个v对一个e
HyperGraph(v::T, e::HyperEdge{T}) where {T} = HyperGraph{T}([v], [e])
HyperGraph(es::AbstractVector{HyperEdge{T}}) where {T} = HyperGraph(union(vertices(es)...), es) # 自连
HyperGraph(e::HyperEdge{T}) where {T} = HyperGraph(union(vertices(e)), e) #自连
HyperGraph{T}() where {T} = HyperGraph{T}([], []) # 空
HyperGraph() = HyperGraph{Any}([], [])
(::Type{HyperGraph{T}})(e::HyperEdge{T}) where {T} = HyperGraph(e)
(::Type{HyperGraph{T}})(es::AbstractVector{HyperEdge{T}}) where {T} = HyperGraph(es)
Base.:(==)(x1::HyperGraph, x2::HyperGraph) = isequal(vertices(x1), vertices(x2)) && isequal(hyperedges(x1), hyperedges(x2))

Base.eltype(::HyperGraph{T}) where {T} = T
```

- SpeciesSet
