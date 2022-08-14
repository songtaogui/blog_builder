+++
author = "Songtao Gui"
shortauthor = "Songtao Gui"
jobtitle = "Head of Research"

mintoclevel = 2
maxtoclevel = 3

ignore = ["node_modules/", "franklin", "franklin.pub"]

prepath = ""

hasplotly = false
hasmermaid = false
hascomment = true

# Set global variable `dateformat` to `"post"`, `"yearmonth"`, or `"year"`
# The expected file structures are
# - `"yearmonth"`: posts/YYYY/MM/name-of-post.md
# - `"year"`: posts/YYYY/name-of-post.md
# - `"post"`: posts/name-of-post.md

dateformat = "yearmonth"
# RSS setup
website_title = "SongtaoGui's Blog"
website_descr = "SongtaoGui's Blog using Franklin"
website_url   = "https://songtaogui.github.io/"
+++

\newcommand{\icon}[1]{~~~<i class="fas fa-~~~!#1~~~"></i>~~~}


<!--
Useful HTML snippets
* \blurb{...} for a blurb at the top of a page
* \refblank{...} for a link with target blank
* \lineskip forces skipping of a line somewhere
-->

\newcommand{\blurb}[1]{
    ~~~
    <span style="font-size:24px;font-weight:300;">!#1</span>
    ~~~
}
\newcommand{\refblank}[2]{
    ~~~
    <a href="!#2" target="_blank" rel="noopener noreferrer">#1</a>
    ~~~
}
\newcommand{\lineskip}{@@blank@@}
\newcommand{\skipline}{\lineskip}
\newcommand{\esc}[2]{
    ```julia:esc__!#1
    #hideall
    using Markdown
    Markdown.html(stdout,md"""#2""")
    ```
    \textoutput{esc__!#1}
}

\newcommand{\esch}[2]{
    ```julia:esc__!#1
    #hideall
    using Markdown
    println("\`\`\`\`\`html $(Markdown.htmlesc(raw"""#2""")) \`\`\`\`\`")
    ```
    \textoutput{esc__!#1}
}

\newcommand{\span}[2]{~~~<span style="display:inline-block;!#1">~~~!#2~~~</span>~~~}

\newcommand{\smindent}[1]{\span{width:45px;text-align:right;color:slategray;}{#1}}
\newcommand{\smnote}[1]{\style{font-size:85%;line-height:0em;}{#1}}

<!-- Colorful NoteBoxes: note, info, warn, error, tip, todo, hack -->
\newcommand{\bnote}[2]{ @@box-note  @@title 📘 #1@@ @@content #2 @@ @@}
\newcommand{\binfo}[2]{ @@box-info  @@title 🥑 #1@@ @@content #2 @@ @@}
\newcommand{\btip}[2]{  @@box-tip   @@title 🍏 #1@@ @@content #2 @@ @@}
\newcommand{\bwarn}[2]{ @@box-warn  @@title 🍇 #1@@ @@content #2 @@ @@}
\newcommand{\berror}[2]{@@box-error @@title 🐞 #1@@ @@content #2 @@ @@}
\newcommand{\btodo}[2]{ @@box-todo  @@title 🍊 #1@@ @@content #2 @@ @@}
\newcommand{\bhack}[2]{ @@box-hack  @@title 💻 #1@@ @@content #2 @@ @@}

<!-- Colorful alert noteboxes -->
\newcommand{\anote}[1]{ @@alert-note  @@content #1 @@ @@}
\newcommand{\ainfo}[1]{ @@alert-info  @@content #1 @@ @@}
\newcommand{\atip}[1]{  @@alert-tip   @@content #1 @@ @@}
\newcommand{\awarn}[1]{ @@alert-warn  @@content #1 @@ @@}
\newcommand{\aerror}[1]{@@alert-error @@content #1 @@ @@}
\newcommand{\atodo}[1]{ @@alert-todo  @@content #1 @@ @@}
\newcommand{\ahack}[1]{ @@alert-hack  @@content #1 @@ @@}

<!-- Colorful inline text -->
\newcommand{\snote}[1]{ \span{color:#4063D8;background:#d4e0ff}{!#1}}
\newcommand{\sinfo}[1]{ \span{color:#389826;background:#d4edda}{!#1}}
\newcommand{\stip}[1]{  \span{color:#87BC62;background:#EAF8E7}{!#1}}
\newcommand{\swarn}[1]{ \span{color:#9558B2;background:#e4d0ed}{!#1}}
\newcommand{\serror}[1]{\span{color:#CB3C33;background:#f8d7da}{!#1}}
\newcommand{\stodo}[1]{ \span{color:#FF7F00;background:#FBF3E7}{!#1}}
\newcommand{\shack}[1]{ \span{color:#4D4D4D;background:#d6d8d9}{!#1}}

<!-- Colorful inline text: invert bg and fg -->
\newcommand{\Snote}[1]{ \span{color:#FFFFFF;background:#4063D8}{!#1}}
\newcommand{\Sinfo}[1]{ \span{color:#FFFFFF;background:#389826}{!#1}}
\newcommand{\Stip}[1]{  \span{color:#FFFFFF;background:#87BC62}{!#1}}
\newcommand{\Swarn}[1]{ \span{color:#FFFFFF;background:#9558B2}{!#1}}
\newcommand{\Serror}[1]{\span{color:#FFFFFF;background:#CB3C33}{!#1}}
\newcommand{\Stodo}[1]{ \span{color:#FFFFFF;background:#FF7F00}{!#1}}
\newcommand{\Shack}[1]{ \span{color:#FFFFFF;background:#4D4D4D}{!#1}}

<!-- Colorful inline text: no bg -->
\newcommand{\cnote}[1]{ \span{color:#4063D8}{!#1}}
\newcommand{\cinfo}[1]{ \span{color:#389826}{!#1}}
\newcommand{\ctip}[1]{  \span{color:#87BC62}{!#1}}
\newcommand{\cwarn}[1]{ \span{color:#9558B2}{!#1}}
\newcommand{\cerror}[1]{\span{color:#CB3C33}{!#1}}
\newcommand{\ctodo}[1]{ \span{color:#FF7F00}{!#1}}
\newcommand{\chack}[1]{ \span{color:#4D4D4D}{!#1}}
