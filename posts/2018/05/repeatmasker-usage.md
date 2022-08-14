+++
title = "repeatmasker-usage"
showall = true
summary = """
  Brief usage of Repeatmasker
  """
rss = summary
# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasplotly = false
hasmermaid = false
tags = ["bioinformatics", "genomics"]

pubdate = Date("2018-05-03")
+++
{{page_tags}}



## RepeatMasker使用

>2018-05-03注 若安装报错 参考该博客安装
：https://blog.csdn.net/woodcorpse/article/details/73148464

### Installation 

####  1. RMblast

```shell
# RMBlast install
wget  ftp://ftp.ncbi.nlm.nih.gov/blast/executables/rmblast/2.2.28/ncbi-rmblastn-2.2.28-src.tar.gz
# compiled with g++ compiler
tar zxvf ncbi-rmblastn-2.2.28-src.tar.gz #解压
cd ncbi-rmblastn-2.2.28-src/c++/
./configure --with-mt --prefix=$SFTW/app/rmblastn --without-debug
make -j8 && make install #make 的时间很长 30min左右

```

#### 2. TRF 安装

```shell
wget http://tandem.bu.edu/trf/downloads/trf409.linux64
chmod a+x trf409.linux64
mv trf409.linux64 $SFTW/bin/trf
```

#### 3. RepeatMasker 安装

```shell
wget http://www.repeatmasker.org/RepeatMasker-open-4-0-6.tar.gz
tar zxvf|cd
mv to $SFTW/app

下载最新数据库（http://www.girinst.org/），需要账号登陆，下载完后传到服务器
解压并替换掉RepeatMasker/Libraries/

#下载Dfam数据库：
wget http://www.dfam.org/web_download/Release/Dfam_2.0/Dfam.hmm.gz
#我用wget下载失败 自己下载hou传到服务器
解压到RepeatMasker/Libraries/

cd $SFTW/app/RepeatMasker
./configure
#按照提示输入程序路径（主要是rmblast的路径）
#安装成功！
#创建软连接，注意一定要用绝对路径
ln -s $SFTW/app/RepeatMasker/RepeatMasker $SFTW/bin

```

### USAGE

from biostars：
```shell
RepeatMasker -nolow -no_is -norna -parallel 1 \
-lib /data/tanhao/lib/RepeatMasker/Libraries/RepeatMasker.lib genome.fa >repeatmask.log 2
```

个人总结参数问题：

    -nolow 不识别low_complex 不识别简单序列
    -species ""引号括起来的物种名可以用空格
    -lib 指定自定义数据库后，仍会在默认库中搜索，优先级是怎么样的？自定义库的搜索结果会在结果中展示么？
    
