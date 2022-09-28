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
generate_sitemap = true
sitemap_changefreq = "weekly"
# RSS setup
website_title = "SongtaoGui's Blog"
website_descr = "SongtaoGui's Blog using Franklin"
website_url   = "https://songtaogui.github.io/"
+++


<!--
Useful HTML snippets
* \blurb{...} for a blurb at the top of a page
* \refblank{...} for a link with target blank
* \lineskip forces skipping of a line somewhere
-->
\newcommand{\blurb}[1]{~~~<span style="font-size:24px;font-weight:300;">!#1</span>~~~}
\newcommand{\refblank}[2]{~~~<a href="!#2" target="_blank" rel="noopener noreferrer">#1</a>~~~}
\newcommand{\checkbx}{~~~<input class="checkbox" type="checkbox" checked="checked">~~~}
\newcommand{\checkbo}{~~~<input class="checkbox" type="checkbox" >~~~}
\newcommand{\lineskip}{@@blank@@}
\newcommand{\skipline}{\lineskip}
\newcommand{\icon}[1]{~~~<i class="fas fa-~~~!#1~~~"></i>~~~}
\newcommand{\kbd}[1]{ ~~~<kbd>#1</kbd>~~~ }
\newcommand{\span}[2]{~~~<span style="display:inline-block;!#1">~~~!#2~~~</span>~~~}
\newcommand{\del}[1]{~~~<del>#1</del>~~~}
\newcommand{\figenv}[3]{~~~<figure style="text-align:center;"><img src="!#2" style="padding:0;#3" alt="#1"/><figcaption>#1</figcaption></figure>~~~}
\newcommand{\figdiy}[2]{~~~<figure><img src="!#1" !#2 /></figure>~~~}
\newcommand{\imgdiy}[2]{~~~<img src="!#1" !#2 />~~~}
\newcommand{\smindent}[1]{\span{width:45px;text-align:right;color:slategray;}{#1}}
\newcommand{\smnote}[1]{\style{font-size:85%;line-height:0em;}{#1}}
\newcommand{\emdash}{&#8212;}
\newcommand{\lskip}{~~~<div style="height:1em;"></div>~~~}
\newcommand{\indent}[2]{
  ~~~<div class="indent-block" style="margin-left: !#1 !important">~~~
  #2
  ~~~</div>~~~
}


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

\newcommand{\fieldset}[3]{
  ~~~
  <fieldset class="!#1"><legend class="!#1">#2</legend>
  ~~~
  #3
  ~~~
  </fieldset>
  ~~~
}

\newcommand{\admonition}[3]{
  ~~~
  <fieldset class="admon admon-!#1">
  <legend class="admon-legend admon-legend-!#1">#2</legend>
  ~~~
  #3
  ~~~
  </fieldset>
  ~~~
}

\newcommand{\hadmonition}[3]{
  ~~~
  <fieldset class="hadmon admon-!#1"><legend class="hadmon-legend admon-legend-!#1">#2</legend>
  ~~~
  #3
  ~~~
  </fieldset>
  ~~~
}
<!-- alias of admonitions -->
\newcommand{ \note   }[1]{ \admonition{ note    }{ Note  }{#1}}
\newcommand{ \info   }[1]{ \admonition{ info    }{ Info  }{#1}}
\newcommand{ \tip    }[1]{ \admonition{ tip     }{ Tip   }{#1}}
\newcommand{ \warn   }[1]{ \admonition{ warn    }{ Warn  }{#1}}
\newcommand{ \error  }[1]{ \admonition{ error   }{ Error }{#1}}
\newcommand{ \todo   }[1]{ \admonition{ todo    }{ Todo  }{#1}}
\newcommand{ \hack   }[1]{ \admonition{ hack    }{ Hack  }{#1}}

<!-- alias of badmonitions: box-admon with diy header -->
\newcommand{ \bnote   }[2]{ \admonition{ note  }{ 📘#1 }{#2}}
\newcommand{ \binfo   }[2]{ \admonition{ info  }{ 🥑#1 }{#2}}
\newcommand{ \btip    }[2]{ \admonition{ tip   }{ 🍏#1 }{#2}}
\newcommand{ \bwarn   }[2]{ \admonition{ warn  }{ 🍇#1 }{#2}}
\newcommand{ \berror  }[2]{ \admonition{ error }{ 🐞#1 }{#2}}
\newcommand{ \btodo   }[2]{ \admonition{ todo  }{ 🍊#1 }{#2}}
\newcommand{ \bhack   }[2]{ \admonition{ hack  }{ 💻#1 }{#2}}

<!-- alias of hadmonitions: highlight-admon with diy header -->
\newcommand{ \hnote  }[2]{ \hadmonition{ note  }{#1}{#2}}
\newcommand{ \hinfo  }[2]{ \hadmonition{ info  }{#1}{#2}}
\newcommand{ \htip   }[2]{ \hadmonition{ tip   }{#1}{#2}}
\newcommand{ \hwarn  }[2]{ \hadmonition{ warn  }{#1}{#2}}
\newcommand{ \herror }[2]{ \hadmonition{ error }{#1}{#2}}
\newcommand{ \htodo  }[2]{ \hadmonition{ todo  }{#1}{#2}}
\newcommand{ \hhack  }[2]{ \hadmonition{ hack  }{#1}{#2}}

<!-- alias of aadmonitions: alert-admon -->
\newcommand{ \aadmonition}[2]{~~~<div class="aadmon aadmon-!#1">~~~#2~~~</div>~~~}
\newcommand{ \anote  }[1]{ \aadmonition{ note  }{ #1 }}
\newcommand{ \ainfo  }[1]{ \aadmonition{ info  }{ #1 }}
\newcommand{ \atip   }[1]{ \aadmonition{ tip   }{ #1 }}
\newcommand{ \awarn  }[1]{ \aadmonition{ warn  }{ #1 }}
\newcommand{ \aerror }[1]{ \aadmonition{ error }{ #1 }}
\newcommand{ \atodo  }[1]{ \aadmonition{ todo  }{ #1 }}
\newcommand{ \ahack  }[1]{ \aadmonition{ hack  }{ #1 }}

<!-- alias of sadmonitions: string-admon light -->
\newcommand{\sadmonition}[2]{~~~<span class="sadmon sadmon-!#1">~~~!#2~~~</span>~~~}
\newcommand{ \snote  }[1]{ \sadmonition{ note  }{ #1 }}
\newcommand{ \sinfo  }[1]{ \sadmonition{ info  }{ #1 }}
\newcommand{ \stip   }[1]{ \sadmonition{ tip   }{ #1 }}
\newcommand{ \swarn  }[1]{ \sadmonition{ warn  }{ #1 }}
\newcommand{ \serror }[1]{ \sadmonition{ error }{ #1 }}
\newcommand{ \stodo  }[1]{ \sadmonition{ todo  }{ #1 }}
\newcommand{ \shack  }[1]{ \sadmonition{ hack  }{ #1 }}

<!-- alias of Sadmonitions: String-admon dark -->
\newcommand{\Sadmonition}[2]{~~~<span class="Sadmon Sadmon-!#1">~~~!#2~~~</span>~~~}
\newcommand{ \Snote  }[1]{ \Sadmonition{ note  }{ #1 }}
\newcommand{ \Sinfo  }[1]{ \Sadmonition{ info  }{ #1 }}
\newcommand{ \Stip   }[1]{ \Sadmonition{ tip   }{ #1 }}
\newcommand{ \Swarn  }[1]{ \Sadmonition{ warn  }{ #1 }}
\newcommand{ \Serror }[1]{ \Sadmonition{ error }{ #1 }}
\newcommand{ \Stodo  }[1]{ \Sadmonition{ todo  }{ #1 }}
\newcommand{ \Shack  }[1]{ \Sadmonition{ hack  }{ #1 }}

<!-- alias of Cadmonitions: color-admon -->
\newcommand{ \Cadmonition}[2]{~~~<span class="Cadmon Sadmon-!#1">~~~!#2~~~</span>~~~}
\newcommand{ \Cnote  }[1]{ \Cadmonition{ note  }{!#1}}
\newcommand{ \Cinfo  }[1]{ \Cadmonition{ info  }{!#1}}
\newcommand{ \Ctip   }[1]{ \Cadmonition{ tip   }{!#1}}
\newcommand{ \Cwarn  }[1]{ \Cadmonition{ warn  }{!#1}}
\newcommand{ \Cerror }[1]{ \Cadmonition{ error }{!#1}}
\newcommand{ \Ctodo  }[1]{ \Cadmonition{ todo  }{!#1}}
\newcommand{ \Chack  }[1]{ \Cadmonition{ hack  }{!#1}}

<!-- alias of cadmonitions: color-admon -->
\newcommand{ \cadmonition}[2]{~~~<span class="cadmon sadmon-!#1">~~~!#2~~~</span>~~~}
\newcommand{ \cnote  }[1]{ \cadmonition{ note  }{!#1}}
\newcommand{ \cinfo  }[1]{ \cadmonition{ info  }{!#1}}
\newcommand{ \ctip   }[1]{ \cadmonition{ tip   }{!#1}}
\newcommand{ \cwarn  }[1]{ \cadmonition{ warn  }{!#1}}
\newcommand{ \cerror }[1]{ \cadmonition{ error }{!#1}}
\newcommand{ \ctodo  }[1]{ \cadmonition{ todo  }{!#1}}
\newcommand{ \chack  }[1]{ \cadmonition{ hack  }{!#1}}

<!-- CODE BLOCK -->
\newcommand{\julia}[1]{
~~~<fieldset class="code code-julia"><legend class="code-legend code-legend-julia">julia</legend>~~~
```julia
#1
```
~~~<div class="code-lag">julia</div></fieldset>~~~
}

\newcommand{\markdown}[1]{
~~~<fieldset class="code code-markdown"><legend class="code-legend code-legend-markdown">markdown</legend>~~~
```markdown
#1
```
~~~<div class="code-lag">markdown</div></fieldset>~~~
}


\newcommand{\bash}[1]{
~~~<fieldset class="code code-bash"><legend class="code-legend code-legend-bash">bash</legend>~~~
```bash
#1
```
~~~<div class="code-lag">bash</div></fieldset>~~~
}

\newcommand{\shell}[1]{
~~~<fieldset class="code code-shell"><legend class="code-legend code-legend-shell">shell</legend>~~~
```shell
#1
```
~~~<div class="code-lag">shell</div></fieldset>~~~
}

\newcommand{\perl}[1]{
~~~<fieldset class="code code-perl"><legend class="code-legend code-legend-perl">perl</legend>~~~
```perl
#1
```
~~~<div class="code-lag">perl</div></fieldset>~~~
}



\newcommand{\rust}[1]{
~~~<fieldset class="code code-rust"><legend class="code-legend code-legend-rust">rust</legend>~~~
```Rust
#1
```
~~~<div class="code-lag">rust</div></fieldset>~~~
}



\newcommand{\plain}[1]{
~~~<fieldset class="code code-plain"><legend class="code-legend code-legend-plain">plain</legend>~~~
`````plaintext
#1
`````
~~~<div class="code-lag">plain</div></fieldset>~~~
}



\newcommand{\python}[1]{
~~~<fieldset class="code code-python"><legend class="code-legend code-legend-python">python</legend>~~~
```python
#1
```
~~~<div class="code-lag">python</div></fieldset>~~~
}


\newcommand{\json}[1]{
~~~<fieldset class="code code-json"><legend class="code-legend code-legend-json">json</legend>~~~
```json
#1
```
~~~<div class="code-lag">json</div></fieldset>~~~
}


\newcommand{\html}[1]{
~~~<fieldset class="code code-html"><legend class="code-legend code-legend-html">html</legend>~~~
```html
#1
```
~~~<div class="code-lag">html</div></fieldset>~~~
}


\newcommand{\javascript}[1]{
~~~<fieldset class="code code-javascript"><legend class="code-legend code-legend-javascript">javascript</legend>~~~
```js
#1
```
~~~<div class="code-lag">javascript</div></fieldset>~~~
}

\newcommand{\css}[1]{
~~~<fieldset class="code code-css"><legend class="code-legend code-legend-css">css</legend>~~~
```css
#1
```
~~~<div class="code-lag">css</div></fieldset>~~~
}

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


\newcommand{\rvlovv}[6]{
\rvsecmdfranklin{ }{
~~~
<div style="text-align:left">
~~~
#3
~~~
</div>
<table id="lov" width="100%" height="650px" border="0">
<tr>
  <td id="lov" width="!#1" height=90%>
~~~
#4
~~~
  </td>
  <td id="lov" width="!#2" height=90%>
~~~
#5
~~~
  </td>
</tr>
<tr>
  <td id="lov" colspan="1" height=5% >
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
<table id="lov" width="1400px" height="650px" border="0">
<tr>
  <td id="lov" width="!#1" height=90%>
~~~
#5
~~~
  </td>
  <td id="lov" width="!#2" height=90%>
~~~
#6
~~~
  </td>
  <td id="lov" width="!#3" height=90%>
~~~
#7
~~~
  </td>
</tr>
<tr>
  <td id="lov" colspan="1" height=5%>
    <div style="font-size:18px;padding-bottom:-1em">
~~~
#8
~~~
    </div>
  </td>
</tr>
</table>
~~~
}
}

\newcommand{\lovvv}[6]{
  ~~~
  <table id="lov">
  <tr>
    <td id="lov" height=90% style="width:!#1">
  ~~~
  #4
  ~~~
    </td>
    <td id="lov" width="!#2" height=90% align="center">
  ~~~
  #5
  ~~~
    </td>
    <td id="lov" width="!#3" height=90% align="center">
  ~~~
  #6
  ~~~
    </td>
  </tr>
  </table>
  ~~~
}

\newcommand{\lovv}[4]{
  ~~~
  <table id="lov">
  <tr>
    <td id="lov" height=90% style="width:!#1">
  ~~~
  #3
  ~~~
    </td>
    <td id="lov" width="!#2" height=90% align="center">
  ~~~
  #4
  ~~~
    </td>
  </tr>
  </table>
  ~~~
}

