+++
title = "busco-usage"
showall = true
summary = """
  Brief usage of BUSCO: estimating genome/transcript/protein completeness based on Single Copy Orthologs
  """
rss = summary
# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasplotly = false
hasmermaid = false
tags = ["bioinformatics", "genomics"]
pubdate = Date("2017-06-03")
+++
{{page_tags}}


## BUSCO 安装
1. BUSCO使用需要依赖软件: 

    + python3; 
    + hmmer; 
    + NCBI BLAST+; 
    + Augustus 3.0.x (genome only); 
        - boost
        - zlib
        - bamtools (编译需要cmake)
    + EMBOSS tools 6.x.x

安装相关软件并设置环境变量：

### python3 
```shell
wget https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz
tar zxvf Python-3.5.2.tgz
cd Python-3.5.2
./configure --prefix=$SFTW/app/python35
make -j8 && make install
echo 'export PATH=SSFTW/app/python35/bin:$PATH' >> ~/.zshrc && source ~/.zshrc #addpath
```

### hmmer:
```shell
wget http://eddylab.org/software/hmmer3/3.1b2/hmmer-3.1b2.tar.gz
tar zxvf hmmer-3.1b2.tar.gz
cd hmmer-3.1b2
./configure --prefix=$SFTW/app/hmmer
make -j8 && make install
addpath
```

### boost：
```shell
wget https://sourceforge.net/projects/boost/files/boost/1.61.0/boost_1_61_0.tar.gz
tar zxvf boost_1_61_0.tar.gz
cd boost_1_61_0
./bootstrap.sh --prefix=$SFTW/app/boost
./b2
./bjam install
添加环境变量到 ~/.zshrc
export BOOST_INCLUDE=$SFTW/app/boost/include
export BOOST_LIB=$SFTW/app/boost/lib

```

### zlib:
```shell
wget http://zlib.net/zlib-1.2.8.tar.gz
tar zxvf zlib-1.2.8.tar.gz
cd zlib-1.2.8
./configure --prefix=/lustre/home/jiangff/software/app/zlib
make -j8 && make install
cp -r /lustre/home/jiangff/software/app/zlib/* $SFTW 
#$sftw主目录下的include 和lib已经添加环境变量 所以直接复制过去

```

### cmake：
```shell
wget https://cmake.org/files/v3.6/cmake-3.6.1.tar.gz --no-check-certificate
tar zxvf |cd 
./configure --prefix=$SFTW/app/cmake
make -j8 && make install
cd bin|addpath

```

### bamtools：
```shell
wget https://codeload.github.com/pezmaster31/bamtools/zip/master
mv master bamtools.zip
unzip bamtools.zip
cd bamtools-master
mkdir build
cd build
cmake ..
make -j8
cd ..
cp -r bin/ include/ lib/ $SFTW
```

### Augustus:
```shell
wget http://bioinf.uni-greifswald.de/augustus/binaries/augustus.current.tar.gz
tar | cd
make -j8
cd ..
mv augustus-3.2.2/ /lustre/home/jiangff/software/app/augustus
addpath: $SFTW/app/augustus/bin | scripts
#在~/.zshrc 加上：
export AUGUSTUS_CONFIG_PATH=$SFTW/app/augustus/config #不加这个不行！
```

### EMBOSS tools:
```shell
wget http://debian.rub.de/ubuntu/pool/universe/e/emboss/emboss_6.6.0.orig.tar.gz
tar |cd 
./configure --prefix...
make && make install
addpath
```

### BUSCO
```shell
wget http://busco.ezlab.org/files/BUSCO_v1.2.tar.gz
tar zxvf BUSCO_v1.2.tar.gz
#解压即可用
mv to $SFTW/app/BUSCO
#在~/.zshrc添加：
alias BUSCO="python /lustre/home/jiangff/software/app/BUSCO/BUSCO_v1.2.py"

#下载资料库（以真核资料库为例）：
    wget http://busco.ezlab.org/files/eukaryota_buscos.tar.gz
    tar zxvf eukaryota_buscos.tar.gz
    mv eukaryota $SFTW/app/BUSCO

```

## BUSCO使用

### BUSCO quick start

- Genome assembly assessment:

    ```shell
    python BUSCO_v1.1b.py -o NAME -in ASSEMBLY -l LINEAGE –m genome
    ```
**NAME** name to use for the run and all temporary files
**ASSEMBLY** genome assembly file in fasta format
**LINEAGE** path to the BUSCO lineage data (i.e. /path/to/lineage)

- ­Gene set assessment:

    ```shell
    python BUSCO_v1.1b.py -o NAME -in GENE_SET -l LINEAGE -m OGS
    ```

- ­Transcriptome assessment:


    ```
    python BUSCO_v1.1b.py -o NAME -in TRANSCRIPTOME -l LINEAGE -m trans
    ```
    
### BUSCO使用



#### 1. Genome assembly assessment:

```sh
python BUSCO_v1.1b.py -o NAME -in ASSEMBLY -l LINEAGE –m genome

#NAME      name to use for the run and all temporary files
#ASSEMBLY  genome assembly file in fasta format
#LINEAGE   path to the BUSCO lineage data
```

#### 2. Gene set assessment:

```sh
python BUSCO_v1.1b.py -o NAME -in GENE_SET -l LINEAGE -m OGS

#NAME       name to use for the run and temporary files
#GENE_SET   gene set protein sequence file in fasta format
#Lineage    path to the BUSCO lineage data (i.e. /path/to/lineage)
```

#### 3. Transcriptome assessment:

```sh
python BUSCO_v1.1b.py -o NAME -in TRANSCRIPTOME -l LINEAGE -m trans

#NAME           name to use for the run and temporary files
#TRANSCRIPTOME  transcript set sequence file in fasta format
#LINEAGE        path to the BUSCO lineage data (i.e. /path/to/lineage)
```

### BUSCO options

```sh
python BUSCO_v1.1b.py -in INPUT -o OUTPUT -l LINEAGE -m MODE
```

__[Options]__

1-­ Mandatory arguments

    -o name Name used for naming output files
    -in input_file Genome assembly / gene set / transcriptome in fasta format
    -l lineage Path to the BUSCO lineage data to be used
    Example: -­l /path/to/metazoa
    -m mode Mode of analysis
    Valid options: genome, ogs, trans
    Default: genome

2-­ Optional arguments

    -h –help Print help
    -c integer Number of CPU threads to be used
    Default: 1
    -sp species Select from the pre-­computed Augustus metaparameters
    Selecting a closely-­related species usually produces better results
    Valid options: see Augustus help for list of options
    Default: generic
    -e evalue Use a custom blast e-­value cutoff
    Default: 0.01
    -f Force overwriting of results files from a previous run with the same name
    --flank N Custom flanking genomic regions in base pairs (bp)
    Used when extending selected candidate regions before gene prediction
    Default: Automatically calculated flank sizes based on genome size
    -­-­long Performs full optimization for Augustus gene finding training
    Default: Off

### BUSCO Output

Successful execution of the BUSCO assessment pipeline will create a directory named
name_OUTPUT where ‘name’ is your assigned name for the assessment run. The directory will
contain several files and directories:

#### Files

    short_summary_    Contains summary results in BUSCO notation and a brief breakdown of the metrics
    
    full_table_       Complete results in tabular format with coordinates, scores and lengths of 
                      BUSCO matches
    
    training_set_     Set of complete BUSCO matches used for training Augustus 
                      Only created during genome assessment
    
    _tblastn          Results in tabular format of tBLASTn searches with BUSCO consensus sequences

#### Directories

    augustus_         Augustus-­predicted genes
                      Only created during genome assessment
    augutus_proteins  Corresponding Augustus-­predicted proteins
                      Only created during genome assessment
    selected          Complete BUSCO matches, used for training Augustus
    gb                Complete BUSCO matches, GenBank format
    gffs              Complete BUSCO matches, GFF format
    hmmer_output      Tabular format HMMER output of searches with BUSCO HMMs

### 例子

BUSCO 评价基因组组装质量

Ask for Plant Lineage data:
`felipe.simao@unige.ch` NO ANSWER

Using Eukaryote instead:

```shell
#BUSCO: aliased to "python XXX/XXX/BUSCO/BUSCO_v1.2.py"

BUSCO -o Rad -in AAA.fasta -l $SFTW/app/BUSCO/eukaryota -m genome

```

结果：

```
Summarized benchmarks in BUSCO notation:
        C:0%[D:0%],F:0%,M:0%,n:429

        190     Complete BUSCOs
        139     Complete and single-copy BUSCOs
        51      Complete and duplicated BUSCOs
        32      Fragmented BUSCOs
        207     Missing BUSCOs
        429     Total BUSCO groups searched

```


