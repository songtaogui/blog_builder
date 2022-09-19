+++
title = "add_visitor_stat_to_my_blog"
tags = ["blog","hack"]
summary = """
    Using busuanzi.js to stat the visitors in my blog.
    """
pubdate = Date("2022-08-20")

showall = true

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

\bhack{1. Add script source to `stylesheets.html`:}{
\html{
<!-- busuanzi -->
<script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
}
}

\bhack{2. Add whole site stats to `page_foot.html`:}{
\html{
<div class="container">
  <footer class="site-footer">
    <p class="powered-by">
      Total visits: <span id="busuanzi_value_site_pv"></span>.<br>
      Built with <a href="https://franklinjl.org" target="_blank" rel="noopener">Franklin.jl</a> and <a href="https://julialang.org" target="_blank" rel="noopener">Julia</a>.<br>
      The text is licensed under <a href="http://creativecommons.org/licenses/by-sa/4.0/">CC BY-SA 4.0</a>.<br>
      The code is licensed under the <a href="https://mit-license.org/">MIT License</a>.<br>
      <strong>&copy; {{ fill author }}</strong>. Last modified: {{ fill fd_mtime }}. 
    </p>
  </footer>
</div>
}
}

\bhack{3. Add each post stats to the tag div through `utils.jl`}{
\julia{
@delay function hfun_page_tags()
    pagetags = globvar("fd_page_tags")
    pagetags === nothing && return ""
    io = IOBuffer()
    tags = pagetags[splitext(locvar("fd_rpath"))[1]] |> collect |> sort
    several = length(tags) > 1
    write(io, """<div class="tags">$(hfun_svg_tag())""")
    for tag in tags[1:end-1]
        t = replace(tag, "_" => " ")
        write(io, """<a href="/tag/$tag/">$t</a>, """)
    end
    tag = tags[end]
    t = replace(tag, "_" => " ")
    write(io, """<a href="/tag/$tag/">$t</a>&nbsp;&nbsp;&nbsp;&nbsp;""")
    write(io, """$(hfun_svg_view())""")
    # add view times busuanzi:
    write(io, """<span id="busuanzi_value_page_pv"></span>""")
    write(io, """</div>""")
    return String(take!(io))
end
}
}