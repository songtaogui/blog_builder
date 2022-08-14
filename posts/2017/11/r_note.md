+++
title = "r_note"
showall = true
summary = """
  My R-language note
  """
rss = summary
# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasplotly = false
hasmermaid = false
tags = ["programming", "R"]
pubdate = Date("2017-11-25")
+++
{{page_tags}}


# R Note

## Common Use

### 1. 系统操作:

```sh
save.image('mydata.rdata');load('mydata.rdata')#保存/读取工作环境
getwd() # pwd; 
setwd() # cd; 
dir() # ls;
ls() # 列出所有变量.
```

### 2. %>% R语言管道:

就是把左件的值发送给右件的表达式，并作为右件表达式函数的第一个参数。

```sh
# anscombe_tidy <- anscombe %>% mutate(observation = seq_len(n()))
#以上代码等价于
# anscombe_tidy = mutate(anscombe,observation = seq_len(n()))
```

### 2. 读写:


```sh
#把第一列作为列名:
row.names(data) <- data[, 1]
data<- data[, -1]
#键盘读入:
readline()
#剪切板读写:
data <- readClipboard(); data1 <- strsplit(data,"\t")
read.table(file="clipboard",header=TRUE)
writeClipboard()	
#写入列表:
write.table(data,file="XXX",sep="\t",quote=L,row.names=L,col.names=L,...)	
#读取excel-xlsx:
library(xlsx)
dat <- read.xlsx("XXX.xlsx", sheetName="XXXsheet")

#写入excel-xlsx:
##单个sheet:
library(xlsx)
write.xlsx(dat, "dat.xlsx")
##多个sheet:
library(xlsx)
cars <- createWorkbook()
cars1 <- createSheet(wb=cars, sheetName="Cars")
cars2 <- createSheet(wb=cars, sheetName="MTCars")
addDataFrame(x=cars, sheet=cars1)
addDataFrame(x=mtcars, sheet=cars2)
#命名sheet和添加数据可以合并: addDataFrame(x=cars, sheet=createSheet(wb=cars, sheetName="Cars"))
saveWorkbook(cars, "Cars_datasets.xlsx")
```

### 3. 图像输出到文件:

```sh
pdf("filename.pdf")
win.metafile("filename.wmf")
png("filename.png")
jpeg("filename.jpg")
bmp("filename.bmp")
postscript("filename.ps")
tiff("outfile.tif", compression = "lzw",res = 800,pointsize = 2,height=5000,width=5000) #图片大小和分辨率
#输出完后 
dev.off()
```

### 4. 列表/数据框操作:


- 按相同列合并数据:

`merge(list1,list2,by="相同的列名",all=L)`

- 按列/行直接合并数据(要求行/列数相同):

`rbind(); cbind();`

- 排序：
```sh
sort（）是对向量进行从小到大的排序
rank（）返回的是对向量中每个数值对应的秩
order（）返回的值表示位置，依次对应的是向量的最小值、次小值、第三小值......最大值
order(主条件，次条件，-次条件) #负号表示逆序
```

- 去掉NA数据行：

```perl
b<-a[-which(is.na(a))]
```


		
### 5. 矩阵转化为数据框:melt()函数

```sh
library("reshape2");
df1 <- melt(matrix1); #
melt 是溶解/分解的意思， 即拆分数据。 
reshape/reshape2 的 melt 函数是个 S3 通用函数，它会根据数据类型（数据框，数组或列表）
选择 melt.data.frame, melt.array 或 melt.list 函数进行实际操作。 
1. 如果是数组（array）类型，melt 的用法就很简单，它依次对各维度的名称进行组合将 数据进行线性向量化。
   如果数组有 n 维，那么得到的结果共有 n+1 列，前 n 列记录数组的 位置信息，最后一列才是观测值。
2. 如果是列表数据，melt 函数将列表中的数据拉成两列，一列记录列表元素的值，另一列记录列表元素的名称；
   如果列表中的元素是列表，则增加列变量存储元素名称。元素值排列在前，名称在后，越是顶级的列表元素名称越靠后：
3. 如果数据是数据框类型，melt的参数就稍微复杂些： 
> melt(data, id.vars, measure.vars, variable.name = "variable", ..., na.rm = FALSE, value.name = "value") 
其中 id.vars 是被当做维度的列变量，每个变量在结果中占一列；measure.vars 
是被当成观测值的列变量，它们的列变量名称和值分别组成 variable 和 value两列，列变量名称用variable.name 
和 value.name来指定。
```


### 6. 循环中创建不同名字的变量

```sh
用assign() 函数,eg:
for(i in 1:6) { #-- Create objects  'r.1', 'r.2', ... 'r.6' --
	nam <- paste("r", i, sep = ".")
	assign(nam, 1:i)
}
```

### 7. 字符串变成变量名
`get(字符串)`

### 8. 字符串处理

```sh
paste0()=paste(,sep="")
gsub("pattern","替换pattern",字符串,perl=Logical,fixed=Logical)
pattern用()括起来的,在替换pattern中用"\\1-9"来取回:
gsub("([ab])", "\\1_\\1_", "abc and ABC")
若perl=T,则可以使用\\U \\L 强制大小写
```

## R 包安装(Ubuntu)

### tkrplot,Rglpk等包安装

如`tkrplot`和`Rglpk`之类的包,直接从`install.packages()`装总是说缺这个缺那个装不上,可以尝试用 `apt-get`安装:

    sudo apt-get install R-cran-tkrplot
    sudo apt-get install r-cran-rglpk
    ...
    
### 指定镜像源,省得每次都选

默认不加参数的`install.packages()`安装包,会让你选择镜像源,有时候TK/TCL还会出错,弹不出窗口,老烦人了,直接安装包时指定源,就不用再选了:

    install.packages('XXXX',repos='https://mirrors.tuna.tsinghua.edu.cn/CRAN/')

可用源的列表在: [这里](https://cran.r-project.org/mirrors.html)    

## Venn图

```sh
#安装VennDiagram包 
install.packages("VennDiagram")
#载入VennDiagram包
library(VennDiagram)
venn.diagram(list(A=1:10,B=3:8,C=6:9), fill=c("red","green","blue"), alpha=c(0.5,0.5,0.5), cex=2, 
			 cat.fontface=4, fontfamily=3, filename="VennDiagram.tiff")	
#DETAIL(最多画5维)
venn.diagram(x, filename, height = 3000, width = 3000, resolution = 500, imagetype = "tiff", 
			 units = "px", compression = "lzw", na = "stop", main = "", sub = "", 
			 main.pos = c(0.5, 1.05), main.fontface = "plain", main.fontfamily = "serif", 
			 main.col = "black", main.cex = 1, main.just = c(0.5, 1), sub.pos = c(0.5, 1.05), 
			 sub.fontface = "plain", sub.fontfamily = "serif", sub.col = "black", sub.cex = 1, 
			 sub.just = c(0.5, 1), category.names = names(x), force.unique = TRUE, ...);

```
R包画的5维Venn图太丑了,推荐一个网站画的5维venn很好看(最多画5维): [`5维Venn图`](http://bioinformatics.psb.ugent.be/webtools/Venn/)

##  LPmerge做一致性图谱

```sh
1.LPmerge 安装:
a. linux系统下载安装 glpk 软件
#https://launchpad.net/ubuntu/+archive/primary/+files/glpk_4.55.orig.tar.gz
./configure --prefix=/home/gst/LOCAL/app/glpk-4.55 & make & make install
b. 设置环境变量到.bashrc:
export LD_LIBRARY_PATH=/home/gst/LOCAL/app/glpk-4.55/lib
export LIBRARY_PATH=/home/gst/LOCAL/app/glpk-4.55/lib
export CPATH=/home/gst/LOCAL/app/glpk-4.55/include
c. 下载Rglpk包并解压
d.	R CMD INSTALL Rglpk		
library(LPmerge)
具体见LPmerge_tutorial.pdf
```


## ggplot技巧:

### 1. 零散

- 柱状图可能某个柱条为空，去掉空的柱条：加上 factor:

```sh
>ggplot(data,aes(x = factor(myX), y = myY))
```

- 把 ggplot 对象以图片形式保存到本地：

```sh
> p = ggplot(···) + ···
> ggsave("picture1.png", path = "C:/workspace", width = 10, height = 6, dpi = 300)
```

- 如何将 ggplot2 中的图片标题放在下方（默认在图片正上方）：

```sh
theme(title = element_text(vjust = -50))   ## 好像没有调相对坐标的参数，只能用绝对坐标来调了
```

- 全白主题：

```perl
theme(panel.background = element_rect(fill = "transparent", color = "gray"), 
		legend.key = element_rect(fill = "transparent", color = "transparent")) 
```


### 2. 一页多图:
#### 方法1:

```sh
library(ggplot2)
library(grid)
a <- qplot(1)							#画图a
b <- qplot(2,2,geom="point")			#画图b
grid.newpage()							#新建一个空白页
pushViewport(viewport(layout = grid.layout(nrow = 1, ncol = 2))) #设置好页面布局，1 行 2 列
print(a, vp = viewport(layout.pos.row = 1, layout.pos.col = 1)) #将 a 图放在第 1 行第 1 列
print(b, vp = viewport(layout.pos.row = 1, layout.pos.col = 2)) #将 b 图放在第 1 行第 2 列
```

#### 方法2:

```sh
library(gridExtra)
a <- qplot(TMPRSS4, ECADHERIN, data=spear)
b <- qplot(TMPRSS4, ECADHERIN, data=spear, geom="jitter")
grid.arrange(a,b,ncol=2)
```

自定义布局:

用矩阵:

```sh
gs <- lapply(1:8, function(ii) grobTree(rectGrob(gp=gpar(fill=ii, alpha=0.5)), textGrob(ii)))
lay <- rbind(c(1,1,1,2,3),	 
c(1,1,1,4,5),
c(6,7,8,NA,NA))
grid.arrange(grobs = gs, layout_matrix = lay)
#可以用NA关闭某块,但布局数应和图像数相同
```

####  方法3_分面

#####  缠绕分面
```sh
facet_wrap(facets, nrow = NULL, ncol = NULL, scales = "fixed", shrink = TRUE, as.table = TRUE,
			switch=NULL, drop = TRUE)
#facets：分面参数如 ~cut，表示用 cut 变量进行数据分类,~cut+drv 多变量分面
#nrow：绘制图形的行数
#ncol：绘制图形的列数，一般nrow/ncol只设定一个即可
#scales：坐标刻度的范围，可以设定四种类型。fixed 表示所有小图均使用统一坐标范围；
#        free表示每个小图按照各自数据范围自由调整坐标刻度范围；
#		 free_x为自由调整x轴刻度范围；free_y为自由调整y轴刻度范围。
#shrinks：也和坐标轴刻度有关，如果为TRUE（默认值）则按统计后的数据调整刻度范围，
#		  否则按统计前的数据设定坐标。
#as.table：和小图排列顺序有关的选项。如果为TRUE（默认）则按表格方式排列，
#			即最大值（指分组level值）排在表格最后即右下角，否则排在左上角。
#swith: 标签位置，默认“null”位于上方，“x”X轴下方，“y”y轴左侧，
#drop：是否丢弃没有数据的分组，如果为TRUE（默认），则空数据组不绘图。
```

###### 格网分面:

应用多个标准对数据进行分组

```sh
facet_grid(facets, margins = FALSE, scales = "fixed", space = "fixed", shrink = TRUE, 
		   labeller = "label_value", as.table = TRUE, drop = TRUE) 
#facets: <分行变量>~<分列变量>
#和facet_wrap比较，除不用设置ncol和nrow外（facets公式已经包含）外还有几个参数不同：
#margins：这不是设定图形边界的参数。它是指用于分面的包含每个变量元素所有数据的数据组。	
#space:	这个参数要配合scales使用，如果为fixed（默认），所有小图的大小都一样，
#		如果为free/free_x/free_y，小图的大小将按照坐标轴的跨度比例进行设置。
#labeller:	这是设定小图标签的，facet_grid的函数说明档讲得比较明白，参考之

```

### 3. 坐标相关


```sh
#坐标轴显示范围:
scale_x_continuous(limits = c(-5,15))   ## 方法一
xlim(-5,15)   ## 方法二
xlim(min(dt$A, 0)*1.2, max(dt$A)*1.2)   ## 使用倍数来限定大小，注意定义最小值的方式

#坐标轴的标签
p + xlab("这是 X 轴") + ylab("这是 Y 轴") + ggtitle("这是标题")   ## 修改文字方法一
p + labs(x = "这是 X 轴", y = "这是 Y 轴", title = "这是标题")   ## 修改文字方法二

# 修改 X 轴标签的大小、字体、颜色、加粗、位置、角度 ####
p + xlab("这是 X 轴") + theme(axis.title.x = element_text(size = 15, family = "myFont", color = "green", 
	face = "bold", vjust = 0.5, hjust = 0.5, angle = 45))	
## face取值：plain普通，bold加粗，italic斜体，bold.italic斜体加粗	

#修改坐标轴的刻度标签（内容）
scale_y_continuous(limits=,breaks=,labels =)

```

## 进化相关
### 1. ape 进化树
 读入:

```sh
read.tree("file")
```

	
### 2. ggtree 进化树

安装:

```sh
source("http://bioconductor.org/biocLite.R")
biocLite("ggtree")
```

依赖"EBImage"包,但是EBImage包需要tiff和fftw的支持:

linux无root编译tiff:

下载[tiff](ftp://ftp.remotesensing.org/libtiff/tiff-4.0.6.tar.gz).解压后: 

```sh
./configure --prefix=/自己的目录
make -j8 && make install
然后在.bashrc中加入以下环境变量:
178 export PATH=/home/gst/LOCAL/app/tiff-4.0.4/bin:$PATH
179 export LD_LIBRARY_PATH=/home/gst/LOCAL/app/tiff-4.0.4/lib:$LD_LIBRARY_PATH
180 export LIBRARY_PATH=/home/gst/LOCAL/app/tiff-4.0.4/lib:$LIBRARY_PATH
181 export CPATH=/home/gst/LOCAL/app/tiff-4.0.4/include:$CPATH
```

linux下无root编译fftw:
下载[fftw](ftp://ftp.fftw.org/pub/fftw/fftw-3.3.5.tar.gz),解压:

```sh
./configure --prefix /自己目录  --enable-shared #加上参数 --enable-shared，才会生成动态链接库
make -j8 && make install
然后在 .bashrc中加入以下环境变量(我也不知道哪个管用 乱试 居然成功了!fk!):
184 export LD_LIBRARY_PATH=/home/gst/LOCAL/app/fftw/lib:$LD_LIBRARY_PATH
185 export LIBRARY_PATH=/home/gst/LOCAL/app/fftw/lib:$LIBRARY_PATH
186 export CPATH=/home/gst/LOCAL/app/fftw/include:$CPATH
187 export FFTW_LIBS=/home/gst/LOCAL/app/fftw/lib
188 export FFTW_CFLAGS=/home/gst/LOCAL/app/fftw/include
189 export CPPFLAGS=/home/gst/LOCAL/app/fftw/include
190 export PKG_CONFIG_PATH=/home/gst/LOCAL/app/fftw/lib
然后进R,biocLite安装ggtree成功!
```

## MareyMap分析重组值

在服务器上无法安装MareyMap包,因为无法安装tkrplot包,开始以为是tk/tcl的问题,下载安装Activetcl,
并将头文件目录加入环境变量:

`export C_INCLUDE_PATH=/home/gst/LOCAL/app/ActiveTcl/include`

之后仍然一直报错:`Tcl/Tk support is not available on this system`

网上说自行编译R,在编译时要指定支持tk/tcl,重新编译:

```sh
./configure --with-tcltk --prefix=/home/gst/R-revised \
--with-tcl-config=/home/gst/LOCAL/app/ActiveTcl/lib/tclConfig.sh \
--with-tk-config=/home/gst/LOCAL/app/ActiveTcl/lib/tkConfig.sh 

make -j8 & make install
```

还是报错,于是放弃!!!

在自己电脑上安装成功.

2016年6月2日

由于之前把ActiveTcl的lib和include都放在了自己的主目录下,并设置了环境变量:

```sh
export LIBRARY_PATH=/home/gst/LOCAL/lib
export CPLUS_INCLUDE_PATH=/home/gst/LOCAL/include
export C_INCLUDE_PATH=/home/gst/LOCAL/include
```

重新编译安装R,指定支持tk/tcl:	

```sh
./configure --with-tcltk --prefix=/home/zhuawu/GuiSongtao/software/R-revised \
--with-tcl-config=/home/zhuawu/GuiSongtao/software/ActiveTcl/lib/tclConfig.sh \
--with-tk-config=/home/zhuawu/GuiSongtao/software/ActiveTcl/lib/tkConfig.sh 
#in zzx:
./configure --with-tcltk --prefix=/lustre/home/jiangff/software/app/R \
--with-tcl-config=/lustre/home/jiangff/software/app/ActiveTcl/lib/tclConfig.sh \
--with-tk-config=/lustre/home/jiangff/software/app/ActiveTcl/lib/tkConfig.sh
make -j8 & make install
测试是否正确支持tk/tcl:
R> capabilities()["tcltk"]
tcltk 
TRUE 
成功!!!!!!
install.packages("MareyMap")
成功!!!!!
```

## 颜色相关


```sh
scales包中的alpha函数可以自定义透明度,返回HEX代码的颜色:
library(scales)
alpha("red",0.5) 

```

## 绘图参数 par

par()函数是R里有关绘图的重要函数之一，以下是对par()函数说明内容的一些整理。

描述：

par函数用于设定或询问绘图参数。参数设定可通过par(参数名 = 取值)或par(赋值参数列表)的形式进行。

用法：

`par(..., no.readonly = FALSE)`

函数变量：

... “参数名 = 取值”或“赋值参数列表”形式的变量。

no.readonly 逻辑变量。如= TRUE且没有其他变量， 则返回当前绘图设备下已设定好的绘图参数。

参数：

参数分为三类：

1. 仅仅用于询问不能被设定的参数：cin，cra，csi，cxy，dim。
2. 仅能通过par()设定参数：ask，fig，fin，lheight，mai，mar，mex，mfcol，mfrow，mfg，new，oma，omd，
						  omi，pin，plt，ps，pty，usr，xlog，ylog。
3. 除了par()，也能在其他高级绘图函数中设定的参数。

应用中，涉及这三类参数最多的是第 3 类，最少的是第 1 类。

查看当前参数的赋值用`par("参数名")`

#### 第 3 类参数：

```sh
adj 
调整函数text，mtext，title里文本串的位置。
	= 0：文本串左对齐；
	= 0.5（缺省）：文本串 居中；
	= 1：文本串右对齐。
ann 
= FALSE：不进行绘图解释标记（例如横轴标题等）。
bg 
设置绘图区背景色。缺省为bg = "transparent"。
bty 
设置绘图边框的形式。        = "o"（缺省）：四周边框；
							= "l"：左下边框；
							= "7"：右上边框；
							= "c"：上左 下边框；
						    = "u"：左下右边框；
						    = "]"：上右下边框；
						    = "n"；无边框。
cex 
设置文本和符合的尺度。缺省为cex = 1。
cex.axis 
相对于当前的cex设置，放大坐标标记（坐标轴标记的数字）。缺省为cex.axis = 1。
cex.lab 
相对于当前的cex设置，放大坐标轴标题。缺省为cex.lab = 1。
cex.main 
相对于当前的cex设置，放大图标题。缺省为cex.main = 1。
cex.sub 
相对于当前的cex设置，放大图副标题。缺省为cex.sub = 1。
col 
设置绘图颜色。缺省为col = "black"。
col.axis 
设置坐标标记颜色。缺省为col.axis = "black"。
col.lab 
设置坐标轴标题颜色。缺省为col.lab = "black"。
col.main 
设置图标题颜色。缺省为col.main = "black"。
col.sub 
设置图副标题颜色。缺省为col.sub = "black"。
crt 
缺省为crt = 0。
err 
期望的错误报告程度（像该参数目前在R中未生效）。缺省为err = 0。
family 
设置文本字体字体族。缺省为family = ""。
fg 
设置前景色，主要用于坐标轴，边框，图形等，对坐标标记与坐标轴标题等外围无影响。缺省 为fg = "black"。
font 
设置文本字体。= 1（缺省）：普通字体；= 2：粗体；= 3：斜体；= 4：粗斜体；...。
font.axis 
设置坐标标记字体。
font.lab 
设置坐标轴标题字体。
font.main 
设置图标题字体。
font.sub 
设置图副标题字体。
lab 
设置坐标轴刻度数，lab = c(x,y,len)形式，目前len的设置在R中未生效。缺省为lab = c(5,5,7)。
las 
设置坐标标记显示方向。
	= 0（缺省）：平行于坐标轴；
	= 1：平行于x轴；
	= 2：垂直于坐标 轴；
	= 3：平行于y轴。
lend 
设置线结束端的形状（只有把线画很粗才能看出来）。
	= 0（缺省）：圆形；
	= 1：“短”方 形；
	= 2：“长”方形。
ljoin 
设置线交接处的性质（只有把线画很粗才能看出来）。
	= 0（缺省）：圆角；
	= 1：方角；
	= 2：切方角顶角。
lmitre 
设置ljoin里方角向切方角顶角过渡的程度。缺省为lmitre = 10。
lty 
设置线的类型。
	= 0：空白；
	= 1：（缺省）实线；
	= 2：短线虚线；
	= 3：点虚线；
	= 4：短线点 虚线；
	= 5：长线虚线；
	= 6：长短线虚线。
lwd 
设置线宽。缺省为lwd = 1。
mgp 
设置坐标轴标题，坐标标记和坐标轴边界宽度。
	mgp[1]影响坐标轴标题，
	mgp[2,3]影响坐标标记和坐标轴。
	缺省为mgp = c(3,1,0)。
pch 
设置点的类型。缺省为pch = 1。
srt 
逆时针选择字符串，单位为°，只用于text函数。缺省srt = 0。
tck 
设置坐标刻度线长与方向（与图宽和高的较小者成比例）。缺省为tck = "NA"。
tcl 
设置坐标刻度线长与方向（与文本行高成比例）。缺省为tcl = -0.5。
xaxs,yaxs 
设置坐标轴的范围。
	= "r"（缺省）：先将数据范围向双边扩大4%，然后绘图；
	= "i"：在原始 数据范围内绘图。
xaxt,yaxt 
设置坐标轴样式。
	= "s"（缺省）：标准样式；
	= "n"：不绘坐标轴。
```

#### 第 2 类函数：

```sh
ask 
= TRUE：在新图绘制前进行提示。
fig 
	设定图在绘图设备中的位置，fig = c(x1,x2,y1,y2)的数值向量（0<=x1<x2<=1； 0<=y1<y2<=1）。
	缺省为fig = c(0,1,0,1)。（注：设定即开始新的绘图）
fin 
设定绘图区的宽和高。缺省为fin = c(6.999999,6.999999)。（注：设定即开始新的绘图）
lheight 
设置文本行高。缺省为lheight = 1。
mai 
设置图形空白边界，mai =c(bottom, left, top, right)，单位为英寸。缺省 为mai = c(1.02,0.82,0.82,0.42)。
mar 
设置图形空白边界行数，mar = c(bottom, left, top, right)。缺省为mar = c(5.1,4.1,4.1,2.1)。
mex 
设置图形空白边界尺度。缺省为mex = 1。
mfcol,mfrow 
	设置小图数量与位置，取值为数值型向量c(nr, nc)形式，
	表示把图分为nr行nc列个小图，图形顺序按列排（mfcol）或按行排（mfrow）。
mfg 
	设置工作小图，mfg = c(i,j)，表示把第i行第j列的小图设为当前工作小图。
	（需在mfcol 或mfrow使用后才能使用该参数）
new 
= TRUE：下一高水平绘图指令不会清楚已绘的图，而是在原有图基础上继续绘新图。
oma 
设定图形的外边界大小，oma = c(bottom,left,to,right)，单位为文本行数。缺省为oma = c(0,0,0,0)
omd 
设定图形外边界内部占图形设备的比例，omd = c(x1,x2,y1,y2)。缺省为omd = c(0,1,0,1)。
omi 
设定图形的外边界大小，omi = c(bottom,left,to,right)，单位为英寸。缺省为oma = c(0,0,0,0)
pin 
设定当前图的长宽，pin = c(width,height)。
plt 
设定绘图区(plot region)占图形区(figure region)的比例，plt=c(x1,x2,y1,y2)。
ps 
设置文本点的大小。缺省为ps = 12。
pty 
设置作图类型。
	= “m”（缺省）：最大化作图；
	= "s"：方形图。
usr 
	设置图的坐标范围，usr = c(x1,x2,y1,y2)，即横坐标在x1到x2之间，纵坐标在y1到y2之间。
	若xlog或ylog参数为TRUE，则usr设置的点按10^c(x1,x2,y1,y2)使用。
xlog 
= TRUE：横坐标取对数。
ylog 
= TRUE：纵坐标取对数
```

## R基础绘图 plot

详见`D:\Works\BOOKS\LANGUAGE\R\R 语言资料大全\R-导论中文版.pdf`

