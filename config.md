+++
author = "Songtao Gui"
shortauthor = "Songtao Gui"
jobtitle = "Head of Research"

mintoclevel = 2
maxtoclevel = 3

ignore = ["node_modules/", "franklin", "franklin.pub"]

prepath = ""

hasnutshell = false
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
\newcommand{\del}[1]{~~~<del>#1</del>~~~}
\newcommand{\figenv}[3]{
~~~
<figure style="text-align:center;">
<img src="!#2" style="padding:0;#3" alt="#1"/>
<figcaption>#1</figcaption>
</figure>
~~~
}

\newcommand{\figdiy}[2]{
~~~
<figure>
<img src="!#1" !#2 />
</figure>
~~~
}

\newcommand{\smindent}[1]{\span{width:45px;text-align:right;color:slategray;}{#1}}
\newcommand{\smnote}[1]{\style{font-size:85%;line-height:0em;}{#1}}

\newcommand{\emdash}{&#8212;}

\newcommand{\lskip}{
  ~~~
  <div style="height:1em;"></div>
  ~~~
}


\newcommand{\fieldset}[3]{
  ~~~
  <fieldset class="!#1"><legend class="!#1-legend">#2</legend>
  ~~~
  #3
  ~~~
  </fieldset>
  ~~~
}


\newcommand{\julia}[1]{
~~~
<fieldset class="code-julia"><legend class="code-julia-legend">julia</legend>
~~~
```julia
#1
```
~~~
<div class="code-lag">julia</div></fieldset>
~~~
}

\newcommand{\markdown}[1]{
~~~
<fieldset class="code-markdown"><legend class="code-markdown-legend">markdown</legend>
~~~
```markdown
#1
```
~~~
<div class="code-lag">markdown</div></fieldset>
~~~
}


\newcommand{\bash}[1]{
~~~
<fieldset class="code-bash"><legend class="code-bash-legend">bash</legend>
~~~
```bash
#1
```
~~~
<div class="code-lag">bash</div></fieldset>
~~~
}

\newcommand{\shell}[1]{
~~~
<fieldset class="code-shell"><legend class="code-shell-legend">shell</legend>
~~~
```shell
#1
```
~~~
<div class="code-lag">shell</div></fieldset>
~~~
}

\newcommand{\perl}[1]{
~~~
<fieldset class="code-perl"><legend class="code-perl-legend">perl</legend>
~~~
```perl
#1
```
~~~
<div class="code-lag">perl</div></fieldset>
~~~
}



\newcommand{\rust}[1]{
~~~
<fieldset class="code-rust"><legend class="code-rust-legend">rust</legend>
~~~
```Rust
#1
```
~~~
<div class="code-lag">rust</div></fieldset>
~~~
}



\newcommand{\plain}[1]{
~~~
<fieldset class="code-plain"><legend class="code-plain-legend">plain</legend>
~~~
```plaintext
#1
```
~~~
<div class="code-lag">plain</div></fieldset>
~~~
}



\newcommand{\python}[1]{
~~~
<fieldset class="code-python"><legend class="code-python-legend">python</legend>
~~~
```python
#1
```
~~~
<div class="code-lag">python</div></fieldset>
~~~
}



\newcommand{\json}[1]{
~~~
<fieldset class="code-json"><legend class="code-json-legend">json</legend>
~~~
```json
#1
```
~~~
<div class="code-lag">json</div></fieldset>
~~~
}


\newcommand{\html}[1]{
~~~
<fieldset class="code-html"><legend class="code-html-legend">html</legend>
~~~
```html
#1
```
~~~
<div class="code-lag">html</div></fieldset>
~~~
}


\newcommand{\javascript}[1]{
~~~
<fieldset class="code-javascript"><legend class="code-javascript-legend">javascript</legend>
~~~
```js
#1
```
~~~
<div class="code-lag">javascript</div></fieldset>
~~~
}

\newcommand{\css}[1]{
~~~
<fieldset class="code-css"><legend class="code-css-legend">css</legend>
~~~
```css
#1
```
~~~
<div class="code-lag">css</div></fieldset>
~~~
}




\newcommand{\showmd}[1]{
~~~
<div class="trim">
~~~
\fieldset{md-input}{markdown}{
`````plaintext
#1
`````
}
~~~
</div>
~~~

~~~
<div class="trim">
~~~
\fieldset{md-result}{result}{
~~~~~~
#1
~~~~~~
}
~~~
</div>
~~~
}

\newcommand{\kbd}[1]{ ~~~<kbd>#1</kbd>~~~ }

\newcommand{\cmdiff}[1]{\fieldset{cm-diff}{&ne; CommonMark}{#1}}
\newcommand{\note}[1]{  \fieldset{note   }{Note}{#1}}
\newcommand{\info}[1]{  \fieldset{info   }{Info}{#1}}
\newcommand{\tip}[1]{   \fieldset{tip    }{Tip}{#1}}
\newcommand{\warn}[1]{  \fieldset{warn   }{Warn}{#1}}
\newcommand{\error}[1]{ \fieldset{error  }{Error}{#1}}
\newcommand{\todo}[1]{  \fieldset{todo   }{Todo}{#1}}
\newcommand{\hack}[1]{  \fieldset{hack   }{Hack}{#1}}



\newcommand{\bnote}[2]{ \fieldset{note }{📘#1}{#2}}
\newcommand{\binfo}[2]{ \fieldset{info }{🥑#1}{#2}}
\newcommand{\btip}[2]{  \fieldset{tip  }{🍏#1}{#2}}
\newcommand{\bwarn}[2]{ \fieldset{warn }{🍇#1}{#2}}
\newcommand{\berror}[2]{\fieldset{error}{🐞#1}{#2}}
\newcommand{\btodo}[2]{ \fieldset{todo }{🍊#1}{#2}}
\newcommand{\bhack}[2]{ \fieldset{hack }{💻#1}{#2}}t

<!-- Colorful NoteBoxes: note, info, warn, error, tip, todo, hack
-->
\newcommand{\tnote}[2]{ @@box-note  @@title 📘 #1@@ @@content #2 @@ @@}
\newcommand{\tinfo}[2]{ @@box-info  @@title 🥑 #1@@ @@content #2 @@ @@}
\newcommand{\ttip}[2]{  @@box-tip   @@title 🍏 #1@@ @@content #2 @@ @@}
\newcommand{\twarn}[2]{ @@box-warn  @@title 🍇 #1@@ @@content #2 @@ @@}
\newcommand{\terror}[2]{@@box-error @@title 🐞 #1@@ @@content #2 @@ @@}
\newcommand{\ttodo}[2]{ @@box-todo  @@title 🍊 #1@@ @@content #2 @@ @@}
\newcommand{\thack}[2]{ @@box-hack  @@title 💻 #1@@ @@content #2 @@ @@}

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
