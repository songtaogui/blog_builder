using BibParser
using Formatting
using FranklinUtils
using HTTP
using PlutoStaticHTML

const CITEDBFILE = "_assets/citedb/ref.bib"
const AUTHOR = "Gui Songtao"

include("src/WebIO.jl")
include("src/Academic.jl")
include("src/Citation.jl")
# include("src/Slides.jl")
