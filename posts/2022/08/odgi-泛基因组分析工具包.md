+++
title = "odgi-泛基因组分析工具包"
# tags = [ "programming","bioinformatics","genetics","paper","work","daily","random","insight", ... ]
tags = ["odgi","pan-genome","bioinformatics"]
showall = true
summary = """
  Instruction of pan-genome analysis toolkit ODGI.
  介绍泛基因组分析工具包ODGI的使用。
  """

# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasnutshell = false
hasplotly = false
hasmermaid = false
hascomment = true

pubdate = Date("2022-08-17")
+++

{{page_tags}}


\btodo{Unfinished}{

Need finish this blog!

}

\toc

## 简介

## 安装

## 命令集

### bin

### break

### bulid

### chop

### cover

### crush

### degree

### depth

### draw

### explode

### extract

### flatten

\bhack{图基因组的线性表示}{
\bash{
    odgi flatten [-i, --idx=FILE] [OPTION]…

# MANDATORY OPTIONS
-i, --idx=FILE # in.og/in.gfav1

# Output Options
-f, --fasta=FILE # 把node拼接后输出成一个线性的fasta
-n, --name-seq=STRING # 拼成的线性fasta的名字, 默认是输入文件的名字
-b, --bed=FILE  # 输出一个path => flatten fasta的坐标映射关系 Bed文件

# Threading & Info
-t, --threads=N
-P, --progress
-h, --help
}
}

\btodo{思考:}{
- 生成的线性fasta有实际意义么? SNP怎么处理的?
- path to flatten的映射bed文件, 似乎不太好解析, 难以直接用?
- 怎么用flatten鉴定PAV?
}



### flip

### groom

### heaps


### inject

### kmers


### layout


### matrix


### normalize


### overlap


### panpos


### pathindex


### pav

\bhack{基本参数}{

**输入pan-region, 输出每个region的pav ratio**

\bash{
    odgi pav [-i, --idx=FILE] [-b, –bed-file=FILE] [OPTION]…

# 必须参数: IO
-i,--idx=FILE # odgi的图表示, 也可以输入gfav1, 但是程序会自动转成og, 转换过程比较慢
-b,--bed-file=FILE # 鉴定这个bed区间内的pav信息

# 可选参数:
-p, --path-groups=FILE # 提供og中path的分组信息,两列的列表: <path.name>    <group.name>
-S, --group-by-sample  # 按照PanSN的命名规范(sample#hap#ctg), 对sample进行分组
-H, --group-by-haplotype # 按照PanSN命名规范, 对hap进行分组
-B, --binary-values=THRESHOLD # 设置cutoff, 把pav转成0/1表示: ratio > cutoff ? 1 : 0
-M, --matrix-output # 生成pav矩阵的格式, 列: regions, 行: paths/groups

# 性能参数
-t, --threads=N
-P, --progress  # 进度条
-h, --help

}
}


\bwarn{用法示例}{
> 参考[这里](https://odgi.readthedocs.io/en/latest/rst/tutorials/presence_absence_variants.html)
}

几个注意点:

- og中的每个path都能用来鉴定pav, 通常鉴定pav的时候需要进行滑窗操作, 可以用`bedtools makewindows`生成窗口
- PAV ratio的计算公式:($len$: lenght; $N_{ovlp}$: 与区间中的path有交集的node; $N_{all}$: 区间中的所有node)

  $$ ratio = \dfrac{\sum len(N_{ovlp})}{\sum len(N_{all})} $$

- `-p`\sp{1}**非常有用!!!**, 如果不加分组信息, 会对每个path都输出一个pav结果, 文件大小轻松上TB级别!!!
- `-M`\sp{1}输出pav矩阵, 跟`-B`一起用, 很方便得到PAV的0/1矩阵
- 可以不局限于一个ref的path, 可以对所有的path都鉴定PAV:

\bash{
odgi paths -i ref.og -L > all.paths.txt # 输出所有path
odgi untangle -i ref.og -R all.paths.txt | sed '1d' |\
    cut -f 4,5,6 | sort | uniq  > all.paths.bed # 输出所有path的区间信息
odgi pav -i ref.og -b all.paths.bed -M > all.paths.pav.matrix # 鉴定pav
}

\btodo{思考:}{
- 如何去除冗余?
- 如何把path的区间变回真实的基因组上区间?
- 可以生成一致性的区间, 然后再鉴定PAV么? => [`odgi flatten`似乎可以?](#flatten)
}


### paths


### position


### prune


### procbed


### server


### sort


### squeeze


### stats


### stepindex


### tips


### unchop


### unitig


### untangle


### validate


### version


### view


### viz




