+++
title = "misa_primer3_pipeline"
showall = true
summary = """
  Pipeline of: Identify SSR with misa, then design primers with primer3
  """

# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasnutshell = false
hasplotly = false
hasmermaid = false
tags = ["bioinformatics","genomics"]
pubdate = Date("2016-12-25")
+++
{{page_tags}}


## Misa鉴定SSR 并用primer3设计引物

Note:
    misa后续p3_in直接将fasta序列ID作为正则表达式,所以ID中尽量不要有"|*.?^"等奇怪符号,否则极有可能报错, 强烈建议跑之前替换掉奇怪字符

 ```sh
 perl -pi.bak -ne 's/[^>0-9A-Za-z_]/#/g' XXXX.FASTA 
 ```

  
### for primer3 release 1.1.1:

#### 1. 用 misa 识别和定位SSR

MISA:含‘misa.pl’和‘misa.ini’

（注：‘misa.ini’为配置文件 用来设置识别SSR标记的标准。）

 运行命令： 

```sh
perl misa.pl <**.fasta> 
#(misa.ini应与fasta文件放在同一目录下)
```

运行产生‘**.misa’和‘**.statistics’两个文件，‘**.misa’用于primer3引物设计。

#### 2. 用‘p3_in.pl’将输出文件‘.misa’转换成Primer3的输入文件

 运行命令：

```sh
 perl p3_in.pl **.misa
 #注：p3_in.pl程序会自动读取fasta源文件'**.fasta'，所以misa输出文件和源文件应与该程序在同一目录下。
```

运行产生‘**.p3in’，用于Primer3 输入。

#### 3、用 Primer3 批量设计引物：
 运行命令：
 
 ```sh
 primer3_core.exe < **.p3in > **.p3out
 ```
 
 
#### 4、用p3_out.pl解析 Primer3 输出文件：（要用到misa输出文件 **.misa）
 运行命令：
 
 ```sh
 perl p3_out.pl **.p3out **.misa
 ```
 
 运行后得到 **.results 文件，制表符分割，可用Excel打开。


### for primer3 2.3+:

其他不变 主要是`p3_in.pl`和`p3_out.pl`的改变,因为`primer3 2.3`以后 把输入和输出参数做了改动:

#### p3_in.pl改动(L30-33):

    print OUT "SEQUENCE_ID=$id"."_$ssr_nr\nSEQUENCE_TEMPLATE=$seq\n";
    print OUT "PRIMER_PRODUCT_SIZE_RANGE=100-280\n";
    print OUT "SEQUENCE_TARGET=",$start-3,",",$size+6,"\n";
    print OUT "PRIMER_MAX_END_STABILITY=250\n=\n";

#### p3_out.pl改动(L32-70):

```sh
  /PRIMER_LEFT_0_SEQUENCE=(.*)/ || do {$count_failed++;print OUT "$misa\n"; next};
  my $info = "$1\t";
  
  /PRIMER_LEFT_0_TM=(.*)/; $info .= "$1\t";
  /PRIMER_LEFT_0=\d+,(\d+)/; $info .= "$1\t";
  
  /PRIMER_RIGHT_0_SEQUENCE=(.*)/;  $info .= "$1\t";
  /PRIMER_RIGHT_0_TM=(.*)/; $info .= "$1\t";
  /PRIMER_RIGHT_0=\d+,(\d+)/; $info .= "$1\t";
  
  /PRIMER_PAIR_0_PRODUCT_SIZE=(.*)/; $info .= "$1\t";
  /PRIMER_LEFT_0=(\d+),\d+/; $info .= "$1\t";
  /PRIMER_RIGHT_0=(\d+),\d+/; $info .= "$1\t";
   
  /PRIMER_LEFT_1_SEQUENCE=(.*)/; $info .= "$1\t";
  /PRIMER_LEFT_1_TM=(.*)/; $info .= "$1\t";
  /PRIMER_LEFT_1=\d+,(\d+)/; $info .= "$1\t";
    
  /PRIMER_RIGHT_1_SEQUENCE=(.*)/;  $info .= "$1\t";
  /PRIMER_RIGHT_1_TM=(.*)/; $info .= "$1\t";
  /PRIMER_RIGHT_1=\d+,(\d+)/; $info .= "$1\t";
  
  /PRIMER_PAIR_1_PRODUCT_SIZE=(.*)/; $info .= "$1\t";
  /PRIMER_LEFT_1=(\d+),\d+/; $info .= "$1\t";
  /PRIMER_RIGHT_1=(\d+),\d+/; $info .= "$1\t";
    
  /PRIMER_LEFT_2_SEQUENCE=(.*)/; $info .= "$1\t";
  /PRIMER_LEFT_2_TM=(.*)/; $info .= "$1\t";
  /PRIMER_LEFT_2=\d+,(\d+)/; $info .= "$1\t";
    
  /PRIMER_RIGHT_2_SEQUENCE=(.*)/;  $info .= "$1\t";
  /PRIMER_RIGHT_2_TM=(.*)/; $info .= "$1\t";
  /PRIMER_RIGHT_2=\d+,(\d+)/; $info .= "$1\t";
  
  /PRIMER_PAIR_2_PRODUCT_SIZE=(.*)/; $info .= "$1\t";
  /PRIMER_LEFT_2=(\d+),\d+/; $info .= "$1\t";
  /PRIMER_RIGHT_2=(\d+),\d+/; $info .= "$1";
```


安装Primer3后，发现直接使用命令 

    primer3_core <example >example.out
    
出现错误：

    “PRIMER_ERROR=thermodynamic approach chosen, but path to thermodynamic parameters not specified”

1. 一种解决办法是输入命令时加入`-default_version=1`的参数:
        
        primer3_core  -default_version=1  -output=example.out  example

2. 另外一种解决办法如下：
创建文件夹（需要root权限）
    
        mkdir /opt/primer3_config
    
    然后将`primer3-2.3.6/src/primer3_congfig/`下的所有文件都移动创建的文件夹中
    
        cp -R ./primer3_congfig/*   /opt/primer3_config
        
    重新使用命令就不会报错了
    
        primer3_core <example >example.out
    

