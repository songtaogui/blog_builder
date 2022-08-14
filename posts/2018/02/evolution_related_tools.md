+++
title = "evolution_related_tools"
showall = true
summary = """
  Brief usage of some evolution related tools:
  - jModeltest: for model selection
  - phyML: ml tree
  - RAxML: faster ml tree
  - mrbayes: bayes tree
  -paml-codeml: branch-site model
  """
rss = summary
# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasplotly = false
hasmermaid = false
tags = ["bioinformatics","evolution"]
pubdate = Date("2018-02-05")
+++
{{page_tags}}

##  jModeltest

### Installation

 [HERE](https://drive.google.com/drive/folders/0ByrkKOPtF_n_OUs3d0dNcnJPYXM)

### USAGE

快速开始:
```sh
java -jar jModelTest.jar -g 4 -i -f -AIC -BIC -a -d <IN.fas_aln> -o <OUT> 
java -jar jModelTest.jar -s 11 -g 4 -i -f -AIC -BIC -AICc -DT -p -w -a -d <IN.fas_aln> -o <OUT>
```

详细 CMD 指令:

```
jModelTest command usage
java -jar jModelTest.jar -d sequenceFileName
                        [-getPhylip]
                        [-ckp checkpointFileName.ckp]
                        [-n executionName]
                        [-t fixed|BIONJ|ML] [-u userTreeFileName] [-o outputFileName]
                        [-S NNI|SPR|BEST]
                        [-AIC] [-AICc] [-BIC] [-DT] [-c confidenceInterval]
                        [-s 3|5|7|11|203]
                        [-f] [-i] [-g numberOfCategories]
                        [-uLNL]
                        [-dLRT] [-h confidenceInterval] [-hLRT] [-O {ftvwxgp}]
                        [-a] [-z] [-p] [-v] [-w]
                        [-tr numberOfThreads] [-machinesfile machinesFileName]

     -a
         estimate model-averaged phylogeny for each active criterion (e.g., -a) (default is false)

     -AIC
         calculate the Akaike Information Criterion (e.g., -AIC) (default is false)

     -AICc
         calculate the corrected Akaike Information Criterion (e.g., -AICc) (default is false)

     -BIC
         calculate the Bayesian Information Criterion (e.g., -BIC) (default is false)

     -DT
         calculate the decision theory criterion (e.g., -DT) (default is false)

     -c confidenceInterval
         confidence interval (e.g., -c 90) (default is 100)

     -ckp checkpointFileName
         Loads a checkpointing file

     -d sequenceFileName
         input data file (e.g., -d data.phy)

     -dLRT
         do dynamical likelihood ratio tests (e.g., -dLRT)(default is false)

     -f
         include models with unequals base frecuencies (e.g., -f) (default is false)

     -g numberOfCategories
         include models with rate variation among sites and number of categories (e.g., -g 8) (default is false & 4 categories)

     -G threshold
         heuristic search. Requires a threshold > 0 (e.g., -G 0.1)

     -getPhylip
         converts the input file into phylip format

     -h confidenceInterval
         confidence level for the hLRTs (e.g., -a0.002) (default is 0.01)

     -H informationCriterion
         information criterion for clustering search (AIC, AICc, BIC). (default is BIC)
         this argument applies only for 203 substitution schemes (e.g., -s 203 -H AIC)

     -help
         displays this help message

     -hLRT
         do hierarchical likelihood ratio tests (default is false)
         hypothesis testing order can be specified with -O argument

     -i
         include models with a proportion invariable sites (e.g., -i) (default is false)

     -machinesfile manchinesFileName
         gets the processors per host from a machines file

     -n executionName
         execution name for appending to the log filenames (default: current time yyyyMMddhhmmss)

     -o outputFileName
         set output file (e.g., -o jmodeltest.out)

     -O hypothesisOrder
         hypothesis order for the hLRTs (e.g., -hLRT -O gpftv) (default is ftvwxgp)
            f=freq, t=titvi, v=2ti4tv(subst=3)/2ti(subst>3), w=2tv, x=4tv, g=gamma, p=pinv
            this argument is used only if -hLRT argument is set
            'f','t','v','g','p' are mandatory in any order. 'w' is optional, and 'x' requires 'w' to be present
            thus, length should be 5, 6 *including 'w') or 7 (including both 'w' and 'x')
            e.g., -hLRT -O gpfvwxt

     -p
         calculate parameter importances (e.g., -p) (default is false)

     -r
         backward selection for the hLRT (e.g., -r) (default is forward)

     -s numberOfSubstitutionSchemes
         number of substitution schemes (e.g., -s 11) (it has to be 3,5,7,11,203; default is 3)

     --set-local-config localConfigurationFile
         set a local configuration file in replacement of conf/jmodeltest.conf

     --set-property propertyName=propertyValue
         set a new value for a property contained in the configuration file (conf/jmodeltest.conf)

     -S NNI|SPR|BEST
         tree topology search operation option (NNI (fast), SPR (a bit slower), BEST (best of NNI and SPR)) (default is BEST)

     -t fixed|BIONJ|ML
             base tree for likelihood calculations (e.g., -t BIONJ)
             fixed  (common BIONJ-JC topology)
             BIONJ  (Neighbor-Joining topology)
             ML     (Maximum Likelihood topology) (default)

     -tr numberOfThreads
         number of threads to execute (default is 4)

     -u treeFileName
         user tree for likelihood calculations  (e.g., -u data.tre)

     -uLnL
         calculate delta AIC,AICc,BIC against unconstrained likelihood (e.g., -uLnL)

        (default is false if the input alignment has gaps or ambiguous characters)

     -v
         do model averaging and parameter importances (e.g., -v) (default is false)

     -w
         write PAUP block (e.g., -w) (default is false)

     -z
         strict consensus type for model-averaged phylogeny (e.g., -z) (default is majority rule)

 Command line: java -jar jModeltest.jar -d sequenceFileName [arguments]

 Example: java -jar jModeltest.jar -d sequenceFileName -i -f -g 4 -BIC -AIC -AICc -DT -v -a -w
```

## phyML构树

### GTR+G+I 不用bootstrap 而是用aLRT-SH-like检测

```sh
phyml -b -4 --run_id GTR+G+I -m GTR -a e -v e -o tlr --no_memory_check -i <**.phy>
```

### GTR+G      

```sh
phyml -b -4 --run_id GTR+G -m GTR -a e -o tlr --no_memory_check -i <**.phy>
```

aLRT is a statistical test to compute branch supports. It applies to every (internal) branch and is computed along PhyML run on the original data set. Thus, aLRT is much faster than standard bootstrap which requires running PhyML 100-1,000 times with resampled data sets. As with any test, the aLRT branch support is significant when it is larger than 0.90-0.99. With good quality data (enough signal and sites), the sets of branches with bootstrap proportion >0.75 and aLRT>0.9 (SH-like option) tend to be similar. Perform bootstrap and number of resampled data sets 

### 检测已有树的SH值

-u 已有树 -o lr #只对枝长l和替代率r进行优化.


## RAxML构树

### Installation

[HERE](http://sco.h-its.org/exelixis/software.html)，
这个站点还有`EAxML`,关注一下。

### Usage

#### 快速开始(含bootstrap检测)：

```sh
raxml-SSE3 -f a -m GTRGAMMA -p 12345 -# 1000 -x 12345 -n [outname] -s [in_file(phy/fas )] 
```

#### 多线程

```sh
raxmlHPC-PTHREADS-SSE3 -T [线程数] -f a -m GTRGAMMAI -p 12345 -# 1000 -x 12345 -n [out] -s [IN]
```

## mrbayes 使用

### 简单步骤

1  序列的比对，然后将比对好的序列转化成.nex格式
 
2  运行MrBayes，简单步骤如下：（依次输入命令，完成简单也最常用的分析）：

```sh
1 Execute filename.nex #打开待分析文件。
2 Lset nst=6 rates=invgamma 
#该命令设置进化模型为with gamma-distributed rate variation across sites和a proportion of invariable sites的GTR模型。模型可根据需要更改，不过一般无须更改。
3  mcmc ngen=1000000 samplefreq=100 printfreq=100 diagnfreq=1000
#This will ensure that you get at least 200 samples from the posterior probability distribution, 
#and that diagnostics are calculated every 1,000 generations. For larger data sets you probably want 
#to run the analysis longer and sample less frequently. The default sample and printfrequency is 500, 
#the default diagnostic frequency is 5,000, and the default run length is 1,000,000. You can find the 
#predicted remaining time to completion of the analysis in the last column printed to screen
 
4  如果分裂频率分支频率split frequencies的标准偏差standard deviation在100,000代generations以后低于0.01，
   当程序询问：“Continue the analysis? (yes/no)”，回答no；如果高于0.01，yes继续直到该值低于0.01。
 
5  sump burnin=250 (或者sump relburnin=yes burninfrac=0.25)
#（在此为1000个样品，即任何相当于你取样的25％的值,不加burnin就统计全部）
#参数总结summarize the parameter，程序会输出一个关于样品（sample）的替代模型参数的总结表，
#包括mean，mode和95 % credibility interval of each parameter，要保证所有参数PSRF（the potential scale
# reduction factor）的值接近1.0，如果不接近，分析时间要延长。
 
6  sumt burnin=250，(或者sumt relburnin=yes burninfrac=0.25) 
#总结树summarize tree。程序会输出一个具有每一个分支的posterior probabilities的树以及一个具有平均枝长
#mean branch lengths的树。这些树会被保存在一个可以由treeview等读取的树文件中
```

## paml-codeml: branch-site model (test2):

### 1. 前期准备：
    比对好的序列（氨基酸比对）
    树文件（phy格式，只要名字和括号，前景枝用“#1”标注）
    控制文件（如果名为codeml的话 运行程序是无需声明，其他名字需要声明）

### 2. 参数选择： 
    Model A’, with w2 = 1 fixed
        model = 2 NSsites = 2 fix_omega = 1 omega = 1
    Model A, with w2 estimated
        model = 2 NSsites = 2 fix_omega = 0 omega = 1.5 (or any value > 1)


