+++
title = "ZMP_All_Expression-同时鉴定TE和基因表达的流程"
# tags = [ "programming","bioinformatics","genetics","paper","work","daily","random","insight", ... ]
tags = ["programming", "julia", "work", "transcriptomics"]
showall = true
summary = """
  Normal Gene expression use the primary alignments only, which are not be valid for TE expressons, this pipeline would get all alignments for each reads, and count them for both gene and te regions, then call expression for both gene and te.
  """
rss = summary

hasnutshell = false
hasplotly = false
hasmermaid = false
hascomment = true

pubdate = Date("2022-08-15")
+++

{{page_tags}}

## 思路

1. 一次比对, 输出所有比对结果
2. 统计基因和TE的reads counts
3. 对基因和TE分别进行标准化

## 设计

1. 比对: hisat2
   1. 建索引
   2. 比对: 需要输出全部结果`--all`(需要hisat2 version 2.2.0以上才有这个参数)
2. featurecounts:
   1. 基因区
   2. TE区
3. 标准化

