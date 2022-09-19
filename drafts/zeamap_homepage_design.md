+++
title = ""
tags = ["draft"]
pubdate = Date("2022-08-29")

hasnutshell = true
hasplotly = false
hasmermaid = false
hascomment = true
hidenavbar = true
# <<<<CONTROLS<<<<
+++

# ZEAMAP数据库首页和各个组学页面设计

## 1. 首页设计

> 首页需要在体现数据库特点并提供各个组学模块入口的同时, 尽量保持简洁。

\btodo{第一版设计:}{
在第一版布局的基础上优化: [ZEAMAP v1.0](http://www.zeamap.com/)
}

### 1.1 需要体现的元素

1. 全站检索输入框
2. 网站名称和基本介绍
3. 网站最新相关动态
4. 各个组学模块的入口
\del{5. 各个独立工具的入口 (砍掉了, 这个在导航栏中跳转即可)}

### 1.2 基本设计和素材

首页分三块:

1. 网站标题和基本介绍 + 照片墙 + 搜索框
2. 各组学入口卡片(图片+文字描述)
3. 独立工具入口(各个工具的图标+名字)

#### 1.2.1 标题-照片墙-搜索框

\bnote{1. 照片墙: 背景}{
- 需要后期可方便地\snote{增加新图片}: 方便添加新的照片进去 ,比如读取`/assets/photowall/`目录中的图片进行循环切换, 后期更新时只用在该目录中添加图片即可;
- 需要基因库的设计老师和前端老师定义好\snote{图片格式,大小,分辨率}, 后续更新严格按照定义的要求准备素材;
}

\bnote{2. 标题+描述+搜索框}{
- 标题: ZEAMAP (`<h1>`) 副标题: v2.0 (`<h2>`)
- 描述: A comprehensive database adapted to the maize multi-omics era
- 搜索框: 全站搜索工具, 样式:
  
  \swarn{(筛选条件▿) (········输入框········) (search button) >>[advanced search](/path/to/advanced/search/page)}

  [:一个示例](#searchbardemo)
}

\bhack{素材: 照片墙}{
目前只有一张, 即[:第一版的背景](#bgv1)

\Stodo{TODO:添加照片墙素材图片}
}

#### 1.2.2 各组学入口卡片设计

\bnote{可行方案:}{
卡片分两部分: 上图, 下文本: [:第一版的方案](#omicscarddemo)
}

\bwarn{其他方案:前端/设计老师提供更好的方案?}{
- 卡片是纯图片, 鼠标悬浮后反转展示文本信息?
- 响应式卡片? 鼠标悬浮放大图片?
- ...
}

\bhack{素材}{
\shack{这里提供的图片素材为第一版中的图片, 第一版中整体风格定位为\snote{卡通/清新}, 设计老师可根据第二版的风格重新设计相应的图案?}
> 以下图片素材大小均为 1181*473 像素
1. [:Genomics](#genomicscard)
2. [:Transcriptomics](#transcriptcard)
3. [:Variations](#variationcard)
4. [:Populations](#populationcard)
5. [:Genetics](#geneticscard)
6. [:Phenomics](#phenomicscard)
7. [:Metabolomics](#metabolomicscard)
8. [:Epigenetics](#epigeneticscard)
9. [:Evolutions](#evolutioncard)
}



---

# :x bgv1

\figdiy{/drafts/zeamap_homepage_data/search-bg.png}{}

# :x searchbardemo

\figdiy{/drafts/zeamap_homepage_data/search_bar_demo.png}{}

# :x omicscarddemo

\figdiy{/drafts/zeamap_homepage_data/omics_card_demo.png}{}


# :x genomicscard

- 图片(ZEAMAP_V1.0): \figdiy{/drafts/zeamap_homepage_data/omics-card/genomics.png}{}
- 设计理念: 该模块主要是基因组相关的信息, 图片能体现出DNA序列, 基因等信息即可
- 标题: Genomics
- 描述: Collection of maize reference genome assemblies, annotations and comparative genomics.


# :x transcriptcard


- 图片(ZEAMAP_V1.0): \figdiy{/drafts/zeamap_homepage_data/omics-card/transcriptomics.png}{}
- 设计理念: 该模块主要是转录组/可变剪切相关的信息, 图片要能体现出**RNA表达**,**可变剪切**等信息
- 标题: Transcriptomics
- 描述: Collection of maize transcriptomics including gene expression and alternative splicing.




# :x variationcard

- 图片(ZEAMAP_V1.0): \figdiy{/drafts/zeamap_homepage_data/omics-card/variations.png}{}
- 设计理念: 该模块主要是遗传变异相关的信息, 图片能体现出**DNA序列突变**的信息即可
- 标题: variations
- 描述: Variations among the *Zea* populations including single nucleotide polymorphisms (SNPs), insertion and deletions (InDels) and structure variations (SVs).



# :x populationcard

- 图片(ZEAMAP_V1.0): \figdiy{/drafts/zeamap_homepage_data/omics-card/populations.png}{}
- 设计理念: 该模块主要是群体和种质相关的信息, 图片要能体现出**材料的多态性**信息
- 标题: Populations
- 描述: Collection of Zea populations, germplasms and provides necessary information to understand the population structures.


# :x geneticscard

- 图片(ZEAMAP_V1.0): \figdiy{/drafts/zeamap_homepage_data/omics-card/genetics.png}{}
- 设计理念: 该模块主要是遗传定位相关的信息, 图片要能体现出**遗传定位**的特征(比如GWAS,连锁分析等)
- 标题: Genetics
- 描述: Collection of multi-omics maize genetic mapping loci and QTL signals from GWAS and linkage mapping.


# :x phenomicscard

- 图片(ZEAMAP_V1.0): \figdiy{/drafts/zeamap_homepage_data/omics-card/phenomics.png}{}
- 设计理念: 体现玉米农艺性状表型信息
- 标题: Phenomics
- 描述: Collection of phenomics information of complex agronomic traits among maize populations.


# :x metabolomicscard

- 图片(ZEAMAP_V1.0): \figdiy{/drafts/zeamap_homepage_data/omics-card/metabolomics.png}{}
- 设计理念: 体现**代谢网络**
- 标题: Metabolomics
- 描述: Collection of phylogenetic information among *Zea* and the genomic selective signals related to domestication, adaptation and improvement of maize.

# :x epigeneticscard

- 图片(ZEAMAP_V1.0): \figdiy{/drafts/zeamap_homepage_data/omics-card/epigenetics.png}{}
- 设计理念: 表观组学模块包含染色质交互, 组蛋白修饰, DNA甲基化等信息, 图片需要体现这些生物学特征。
- 标题: Epigenetics
- 描述: Collection of epigenetic and regulatory information among *Zea* including chromatin interaction, chromatin accessibility, histone modification and DNA methylation.


# :x evolutioncard

- 图片(ZEAMAP_V1.0): \figdiy{/drafts/zeamap_homepage_data/omics-card/evolutions.png}{}
- 设计理念: 体现**系统发生**, **大刍草->玉米驯化**
- 标题: Evolutions
- 描述: Collection of phylogenetic information among *Zea* and the genomic selective signals related to domestication, adaptation and improvement of maize.



