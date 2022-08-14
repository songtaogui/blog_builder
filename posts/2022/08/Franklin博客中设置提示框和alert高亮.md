+++
title = "Franklin博客中设置提示框和alert高亮"
# tags = [ "programming","bioinformatics","genetics","paper","work","daily","random","insight", ... ]
tags = ["programming", "julia", "franklin"]
showall = true
summary = """
  配置我的Flanklin博客高亮提示框
  """
rss = summary

hasplotly = false
hasmermaid = false
hascode = true
hascomment = true

pubdate = Date("2022-08-12")
+++

{{page_tags}}

\toc

## 话不多说先上效果

### 各种提示框

- 自定义head

\bnote{blahblah}{I am some note}
\bwarn{blahblah}{I am some warn}
\berror{blahblah}{I am some error}
\btip{blahblah}{I am some tip}
\binfo{blahblah}{I am some info}
\btodo{blahblah}{I am some todo}
\bhack{blahblah}{I am some hack}

### 各种alert信息

\anote{note}
\awarn{warn}
\aerror{error}
\atip{tip}
\ainfo{info}
\atodo{todo}
\ahack{hack}

### 各种inline高亮

I contain inline \snote{note}\swarn{warn}\serror{error}\stip{tip}\sinfo{info}\stodo{todo}\shack{hack} and normal texts.

I contain inline \Snote{note}\Swarn{warn}\Serror{error}\Stip{tip}\Sinfo{info}\Stodo{todo}\Shack{hack} and normal texts.

I contain inline \cnote{note}\cwarn{warn}\cerror{error}\ctip{tip}\cinfo{info}\ctodo{todo}\chack{hack} and normal texts.

## 具体实现

1. 在`config.md`中定义如下函数:

```

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

```

2. 配置对应的css信息:

```

/* ==================================================================
Colorful NoteBox: note, info, warn, error, tip, todo, hack
================================================================== */

/* NOTE */
.note {
    margin-top: 1.5em;
    width: 95%;
    margin-left: auto;
    margin-right: auto;
    background-color: aliceblue;
    border-radius: 5px;
    margin-bottom: 1em;
}
.note .content {
    padding: 10px;
    padding-left: 12px;
}
.note .title {
    font-size: 105%;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    padding-left: 7px;
    padding-top: 2px;
    color: white;
    background: #4063D8;
}

/* WARN */
.warn {
    margin-top: 1.5em;
    width: 95%;
    margin-left: auto;
    margin-right: auto;
    background-color: #f6ebfb;
    border-radius: 5px;
    margin-bottom: 1em;
}
.warn .content {
    padding: 10px;
    padding-left: 12px;
}
.warn .title {
    font-size: 105%;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    padding-left: 7px;
    padding-top: 2px;
    color: white;
    background: #9558B2;
}


/* ERROR */
.error {
    margin-top: 1.5em;
    width: 95%;
    margin-left: auto;
    margin-right: auto;
    background-color: #f7e5e5;
    border-radius: 5px;
    margin-bottom: 1em;
}
.error .content {
    padding: 10px;
    padding-left: 12px;
}
.error .title {
    font-size: 105%;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    padding-left: 7px;
    padding-top: 2px;
    color: white;
    background: #CB3C33;
}

/* TIP */
.tip {
    margin-top: 1.5em;
    width: 95%;
    margin-left: auto;
    margin-right: auto;
    background-color: #eaf8e7;
    border-radius: 5px;
    margin-bottom: 1em;
}
.tip .content {
    padding: 10px;
    padding-left: 12px;
}
.tip .title {
    font-size: 105%;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    padding-left: 7px;
    padding-top: 2px;
    color: white;
    background: #87bc62;
}

/* INFO */
.info {
    margin-top: 1.5em;
    width: 95%;
    margin-left: auto;
    margin-right: auto;
    background-color: #d4f1d4;
    border-radius: 5px;
    margin-bottom: 1em;
}
.info .content {
    padding: 10px;
    padding-left: 12px;
}
.info .title {
    font-size: 105%;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    padding-left: 7px;
    padding-top: 2px;
    color: white;
    background: #389826;
}

/* TODO */
.todo {
    margin-top: 1.5em;
    width: 95%;
    margin-left: auto;
    margin-right: auto;
    background-color: #fbf3e7;
    border-radius: 5px;
    margin-bottom: 1em;
}
.todo .content {
    padding: 10px;
    padding-left: 12px;
}
.todo .title {
    font-size: 105%;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    padding-left: 7px;
    padding-top: 2px;
    color: white;
    background: #FF7F00;
}

/* HACK */
.hack {
    margin-top: 1.5em;
    width: 95%;
    margin-left: auto;
    margin-right: auto;
    background-color: #E0E0E0;
    border-radius: 5px;
    margin-bottom: 1em;
}
.hack .content {
    padding: 10px;
    padding-left: 12px;
}
.hack .title {
    font-size: 105%;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    padding-left: 7px;
    padding-top: 2px;
    color: white;
    background: #4D4D4D;
}

/* ==================================================================
Colorful Alert NoteBox: note, info, warn, error, tip, todo, hack
================================================================== */

/* NOTE */
.alert-note {
    color: #153385;
    width: 95%;
    margin-left: auto;
    margin-right: auto;
    background-color: #d4e0ff;
}
.alert-note hr {
    border-top-color: #c4d3fb
}
.alert-note .alert-link {
    color: #0e2259
}

/* WARN */
.alert-warn {
    color: #9558B2;
    width: 95%;
    margin-left: auto;
    margin-right: auto;
    background-color: #e4d0ed;
}
.alert-warn hr {
    border-top-color: #c794df
}
.alert-warn .alert-link {
    color: #4e2a5f
}

/* ERROR */
.alert-error {
    color: #721c24;
    width: 95%;
    margin-left: auto;
    margin-right: auto;
    background-color: #f8d7da;
}
.alert-error hr {
    border-top-color: #f1b0b7
}
.alert-error .alert-link {
    color: #491217
}

/* TIP */
.alert-tip {
    color: #87BC62;
    width: 95%;
    margin-left: auto;
    margin-right: auto;
    background-color: #EAF8E7;
}
.alert-tip hr {
    border-top-color: #bdfa92
}
.alert-tip .alert-link {
    color: #5c8142
}

/* INFO */
.alert-info {
    color: #155724;
    width: 95%;
    margin-left: auto;
    margin-right: auto;
    background-color: #d4edda;
}
.alert-info hr {
    border-top-color: #b1dfbb
}
.alert-info .alert-link {
    color: #0b2e13
}


/* TODO */
.alert-todo {
    color: #FF7F00;
    width: 95%;
    margin-left: auto;
    margin-right: auto;
    background-color: #FBF3E7;
}
.alert-todo hr {
    border-top-color: #f6c797
}

.alert-todo .alert-link {
    color: #97581a
}

/* HACK */
.alert-hack {
    color: #1b1e21;
    width: 95%;
    margin-left: auto;
    margin-right: auto;
    background-color: #d6d8d9;
}
.alert-hack hr {
    border-top-color: #b9bbbe
}
.alert-hack .alert-link {
    color: #040505
}

```

3. 可以愉快地使用了, Franklin赛高!
