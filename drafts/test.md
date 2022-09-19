+++
title = "test"
tags = ["random","daily","hacks"]
summary = """
     Put short description to your post here,
    will be show in the post list,
    and the rss info
    """
pubdate = Date("2022-09-18")

# showall = true
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

## test xranklin learned gramma

If the text of a heading is unique, the anchor will generally be just that text, in lowercase,
after replacing spaces and special characters by '`_`'.
So for instance if there's a unique heading `My Heading` the associated anchor will
be `#my_heading`. If there's several heading with the same text, the second heading
anchor id will be followed by `__2` and so on.

\showmd{
## a text
### a text
}

If you hover over the headings above, you'll see that the first one has id `#a_text`
and the second one `#a_text__2`.


\cmdiff{
  CommonMark supports indicating level 1 and 2 headings by underlying them
  with `===` or `---` ("_alt heading_") this is not supported in Franklin.  
}


\note{ aaa }
\info{ aaa }
\tip{ aaa }
\warn{ aaa }
\error{ aaa }
\todo{ aaa }
\hack{ aaa }




\kbd{kbdtest}
\bnote{Iam new bnote}{
- test if
- i
- work
  - fine
}

\markdown{
using abc
prinln("1234")
}

\julia{
using abc
prinln("1234")
}

\bash{
using abc
prinln("1234")
}
\perl{
$a = 123
prinln("1234")
}
\rust{
using abc
prinln("1234")
}
\plain{
using abc
prinln("1234")
}
\python{
using abc
prinln("1234")
}
\json{
using abc
prinln("1234")
}
\html{
using abc
prinln("1234")
}
\javascript{
using abc
prinln("1234")
}
\css{
using abc
prinln("1234")
}