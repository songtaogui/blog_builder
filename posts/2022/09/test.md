+++
title = "test"
tags = ["random","daily","hacks"]
summary = """
     Put short description to your post here,
    will be show in the post list,
    and the rss info
    """
pubdate = Date("2022-09-28")

# showall = true
# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

# >>>>CONTROLS>>>>
hasnutshell = false
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



I am a test string {{citebib 1981-Pandey-Evolution-NP 1993-Pla-Cisregulatory-PMB}}. Me toooo!

I am another ref {{citebib 1991-Les-Molecular-PNASUSA}}. wahaha.


\julia{

#=
Make Citation smoothly in My Franklin Blog
=#

#=
## Local bib db based citation:

1. parse all local bib, with citekey as key
2. get only first three authors
3. add urls to title
4. parse page var of nutshellcitation for output nutshellcitation
5. use (author et al., year[a-z]) format citeindex
6. sort bibliography alphabetically
=#

function loadbib(db::String)
    # check = :error :warn :none
    return BibParser.parse_file(db, :BibTeX; check=:none)
end

# const CITEDB = loadbib(CITEDBFILE)
const CITEDB = loadbib("_assets/citedb/test.bib")

function fmtidx(idx::String, name::String; format="normal")
    if !haskey(CITEDB, idx)
        @error "No ref information in the database for $k"
        name = "ERROR"
    end

    return """<a href="#$idx">$(name)</a>"""
end

function hfun_citebib(ks)
    rpath = Franklin.FD_ENV[:CUR_PATH]
    idxpath = replace(rpath, r"\.md$" => ".citedb")
    indexes = Vector{Any}()
    open(idxpath, "a") do io
        for k in ks
            curbib = CITEDB[k]
            curbib_year = curbib.date.year
            curbib_first_author = curbib.authors |> first
            curbib_etal = length(curbib.authors) > 1 ? " et al. " : " "
            outname = curbib_first_author.last * curbib_etal * curbib_year
            write(io, "$(k)\n")
            curidx = fmtidx(k, outname)
            push!(indexes, curidx)
        end
    end
    final_index = join(indexes, ", ")
    return """
        <span>
            ($final_index)
        </span>
        """
end

function fmtreflist(idx::String)
    refstr = ""

    if !haskey(CITEDB, idx)
        @error "No ref information in the database for $k"
        refstr = "ERROR: No ref information in the database for $k"
    else
        curbib = CITEDB[idx]
        curbib_year = curbib.date.year
        etal = " et al. "
        if length(curbib.authors) < 3
            etal = " "
        end
        f3a_str = join([x.last * " " * x.first for x in first(curbib.authors,3)], ", ")
        curbib_first_three_authors = f3a_str * etal
        curbib_pubinfo = join(filter(!isempty,["<span style=\"color:#9970AB\"><i>" * curbib.in.journal * "</i></span>", curbib.in.pages, curbib.in.volume]),", ")
        curbib_title = replace(curbib.title, r"[\{\}]" => "")
        curbib_title = """<a href="#$(idx)"><strong>$(curbib_title)</strong></a>"""
        refstr = """
            <span>$(curbib_first_three_authors) ($(curbib_year)). $(curbib_title). $(curbib_pubinfo)</span>
            """
    end

    return """
        <li id="$(idx)">
            $refstr
        </li>
        """
end

function hfun_citebiblist()
    rpath = Franklin.FD_ENV[:CUR_PATH]
    idxpath = replace(rpath, r"\.md$" => ".citedb")
    reflist = "<h2>References</h2>"

    if !isfile(idxpath)
        @error "No indexes found in $idxpath !"
        reflist *= """
            <span style="color:#A50026">ERROR</span>
            """
        return reflist
    end

    for curidx in unique(readlines(idxpath))
        reflist *= fmtreflist(curidx)
    end

    return reflist
end # func hfun_citebiblist


}

\br{2}



{{citebiblist}}