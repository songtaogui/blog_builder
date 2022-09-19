+++
title = "comparative_genomics_related_things"
showall = true
summary = """
  Mummer and LastZ for WGA
  """

# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasnutshell = false
hasplotly = false
hasmermaid = false
tags = ["bioinformatics", "WGA"]
pubdate = Date("2016-12-25")
+++

{{page_tags}}

## MUMmer 序列比对

详见 [TheMUMmer3manual](http://mummer.sourceforge.net/manual/)
  
### 1.比对: nucmer/promer

```sh
nucmer/promer [options] <Ref> <Query>
```

参数： (Ref 和 Query 都可以是多序列)

```sh
-maxmatch 不考虑unigueness，可得到更多匹配
-c <int>    设置最小匹配簇,nucmer默认是65,promer默认20
-g <int>    设置相邻matches的最大gap值,n默认90,p默认30
-p <string> 输出文件前缀,默认是out,输出文件为out.delta
```

### 2.比对结果的展现:
1. `show-coords -c -d -l -L<int> -I<float> -r <比对结果文件.delta> > <输出文件>`
  
  ```sh
  -c: 包含覆盖度
    -d: 包含比对方向
    -l: 包含ref和query长度信息
    -I<float>:  限制呈现的最小的identify
    -L<int>:    限制呈现的最小长度
    -q: 按照query ID和坐标排序
    -r: 按照Ref ID和坐标排序   
    -T: 输出结果用tab分割
    注: 如用于后续的mapview,则必须加上-c -r -l这三个参数
    更多参数用-h查看
  ```
  
2. `show-aligns <比对结果.delta> "某条Ref ID" "某条query ID" > XXXXX.aligns`

        #查看两条序列比对情况
        -q/-r   同上
        -w int  Set the screen width - default is 60
        -x int  Set the matrix type - default is 2 (BLOSUM 62),
        other options include 1 (BLOSUM 45) and 3 (BLOSUM 80)
        note: only has effect on amino acid alignments
    

## LastZ

`lastz sequence1.fasta sequence2.fasta `

### 常用参数设定 

详见: [官方帮助文档](http://www.bx.psu.edu/miller_lab/dist/README.lastz-1.02.00/README.lastz-1.02.00a.html)

 - `gfextend/nogfextend`
    Perform/Skip gap-free extension of seeds to HSPs (high scoring segment pairs)
 - `chain/nochain`

    Perform/Skip chaining of HSPs.

 - `gapped/nogapped`

    Perform/Skip gapped extension of HSPs.

 - `format`

    Output format. Type <general> performs a tabular file. [detail](http://www.bx.psu.edu/miller_lab/dist/README.lastz-1.02.00/README.lastz-1.02.00a.html#option_format)

 - `ambiguous=n`

    Treat each N in the input sequences as an ambiguous nucleotide. Substitutions with N are scored as zero.

 - `ambiguous=iupac`

    Treat each of the IUPAC-IUB ambiguity codes (B, D, H, K, M, R, S, V, W, Y as well as N) in the input sequences as a completely ambiguous nucleotide. Substitutions with these characters are scored as zero.

