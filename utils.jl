using FranklinUtils
using BibParser
# using Bibliography
# ----------------------------------- #
# Academic blocks // General elements #
# ----------------------------------- #

@env function section(md; name="", class="wg-$name",rowclass="")
    id = Franklin.refstring(name)
    return html("""
        <section id=\"$id\" class=\"home-section $class\">
          <div class="container">
            <div class="row $rowclass">""") * md * html("""
            </div>
          </div>
        </section>""")
end

@lx function sectionheading(title; class="")
    return html("""
        <div class="$class section-heading"><h1>$title</h1></div>
        """)
end

# Insert an image with given class, alt, src
@lx img(src; class="", alt="") = html("""<img class="$class" src="$src" alt="$alt">""")

# ---------------------------------------- #
# Academic blocks // Landing page elements #
# ---------------------------------------- #

# Portrait block with a few optional fields: name, job title, social buttons
@lx function portrait(; name="", job="", link="", linkname="",
                     twitter="", gscholar="", github="", linkedin="")
    io = IOBuffer()
    write(io, html("<div class=portrait-title>"))
    isempty(name) || write(io, html("<h2>$name</h2>"))
    isempty(job) || write(io, html("<h3>$job</h3>"))
    if !isempty(link)
        if isempty(linkname)
            write(io, html("""<h3><a href="$link" target=_blank rel=noopener><span>$link</span></a></h3>"""))
        else
            write(io, html("""<h3><a href="$link" target=_blank rel=noopener><span>$linkname</span></a></h3>"""))
        end
    end
    if !all(isempty, (twitter, gscholar, github, linkedin))
        write(io, html("<ul class=network-icon aria-hidden=true>"))
        isempty(twitter) || write(io, html("""<li><a href="$twitter" target=_blank rel=noopener><i class="fab fa-twitter big-icon"></i></a></li>"""))
        isempty(gscholar) || write(io, html("""<li><a href="$gscholar" target=_blank rel=noopener><i class="fas fa-graduation-cap big-icon"></i></a></li>"""))
        isempty(github) || write(io, html("""<li><a href="$github" target=_blank rel=noopener><i class="fab fa-github big-icon"></i></a></li>"""))
        isempty(linkedin) || write(io, html("""<li><a href="$linkedin" target=_blank rel=noopener><i class="fab fa-linkedin big-icon"></i></a></li>"""))
        write(io, html("</ul>"))
    end
    write(io, html("</div>"))
    return String(take!(io))
end

# Biography block with optional resume link
@env function biography(md; resume="")
    io = IOBuffer()
    write(io, html("""<h1>Biography</h1>""") * md)
    isempty(resume) || write(io, html("""
        </br><p><i class="fas fa-download pr-1 fa-fw"></i>Download my <a href="$resume" target=_blank>resume</a>.</p>"""))
    return String(take!(io))
end

# Short CV block with a column for interests and one for education
@lx function shortcv(; interests=nothing, education=nothing)
    io = IOBuffer()
    write(io, html("""<div class=row>"""))
    if !isnothing(interests)
        write(io, html("""<div class=col-md-5><h3>Interests</h3><ul class=ul-interests>"""))
        for i in interests
            write(io, html("""<li>$i</li>"""))
        end
        write(io, html("""</ul></div>"""))
    end
    if !isnothing(education)
        write(io, html("""<div class=col-md-7><h3>Education</h3><ul class="ul-edu fa-ul">"""))
        for (course, school) in education
            write(io, html("""
                <li><i class="fa-li fas fa-graduation-cap"></i>
                  <div class=description>
                    <p class=course>$course</p>
                    <p class=institution>$school</p>
                  </div>
                </li>
                """))
        end
        write(io, html("""</ul></div>"""))
    end
    write(io, html("""</div>""")) # end row
    return String(take!(io))
end

# skill featurette
@lx function skill(name, sub=""; img="", fa="",
                   imgstyle="display:inline-block; width:56px;",
                   fastyle="")
    illustration = ""
    if !isempty(img)
        illustration = """<img style="$imgstyle" src="$img">"""
    elseif !isempty(fa)
        illustration = """<i class="fas fa-$fa" style="$fastyle"></i>"""
    end

    return """
        <div class="col-12 col-sm-4">
          <div class=featurette-icon style="text-align:center;">
          """ * illustration * """
          </div>
          <h3>$name</h3>
          $(ifelse(isempty(sub), "", "<p>$sub</p>"))
        </div>""" |> html
end

# experience cards
@lx function experience(; title="", company="", descr="",
                          from="", to="", location="", active=false,
                          first=active, last=false)
    fill = ifelse(active, "exp-fill", "")
    # elements for the vertical bar with filled/unfilled pill
    # they are assembled depending on 'first' so that they can connect.
    pill = """
        <div class=m-2><span class="badge badge-pill border $fill">&nbsp;</span></div>"""
    vbar = """
        <div class="row h-50">
          <div class="col border-right">&nbsp;</div>
          <div class=col>&nbsp;</div>
        </div>"""
    vspace = """
        <div class="row h-50">
          <div class=col>&nbsp;</div>
          <div class=col>&nbsp;</div>
        </div>"""

    return html("""
        <div class="row experience">
          <div class="col-auto text-center flex-column d-none d-sm-flex">
            <!--
              Element next to the card (pill) with a full/empty circle
              to give a visual idea of the timeline
            -->
            $((first ? vspace : vbar) * pill * (last ? vspace : vbar))
          </div>

          <!--
            Card and text
          -->
          <div class="col py-2">
            <div class=card>
              <div class=card-body>
                <h4 class="card-title exp-title text-muted mt-0 mb-1">$title</h4>
                <h4 class="card-title exp-company text-muted my-0">$company</h4>
                <div class="text-muted exp-meta">$from – $to
                  <span class=middot-divider></span><span>$location</span>
                </div>
                <div class=card-text>""") * descr * html("""
                </div>
              </div>
            </div>
          </div>
        </div>""")
end

@lx function certificate(; title="", meta="", metalink="", date="", descr="",
                           cert="See certificate", certlink="")
    origin = ifelse(isempty(metalink), meta, """
        <a href="$metalink" target=_blank rel=noopener>$meta</a>
        """)
    certificate = ifelse(isempty(certlink), "", """
        <a class=card-link href="$certlink" target=_blank rel=noopener>$cert</a>
        """)
    description = ifelse(isempty(descr), "", """
        <div class=card-text>$(Franklin.fd2html(descr, internal=true))</div>
        """)
    return html("""
        <div class="card experience course">
          <div class=card-body>
            <h4 class="card-title exp-title text-muted my-0">$title</h4>
            <div class="card-subtitle my-0 article-metadata">
              $origin
              <span class=middot-divider></span>
              $date
            </div>
            $description
            $certificate
            </div>
          </div>
        """)
end

# -------------------- #
# List of recent posts #
# -------------------- #

# Set global variable `dateformat` to `"post"`, `"yearmonth"`, or `"year"`
# The expected file structures are
# - `"yearmonth"`: posts/YYYY/MM/name-of-post.md
# - `"year"`: posts/YYYY/name-of-post.md
# - `"post"`: posts/name-of-post.md

function all_posts()
    posts = Pair{String,Date}[]
    dateformat = globvar("dateformat"; default="yearmonth")
    for (root, _, files) in walkdir(joinpath(Franklin.FOLDER_PATH[], "posts"))
        for file in files
            endswith(file, ".md") || continue
            ppath = joinpath(root, file)
            endswith(ppath, joinpath("posts", "index.md")) && continue
            spath = splitpath(ppath)
            post = first(splitext(pop!(spath)))
            if dateformat == "yearmonth"
                mm = pop!(spath)
                yy = pop!(spath)
                rpath = joinpath("posts", yy, mm, post)
            elseif dateformat == "year"
                mm = "01"
                yy = pop!(spath)
                rpath = joinpath("posts", yy, post)
            elseif dateformat == "post"
                mm = yy = "01"
                rpath = joinpath("posts", post)
            else
                error("Dateformat $dateformat not supported, use 'post', 'year', or 'yearmonth'")
            end
            
            date = pagevar(rpath, "pubdate")
            isnothing(date) && (date = Date("$yy-$mm-01"))
            push!(posts, rpath => date)
        end
    end
    # sort by chron order, most recent first
    return sort(posts, by=(e->e.second), rev=true)
end

function show_posts(posts; byyear=false)
    isempty(posts) && return ""
    curyear = year(posts[1].second)
    io = IOBuffer()
    byyear && write(io, """
        <div class="col-12 col-lg-4"><h1>$curyear</h1></div>
        <div class="col-12 col-lg-8">
        """)
    for post in posts
        if byyear && year(post.second) < curyear
            curyear = year(post.second)
            write(io, """
                </div>
                <div class="col-12 col-lg-4"><h1>$curyear</h1></div>
                <div class="col-12 col-lg-8">
                """)
        end
        rpath = post.first
        title = pagevar(rpath, "title")
        isnothing(title) && (title = "Untitled")
        summary = pagevar(rpath, "summary")
        isnothing(summary) && (summary = "")
        date = Dates.format(post.second, dateformat"u d, Y")
        imgpath = pagevar(rpath, "img")
        if isnothing(imgpath)
            imgpath = ""
        else
            if imgpath[1] != '/'
                imgpath = "$imgpath"
            end
        end
        write(io, """
            <div class="media stream-item">
              <div class=media-body>
                <h3 class="article-title mb-0 mt-0"><a href="/$rpath">$title</a></h3>
                <a href="/$rpath" class=summary-link>
                  <div class=article-style>$summary</div>
                </a>
                <div class="stream-meta article-metadata">
                  <div class=article-metadata><span class=article-date>Published on $date.</span>
                  </div>
                </div>
              </div>
              <div class=ml-3>
              $(ifelse(isempty(imgpath), "", """<a href="/$rpath"><img src="$imgpath" alt="$title"></a>"""))
              </div>
            </div>""")
    end
    return String(take!(io))
end

function hfun_recentposts(params)
    n = parse(Int, params[1])
    allposts = all_posts()
    posts = allposts[1:min(n, length(allposts))]
    return show_posts(posts)
end

function hfun_allposts()
    return show_posts(all_posts(), byyear=true)
end


# --------------------------------- #
# Working with Javascript Libraries #
# --------------------------------- #

function env_mermaid(e, _)
    content = Franklin.content(e)
    return "@@mermaid ~~~$content~~~@@"
end


"""
    {{ addcomments }}
Add a comment javascript section, managed by the utterances app <https://utteranc.es>.
"""
function hfun_addcomments()
    html_str = """
    <script src="https://utteranc.es/client.js"
        repo="songtaogui/blog_comments"
        issue-term="pathname"
        theme="github-light"
        crossorigin="anonymous"
        async>
    </script>
    """
    return html_str
end

@delay function hfun_list_tags()
    tagpages = globvar("fd_tag_pages")
    if tagpages === nothing
        return ""
    end
    tags = tagpages |> keys |> collect |> sort
    tags_count = [length(tagpages[t]) for t in tags]
    io = IOBuffer()
    for (t, c) in zip(tags, tags_count)
        write(io, """
            <nobr>
              <a href=\"/tag/$t/\" class=\"tag-link\">$(replace(t, "_" => " "))</a>
              <span class="tag-count"> ($c)</span>
            </nobr>
            """)
    end
    return String(take!(io))
end

# doesn't need to be delayed because it's generated at tag generation, after everything else
function hfun_tag_list()
  tag = locvar(:fd_tag)::String
  items = Dict{Date,String}()
  for rpath in globvar("fd_tag_pages")[tag]
      title = pagevar(rpath, "title")
      url = Franklin.get_url(rpath)
      surl = strip(url, '/')

      ys, ms, ps = split(surl, '/')[end-2:end]
      date = Date(parse(Int, ys), parse(Int, ms), parse(Int, first(ps, 2)))
      date_str = Dates.format(date, "U d, Y")

      tmp = "* ~~~<span class=\"post-date tag\">$date_str</span><nobr><a href=\"$url\">$title</a></nobr>"
      descr = pagevar(rpath, :descr)
      if descr !== nothing
          tmp *= ": <span class=\"post-descr\">$descr</span>"
      end
      tmp *= "~~~\n"
      items[date] = tmp
  end
  sorted_dates = sort!(items |> keys |> collect, rev=true)
  io = IOBuffer()
  write(io, "@@posts-container,mx-auto,px-3,py-5,list,mb-5\n")
  for date in sorted_dates
      write(io, items[date])
  end
  write(io, "@@")
  return Franklin.fd2html(String(take!(io)), internal=true)
end

function hfun_current_tag()
  return replace(locvar("fd_tag"), "_" => " ")
end

hfun_svg_tag() = """<a href="/tag/" id="tag-icon"><svg width="20" height="20" viewBox="0 0 512 512"><defs><style>.cls-1{fill:#141f38}</style></defs><path class="cls-1" d="M215.8 512a76.1 76.1 0 0 1-54.17-22.44L22.44 350.37a76.59 76.59 0 0 1 0-108.32L242 22.44A76.11 76.11 0 0 1 296.2 0h139.2A76.69 76.69 0 0 1 512 76.6v139.19A76.08 76.08 0 0 1 489.56 270L270 489.56A76.09 76.09 0 0 1 215.8 512zm80.4-486.4a50.69 50.69 0 0 0-36.06 14.94l-219.6 219.6a51 51 0 0 0 0 72.13l139.19 139.19a51 51 0 0 0 72.13 0l219.6-219.61a50.67 50.67 0 0 0 14.94-36.06V76.6a51.06 51.06 0 0 0-51-51zm126.44 102.08A38.32 38.32 0 1 1 461 89.36a38.37 38.37 0 0 1-38.36 38.32zm0-51a12.72 12.72 0 1 0 12.72 12.72 12.73 12.73 0 0 0-12.72-12.76z"/><path class="cls-1" d="M217.56 422.4a44.61 44.61 0 0 1-31.76-13.16l-83-83a45 45 0 0 1 0-63.52L211.49 154a44.91 44.91 0 0 1 63.51 0l83 83a45 45 0 0 1 0 63.52L249.31 409.24a44.59 44.59 0 0 1-31.75 13.16zm-96.7-141.61a19.34 19.34 0 0 0 0 27.32l83 83a19.77 19.77 0 0 0 27.31 0l108.77-108.7a19.34 19.34 0 0 0 0-27.32l-83-83a19.77 19.77 0 0 0-27.31 0l-108.77 108.7z"/><path class="cls-1" d="M294.4 281.6a12.75 12.75 0 0 1-9-3.75l-51.2-51.2a12.8 12.8 0 0 1 18.1-18.1l51.2 51.2a12.8 12.8 0 0 1-9.05 21.85zM256 320a12.75 12.75 0 0 1-9.05-3.75l-51.2-51.2a12.8 12.8 0 0 1 18.1-18.1l51.2 51.2A12.8 12.8 0 0 1 256 320zM217.6 358.4a12.75 12.75 0 0 1-9-3.75l-51.2-51.2a12.8 12.8 0 1 1 18.1-18.1l51.2 51.2a12.8 12.8 0 0 1-9.05 21.85z"/></svg></a>"""

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
    write(io, """<a href="/tag/$tag/">$t</a></div>""")
    return String(take!(io))
end

# generate achievement cards, using bib and pdf files in research/bib and research/pdf dir
# NOTE: the bibfile and pdffile should have same prefix
function hfun_achieve_cards()
    bibfile = joinpath(Franklin.FOLDER_PATH[], "achievements", "achievements.bib")
    bib = BibParser.parse_file(bibfile, :BibTeX; check=:warn)
    # sort_bibliography!(bib, :nyt)
    div_achieve = """
    <div class="grid-x grid-margin-x content  content-even">
    """

    for id in reverse(bib.keys)
        curb=bib[id] # current bib
        curb_pdf = "achievements/pdf/" * id * ".pdf"
        curb_pdfp = "pdf/" * id * ".pdf"
        curb_url = curb.access.url
        curb_title = curb.title
        curb_type = curb.type
        curb_keywords = split(curb.fields["keywords"], ",")
        curb_authors = join([join(uppercasefirst.(filter(!isempty,[t.first, t.junior, t.middle, t.particle, t.last])), " ") for t in curb.authors],", ")
        curb_year = curb.date.year
        curb_pubinfo = join([curb.in.journal, curb.in.pages, curb.in.volume],", ")
        # generate html
        # access: link, download, cite
        curb_div_access  = ""
        curb_div_icons   = ""
        if !isempty(curb_url)
            curb_div_icons *= """
            <a href="$curb_url" class="tooltips" title="" target="_blank" data-original-title="External link"> <i class ="fas fa-external-link-alt" aria-hidden="true"></i></a>
            """
        end
        if isfile(curb_pdf)
            curb_div_icons *= """
            <a href="$curb_pdfp" class="tooltips" title="" target="_blank" data-original-title="External link"> <i class ="fas fa-download" aria-hidden="true"></i></a>
            """
        end
        curb_div_access = """
        <div class="achieve-access">
        $curb_div_icons
        </div>
        """
        
        curb_div_content_kwd = join([ """<span class="label label-tag">$x</span>""" for x in curb_keywords ])

        curb_div_content = """
        <h4 class="achieve-title">$curb_title</h4>
        <div class="achive-content">
            <span class="label label-type">$curb_type</span>
            $curb_div_content_kwd
            <div class="achieve-author">$curb_authors</div>
            <div class="achieve-pubinfo">$curb_pubinfo</div>
            <div class="achieve-year">Publication year: $curb_year</div>
        </div>
        """

        curb_div_all = """
        <div class="achieve-card cell small-12">
            <div class="achieve-main">
                $curb_div_access
                $curb_div_content
            </div>
        </div>
        """
        div_achieve *= curb_div_all
    end
    div_achieve *= "</div>"
    return div_achieve
end
