+++
title = "Franklin静态博客配置记录"
# tags = [ "programming","bioinformatics","genetics","paper","work","daily","random","insight", ... ]
tags = ["programming","julia","franklin"]
showall = true
summary = """
  Franklin一些使用技巧记录.
  """
rss = summary

hasplotly = false
hasmermaid = false
hascode = true
hascomment = true

pubdate = Date("2022-08-13")
+++

{{page_tags}}

\toc

## Julia code live evaluation

>2022年8月13日

`````plaintext

```julia:./code/ex1
a = 10
@show a
```
#= code result show func =#
\output{./code/ex1}
\textoutput{./code/ex1}
\show{./code/ex1}

#= code hiding comments: =#
# hide
# hideall

`````

## 解析BibTeX渲染Achievement页面

>2022年8月13日

- 参考[Jean-François **BAFFIER** 的blog](http://baffier.fr/publications.html)中的配置
- 基于`BibParser`解析BibTex
- 写成了一个函数`hfun_achieve_cards`, 可在[utils.jl](https://github.com/songtaogui/blog_builder/blob/master/utils.jl)中查看源码
- 在BAFFIER的css基础上微调

\bnote{注意事项}{
- 所有的BibTex信息需要放在`achievements/achievements.bib`中;
- BibTex需要包含`journal;year;keywords`字段的信息;
- 如果想提供pdf的下载, 需要把pdf文件存放在`achievements/pdf/`目录中, 且要用BibTex中的ID一样的名字;
}

\atodo{实在不太懂前端, 不会做cell的缩放自适应, 好在现在凑合能用, 就不纠结了先.}


## 添加`back_to_top_button`悬浮按钮

> 2022年8月13日

本意是想把TOC做成悬浮+折叠的, 但是好像要认真配置css, 先作罢;
在每个blog上添加回到页首的按钮, 也能比较方便地跳转目录:

原理很简单, 把组件的`position`属性设置成固定位置就好了:

```html
<!-- 保存到 bttb.html -->
<div class="back-to-top-button">
  <a href="#" class="back-to-top">
    <span class="button_icon">
      <i class="fas fa-chevron-up fa-2x"></i>
    </span>
  </a>
</div>
```

对应的CSS规则:

```css
/* back to top button */
.back-to-top-button {
    position: fixed;
    bottom: 100px;
    right: 100px;
    font-size: 10px;
    border: none;
    outline: none;
    background-color: #343a40;
    cursor: pointer;
    padding: 7px;
    border-radius: 10px;
}
```


然后在`page_foot.html`中配置按钮出现的规则就好了, 为了偷懒, 我用判断评论的参数一起判断了, 就是需要提供评论的页面, 也会同步出现该按钮:

```
{{ if hascomment }} {{ insert comment.html }} {{ end }}
{{ if hascomment }} {{ insert bttb.html }} {{ end }}
```
