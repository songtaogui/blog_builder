+++
title = "Use nutshell in my Franklin blog"
tags = ["nutshell","Franklin","blog","hack"]
summary = """
    Set up nutshell in my julia/Franklin.jl based blog.
    """
pubdate = Date("2022-08-20")

showall = true
rss = summary
# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

# >>>>CONTROLS>>>>
hasnutshell = true
hasplotly = false
hasmermaid = false
hascomment = true
# <<<<CONTROLS<<<<
+++

{{page_tags}}

---

\toc

\bhack{Nicky Case: an amazing person do interesting things!}{
While playing with [nutshell](https://github.com/ncase/nutshell), I wandered through the author [Nicky Case's blog](https://ncase.me/), and **BAM!**, she really lives a person I wish I could have been! She is insightful and develops interesting things. All her posts are worth reading. **Mark!**
}

## Setup nutshell in my Franklin Blog

The setup step is quite simple: just follow [the nutshell's official documentation](https://github.com/ncase/nutshell#advanced-features--options), and everything works fine.

\berror{But my style got mixed up:}{

Every heading has **larger top/bottom margin**:
~~~
<img src="/posts/2022/08/data/nutshell-franklin-css-mixed.png" width="20%" class="post-img">
~~~
}

Find out the css incompatiblity for me (knowledge of html+css ≈ 0.1%) is nightmare !

But I just got it worked for me anyway, without knowing why :sweat_smile: :

\btip{Compatibility of Franklin Academic template with nutshell:}{
It turns out to be the incompatible between [the Academic Theme of Franklin.jl](https://github.com/tlienart/ft-academic-resume) I used and nutshell's rendering. More specific, the `article-style` related css. Since I cannot figure out which exact css rule works, I just made all `article-style` related css unfunctional by modifying the `head.html`:

> I changed `<div class="article-style">` to `<div class="gst-style">` so that every `article-style` related div in my pages were changed into `gst-style` (which with css I did not defined).

\Serror{Updated 2022-09-16}:

It turns out it is these css rules that caused the incompat:

\html{
.article-style img,
.article-style video {
    margin-left: auto;
    margin-right: auto;
    margin-top: 2rem; <!-- here -->
    margin-bottom: 2rem; <!-- and here -->
    padding: 0
}
}

commit out these two rules, and it'll work. So I change the div class back now.

}

What's more, I found that on some header, a nutshell hinter pops up when hover, which is not what I want. So, I need a rule to turn on the nutshell functions page by page:

\btip{Set a `hasnutshell` var based nutshell function switch:}{
In the header of every markdown, there should be a keyword assign of `hasnutshell = false` to turn off nutshell functions by default. Change that to `hasnutshell = true` if you want to use nutshell functions in the specific markdown file. This was made happen by modifying the `stylesheets.html` to add a line of:
`````plain
{{if hasnutshell}}<script src="/libs/nutshell/nutshell.js"></script>{{end}}
`````
}

Now, everything just works fine for me 😄.

## Test normal nutshell functions

The nutshell-contained below was generated with:

### :x invisible hd1

text in invisible hd1. [:hd2](#VisibleHd2)

### : visible hd2

text in visible hd2.
\bhack{test}{test hack info}
\Shack{hack highlight}
\ahack{hacklogging}
\chack{hack colored text}

### normal hd

text that refers [:hd1](#InvisibleHd1) and [:hd2](#VisibleHd2) and plain text.


---

### :x invisible hd1

text in invisible hd1. [:hd2](#VisibleHd2)

### : visible hd2

text in visible hd2.
\bhack{test}{test hack info}
\Shack{hack highlight}
\ahack{hacklogging}
\chack{hack colored text}

### normal hd

text that refers [:hd1](#InvisibleHd1) and [:hd2](#VisibleHd2) and plain text.

\bwarn{Notes on basic nutshell usage}{
- for most cases, use the `:x header` grammar is enough;
- `: header` will convert the header into plain text, regardless of the header levels.
- the hrefs \Swarn{cannot be Chinese} for now, but the link text could be: `[:表头1](#hd1)` works fine while `[:hd1](#表头1)` not;
- the href calling could before the href defining;
- \Swarn{the styles within the nutshell popup are gone};
- the nutshell headers would still showup on Franklin's `\toc` contents;
}

### test code blocks

nutshell code block [:here](#test-code-blocks)

\berror{the highlight is a nightmare!}{
Compare to:

\julia{
function abc()
    println("abc")
end
}

\herror{UPDATED: 2022-09-25}{
The reason that every format within the NutShell bubble are gone is that Nutshell force to remove any `id, class, style ...` attributes assigned to the html. After comment out the related codes (Those start with comments of `// DOMPurify`), and force the NutShell to use rawHTML for downstream work, every style comes back (except for `Highlight.js` based code highlights), that's enough for me.

\Serror{Comment out these code may cause unexpected bugs, I just do it for my own using scene (which seldomly contain complex css styles). Be caution when applying to YOURS!}
}

}

# :x test-code-blocks

\julia{
function abc()
    println("abc")
end
}


---

## test use nutshell offical tests

### To write a section,

just use headings & paragraphs like this! Then...

### To embed a section,

just make a link with :colon at the front... [:LIKE THIS](#ToWriteASection)!

### Details about linking to stuff

**To link to a section on the same page**, use a # followed by the text of the section's heading – capitalization, spaces, and punctuation don't matter.

[:This example](#ToEmbedASection) links to `#ToEmbedASection`

**To link to a section from a different page**, link to the URL, followed by # and section heading:

[:This example](https://ncase.me/faq/#GoodMentalHealth) links to `https://ncase.me/faq/#GoodMentalHealth`

**If you link to a page without a #SectionHeading**, it'll embed the *whole* article.

[:This example](https://blog.ncase.me/parable-of-the-hill-climber/) links to `https://blog.ncase.me/parable-of-the-hill-climber/`

**Three notes on embedding from other pages:**

1) Not sure if you're doing it right? Test your link in this demo page! (Remember the :colon in the link text, and the # for the section!)

2) Only embed from sites you trust! They can change their content at any time (but that's problem for regular links, too). You can mirror/copy the site to be extra safe.

3) The other site must either also have Nutshell installed, or [:CORS](../#cors) enabled. If you don't know if the other site has Nutshell/CORS, test out linking to it in this demo page.

### Other Fun Stuff

You want to embed an explanation, but no-one's written it yet & you can't be bothered to either? **Get the intro from a Wikipedia article** by linking to it!

[:Catgirl on English Wikipedia](https://en.wikipedia.org/wiki/Catgirl) links to `https://en.wikipedia.org/wiki/Catgirl)`

[:Baguette on French Wikipedia](https://fr.wikipedia.org/wiki/Baguette_(pain)) links to `https://en.wikipedia.org/wiki/Catgirl)`

[:Universe on Simple Wikipedia](https://simple.wikipedia.org/wiki/Universe) links to `https://simple.wikipedia.org/wiki/Universe`

**You can also link to YouTube videos so they can expand in-place.** You can even specify a specific starting time – on a YouTube page, click 'Share' then 'Start at [time]'.

[:Knife-Wielding Tentacle, starting at 0:36](https://youtu.be/pQ2dI_B_Ycg?t=36) links to `https://youtu.be/pQ2dI_B_Ycg?t=36`

For more advanced features (like how to make a section hidden by default, get sections by text-search instead of headings, add words before/after an embedded snippet, etc...) check out [the documentation!](https://github.com/ncase/nutshell#advanced-features--options)

