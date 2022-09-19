+++
title = "Office_word_High_CPU_using"
showall = true
summary = """
  解决word占用cpu过高的办法
  """

# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasnutshell = false
hasplotly = false
hasmermaid = false
tags = ["windows"]
pubdate = Date("2017-09-08")
+++
{{page_tags}}

最近经常由于word（office 2016）占用%50的cpu导致电脑风扇狂转；最终发现是由于Endnote频繁检查word更新导致，将word语法校正和Endnote自动扫描相关选项都关掉终于好了。记录如下：
## 1. 关掉word语法键入时校正
word中 `文件--选项--校对`，取消勾选“键入时XXX”：

![](https://leanote.com/api/file/getImage?fileId=59b2add6ab644169d1002d4c)

## 2. 关掉Endnote自动format

### 2.1 取消“Instant Formatting”

![](https://leanote.com/api/file/getImage?fileId=59b2add6ab644169d1002d4d)

### 2.2 Preference-取消新文档Instant Formatting

![](https://leanote.com/api/file/getImage?fileId=59b2add6ab644169d1002d4a)


