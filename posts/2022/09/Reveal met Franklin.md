+++
title = "When Reveal.js meets Franklin.jl"
tags = ["julia","hacks"]
summary = """
    Setup my Franklin.js functions to better work
    with Reveal.js.
    """
pubdate = Date("2022-09-26")

# showall = true
# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

# >>>>CONTROLS>>>>
hasnutshell = true
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

\hhack{Reveal.js: A powerful Slide generator}{

\cnote{[Reveal.js](https://revealjs.com/)} could be used to "\cnote{create stunning presentations on the web}". 
Although it is Markdown supportive, the most expressive use cases were mostly in **HTML**. 
Writing HTML for non-frontend developers (Me, apparently 😢) are painful. 

Since `Franklin.jl` could be used to wrap HTML codes into $\LaTeX$ like functions, would it be nice if we wrap common `Reveal.js` grammars into Franklin slangs and create web-based PPT using Franklin-markdown style, just as the same way we write our blogs?

Let's do it!
}


\toc

## The layouts

To get `Reveal.js` to work, these HTML headers and footers are necessary:

\html{

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="google-site-verification" content="sKCEBeALSs13uui0cWMviq9hlm0rPByKQKNHnOdq-d0" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <!-- {{insert stylesheets.html}} -->
    <link rel=stylesheet href="/css/admonition-reveal.css">
    <link rel="icon" href="/assets/favicon-bright.svg">
    <link rel="stylesheet" href="/libs/reveal/dist/reset.css">
    <link rel="stylesheet" href="/libs/reveal/dist/reveal.css">
    <link rel="stylesheet" href="/libs/reveal/dist/theme/simple.css">
    <!-- Theme used for syntax highlighted code -->
    <link rel="stylesheet" href="/libs/reveal/plugin/highlight/atom-one.css">
</head>

<body>
    <div class="reveal">
    <!-- 
    ===========================================================
                ADD SLIDE RELATED HTML HERE
    ===========================================================
     -->
    </div>
    <script src="/libs/reveal/dist/reveal.js"></script>
    <script src="/libs/reveal/plugin/notes/notes.js"></script>
    <script src="/libs/reveal/plugin/markdown/markdown.js"></script>
    <script src="/libs/reveal/plugin/highlight/highlight.js"></script>
    <script src="/libs/reveal/plugin/search/search.js"></script>
    <script src="/libs/reveal/plugin/math/math.js"></script>
    <script>
        // More info about initialization & config:
        // - https://revealjs.com/initialization/
        // - https://revealjs.com/config/
        Reveal.initialize({
            hash: true,
            width: 1400,
            height: 700,
            margin: 0.04,
            center: false,
            // controls: true,
            // controlsTutorial: true,
            disableLayout: false,
            slideNumber: 'c/t',
            showSlideNumber: 'all', // all | print | speaker
            touch: true,
            // Learn about plugins: https://revealjs.com/plugins/
            plugins: [ 
                RevealMarkdown,
                RevealHighlight,
                RevealNotes,
                RevealMath.KaTeX,
                RevealSearch,
                // RevealChalkboard, 
                // RevealCustomControls //did not work, don't know why
            ]
        });
    </script>
</body>
</html>

}

To write Reveal Slides in the same way we write Franklin blogs, the first thing first is to \cnote{set page variables} that let blog builder know to render the markdown as Reveal Slides rather than Franklin pages. Currently, I made this happen by manipulating the layout HTLMs of Franklin:

\hnote{Page var controllable Layout}{

The implementation is quite simple:
- I set a page variable of `revealslide`, if it is defined, I load \snote{Reveal} related header and footer HTML layout files, otherwise I'll load the traditional \swarn{Franklin} ones.
- I also set a variable of `revealtheme` for setup of \snote{Reveal} themes, my default one is `simple`.
- And some of the common \swarn{Franklin} control variables were also useful in \snote{Reveal} slides: `title`, `shownavbar` etc.

here is my head html file for \snote{Reveal}: (notice the page variables)

\html{
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="google-site-verification" content="sKCEBeALSs13uui0cWMviq9hlm0rPByKQKNHnOdq-d0" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>{{title}}</title>
    <!-- {{insert stylesheets.html}} -->
    <link rel=stylesheet href="/css/admonition-reveal.css">
    <link rel="icon" href="/assets/favicon-bright.svg">
    <link rel="stylesheet" href="/libs/reveal/dist/reset.css">
    <link rel="stylesheet" href="/libs/reveal/dist/reveal.css">
    {{isnotdef revealtheme}}<link rel="stylesheet" href="/libs/reveal/dist/theme/simple.css">{{end}}
    {{isdef revealtheme}}<link rel="stylesheet" href="/libs/reveal/dist/theme/{{revealtheme}}.css">{{end}}
    <!-- Theme used for syntax highlighted code -->
    <link rel="stylesheet" href="/libs/reveal/plugin/highlight/atom-one.css">
</head>

<body>
    {{isdef shownavbar}} {{insert navbar.html}} {{end}}
    <div class="reveal">

}

with these, I can start building slides by writing the markdown as:


\markdown{

<!-- wrap these within a start +++ +++ block -->

title="MySlide001"
revealslide=true
revealtheme="simple"
}

}


## The Functions

I wrapped most commonly used Reveal.js grammars into $\LaTeX$ like functions in Franklin `config.md`:

\plain{


<!-- 
############################################
####### Reveal.js Related Functions ########
############################################
 -->

\newcommand{\rvsechtml}[2]{
~~~
<section !#1>

#2

</section>
~~~
}

\newcommand{\rvsecmdfranklin}[2]{
~~~<section !#1>~~~
#2
~~~</section>~~~
}

\newcommand{\rvsecmdtext}[2]{
~~~
<section data-markdown !#1> 
  <script type="text/template">
#2
  </script>
</section>
~~~
}


\newcommand{\rvsecmdscript}[2]{
~~~
<section data-markdown !#1>
    <script type="text/template">
#2
    </script>
</section>
~~~
}

\newcommand{\rvcode}[2]{
~~~
<pre><code data-line-numbers !#1>
~~~
#2
~~~
</code></pre>
~~~
}

\newcommand{\rvdiv}[2]{
~~~<div !#1>~~~
!#2
~~~</div>~~~
}
\newcommand{\rvspan}[2]{
~~~<span !#1>~~~
!#2
~~~</span>~~~
}
\newcommand{\rvp}[2]{
~~~<p !#1>~~~
!#2
~~~</p>~~~
}
\newcommand{\rvli}[2]{
~~~<li !#1>~~~
!#2
~~~</li>~~~
}


\newcommand{\rvfdiv}[2]{
~~~<div class="fragment" data-fragment-index="!#1" align="left" style="margin:0px">~~~
  #2
~~~</div>~~~
}
\newcommand{\rvfspan}[2]{
~~~<span class="fragment" data-fragment-index="!#1" align="left" style="margin:0px">~~~
!#2
~~~</span>~~~
}
\newcommand{\rvfp}[2]{
~~~<p class="fragment" data-fragment-index="!#1" align="left" style="margin:0px">~~~
  #2
~~~</p>~~~
}
\newcommand{\rvfli}[2]{
~~~<li class="fragment" data-fragment-index="!#1" align="left" style="margin:0px">~~~
  #2
~~~</li>~~~
}

\plain{

\newcommand{\rvlovv}[6]{
\rvsecmdfranklin{ }{
~~~
<div style="text-align:left">
~~~
#3
~~~
</div>
<table width="100%" height="650px" border="0">
<tr>
  <td width="!#1" height=90% style="padding:0px">
~~~
#4
~~~
  </td>
  <td width="!#2" height=90% style="padding:0px;padding-left:0.2em">
~~~
#5
~~~
  </td>
</tr>
<tr>
  <td colspan="1" height=5% style="padding:0px">
    <div style="font-size:18px;padding-bottom:-1em">
~~~
#6
~~~
    </div>
  </td>
</tr>
</table>
~~~
}
}
 

\newcommand{\rvlovvv}[8]{
\rvsecmdfranklin{ }{
~~~
<div style="text-align:left">
~~~
#4
~~~
</div>
<table width="1400[x" height="650px" border="0">
<tr>
  <td width="!#1" height=90% style="padding:0px">
~~~
#5
~~~
  </td>
  <td width="!#2" height=90% style="padding:0px;padding-left:0.1em">
~~~
#6
~~~
  </td>
  <td width="!#3" height=90% style="padding:0px;padding-left:0.1em">
~~~
#7
~~~
  </td>
</tr>
<tr>
  <td colspan="1" height=5% style="padding:0px">
    <div style="font-size:18px;padding-bottom:-1em">
~~~
#8
~~~
    </div>
  </td>
</tr>
</table>
~~~
}}}

}

Now, I can create Slides the same way I wrote Franklin Blogs. e.g.:

[: demo slide codes](#DemoRevealCode)

I could get [:the demo slide](/courses/slides/demo)

That is somewhat smooooth ㊗️!

## The futures

\hwarn{Why do I bother?}{

It seems that, now I can write slides using a strange \ctodo{markdown * $\LaTeX$} grammar, instead of pure html.

But is it necessary? Wouldn't it more efficient (and/or more scalable) that I just learn HTML directly?

There are several \Ctip{pros} for this wrapper:

- Raw HTML slides just contains \snote{too many tags} `<foo><bar></bar></foo>`, these would not help me focus on the contents;
- Using this wrapper, I could \snote{manage} the Slides.md in the same way of the Blogs.md, so convenient;
- This wrapper is \snote{compatible} with the rest functions I defined for better writing blogs, I don't have to swith my mind, so smooth;

}

\htodo{What Next?}{

However, the current application is just a very simple wrapper of basic Reveal.js HTML grammar. And instead of writting HTML tags, I have to add many $\LaTeX$ like functions (many slashes and braces). That is not so elegant.

We should develop a new markdown parser (using pure julia), define the specific structures and keywords for controlling the behavior of each slide.
In that way, maybe we could just write markdown like this:

\plain{

\+\+\+
title="FakeMdSlideGrammar"
theme="SomeTheme"
footer="SomeFooter"
\+\+\+

==P==
# Slide 1

<!--| background: #123456 |-->

- fragment 1 <!--| fragment:fade-out; index:1 |-->
- fragment 2 <!--| fragment:fade-in; index:2 |-->

--F--
<!-- to wrap several items into one fragment -->
<!-- | fragment: fade-in; index:3 | -->
- I am part of fragment 3

**I am also part of fragment 3**

>So am I

```
Me Too~
```
--F--

==P==

}

And get beautiful slides.

This would need fully understand of how `Markdown.jl`, and `Franklin.jl` works, thus is a looooooog journey for me.

I hope I could make it (when I have enough time 😿)

}



# :x DemoRevealCode

`````pliantext
+++
title="Demo"
revealslide=true
revealtheme="simple"
+++
~~~
<div class="slides">
~~~
\rvsecmdfranklin{ }{
    ## \cnote{Thank You!}
    \hwarn{Follow ME}{
        \br{2}
        \Shack{My GitHub}: [https://github.com/SongtaoGui](https://github.com/SongtaoGui)
        \br{2}
        \Snote{My Blog}: [https://songtaogui.github.io/](https://songtaogui.github.io/)
        \br{2}
    }
}
~~~
</div>
~~~
`````
