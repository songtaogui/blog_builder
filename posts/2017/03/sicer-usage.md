+++
title = "sicer-usage"
showall = true
summary = """
  Brief usage of sicer: a chip-seq tool
  """

# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasnutshell = false
hasplotly = false
hasmermaid = false
tags = ["bioinformatics", "genomics"]
pubdate = Date("2017-02-24")
+++
{{page_tags}}


## 安装sicer(需要先安装python27，所以我先装了Anaconda—python27)：
### 在服务器上安装Anaconda—python27:

```shell
#sicer是基于py27编写的 所以装py27
wget http://repo.continuum.io/archive/Anaconda2-4.1.1-Linux-x86_64.sh
bash Anaconda2-4.1.1-Linux-x86_64.sh 
#then install follow the hint

#更新ipython 不然不能用：
conda update ipython
```
### 安装sicer
```shell
wget http://home.gwu.edu/~wpeng/SICER_V1.1.tgz
#解压后,修改sh脚本中的程序路径为自己的安装路径后,可以用了就

```
## SICER 使用

`#使用sicer时不能同文件夹内并行,不然跑乱了`

### 加control使用:

```sh
$ sh DIR/SICER.sh ["InputDir"] ["bed file"] ["control file"] ["OutputDir"] ["Species"] \
["redundancy threshold"] ["window size (bp)"] ["fragment size"] ["effective genome fraction"] \
["gap size (bp)"] ["FDR"]
```

参数意义:
  + __Species:__ allowed species and genome versions are listed in GenomeData.py. You can add your own species and/or genome versions and relevant data there.
  
  + __Redundancy Threshold:__ The number of copies of identical reads allowed in a library.
  
  + __ Window size:__ resolution of SICER algorithm. For histone modifications, one can use 200 bp
  
  + __Fragment size:__ is for determination of the amount of shift from the beginning of a read to the center of the DNA fragment represented by the read. FRAGMENT_SIZE=150 means the shift is 75.
  
  + __Effective genome fraction:__ Effective Genome as fraction of the genome size. It depends on read length.
  
  + __Gap size:__ needs to be multiples of window size. Namely if the window size is 200, the gap size should be 0, 200, 400, 600, ….

### 不加control的使用

```sh
$sh DIR/SICER-rb.sh <InputDir> <bed_file> <OutputDir> <species> <redundancy_threshold> <window_size(bp)> \
<fragment_size> <effective_genome_fraction> <gap_size(bp)> <E-value>
```

结果中:
__XXX.scoreisland:__ delineation of significant islands controlled by E-value of XXX, in “chrom start end score” format

__XXX-islandfiltered.bed:__ library of raw redundancy-removed reads that are on significant islands

sicer是基于python2.7版本编写的！！！用python3报错

#### 例子： 不加control 比对到自定义基因组 nnrad：

在sicer目录中修改GenomeData。py 自定义自己的genome：

`vim /lustre/home/jiangff/software/app/SICER/lib/GenomeData.py`

```python
#加入如下四个字典：
nnrad_chroms = ['chr1','chr2','chr3','chr4','chr5','chr6','chr7','chr8']

nnrad_chrom_lengths = {'chr1':215457871, 
                       'chr2':111919172, 
                       'chr3':67969125,
                       'chr4':110707164, 
                       'chr5':92813262, 
                       'chr6':82555766,
                       'chr7':58724518, 
                       'chr8':61092866}

species_chroms = {
            'nnrad':nnrad_chroms, #加入的内容
            'mm8':mm8_chroms, 
            'mm9':mm9_chroms, 
            'hg18':hg18_chroms,
            'hg19':hg19_chroms,
            "dm2":dm2_chroms, 
            "dm3":dm3_chroms, 
            "sacCer1":sacCer1_chroms,
            "pombe":pombe_chroms, 
            'rn4':rn4_chroms,
            'tair8':tair8_chroms,
            'background':background_chroms};


species_chrom_lengths={
               'nnrad':nnrad_chrom_lengths, #加入的内容
               'mm8':mm8_chrom_lengths,
               'mm9':mm9_chrom_lengths,
               'hg18':hg18_chrom_lengths,
               'hg19':hg19_chrom_lengths,
               'dm2':dm2_chrom_lengths,
               'dm3':dm3_chrom_lengths,
               'sacCer1':sacCer1_chrom_lengths,
               'pombe':pombe_chrom_lengths,
               'rn4':rn4_chrom_lengths,
               'tair8':tair8_chrom_lengths,
               'background':background_chrom_lengths};                       
```

```shell
#用sicer分析
SICER-rb.sh XXX.bed [outdir] [species] 1 1000 150 0.74 1000 0.0001
```

结果中：
`chip2Rad.soap.uniq.sam-W1000-G1000-E0.0001.scoreisland` 可用画图 

