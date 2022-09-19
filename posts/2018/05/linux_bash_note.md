+++
title = "linux_bash_note"
showall = true
summary = """
  My note on linux shell commands, mainly bash
  """

# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasnutshell = false
hasplotly = false
hasmermaid = false

pubdate = Date("2018-05-05")
tags = ["linux", "bash"]
+++
{{page_tags}}


## 1. ST.G_NOTE
###  1.1 反向删除
    rm -f `ls|grep -v "files_U_want_to_keep"` 
    #注意rm -f 后是反引号！（数字1左边的号）
### 1.2 wget 

>wget -c -r -np -nd -k -L -p www.xxx.org/pub/path/

```bash
在下载时。有用到外部域名的图片或连接。如果需要同时下载就要用-H参数。

    wget -np -nH -r --span-hosts www.xxx.org/pub/path/

-c 断点续传

-r 递归下载，下载指定网页某一目录下（包括子目录）的所有文件

-nd 递归下载时不创建一层一层的目录，把所有的文件下载到当前目录

-np 递归下载时不搜索上层目录，如wget -c -r www.xxx.org/pub/path/
没有加参数-np，就会同时下载path的上一级目录pub下的其它文件

-k 将绝对链接转为相对链接，下载整个站点后脱机浏览网页，最好加上这个参数

-L 递归时不进入其它主机，如wget -c -r www.xxx.org/ 
如果网站内有一个这样的链接：www.yyy.org，不加参数-L，就会像大火烧山一样，会递归下载www.yyy.org网站

-p 下载网页所需的所有文件，如图片等

-A 指定要下载的文件样式列表，多个样式用逗号分隔

-i 后面跟一个文件，文件内指明要下载的URL

还有其他的用法，我从网上搜索的，也一并写上来，方便以后自己使用。

__wget的常见用法__

wget的使用格式

    Usage: wget [OPTION]… [URL]…

用wget做站点镜像:

    wget -r -p -np -k http://dsec.pku.edu.cn/~usr_name/

或者

    wget -m http://www.tldp.org/LDP/abs/html/

在不稳定的网络上下载一个部分下载的文件，以及在空闲时段下载

    wget -t 0 -w 31 -c http://dsec.pku.edu.cn/BBC.avi -o down.log &

或者从filelist读入要下载的文件列表

    wget -t 0 -w 31 -c -B ftp://dsec.pku.edu.cn/linuxsoft -i filelist.txt -o down.log &

上面的代码还可以用来在网络比较空闲的时段进行下载。我的用法是:在mozilla中将不方便当时下载的URL链接拷贝到内存中然后粘贴到文件filelist.txt中，在晚上要出去系统前执行上面代码的第二条。

使用代理下载
    
    wget -Y on -p -k https://sourceforge.net/projects/wvware/

代理可以在环境变量或wgetrc文件中设定

在环境变量中设定代理
    export PROXY=http://211.90.168.94:8080/
在~/.wgetrc中设定代理

    http_proxy = http://proxy.yoyodyne.com:18023/
    ftp_proxy = http://proxy.yoyodyne.com:18023/
```

wget各种选项分类列表

* 启动
```shell
-V, –version #显示wget的版本后退出
-h, –help #打印语法帮助
-b, –background #启动后转入后台执行
-e, –execute=COMMAND 
#执行`.wgetrc'格式的命令，wgetrc格式参见/etc/wgetrc或~/.wgetrc
```

* 记录和输入文件
```shell
-o, –output-file=FILE #把记录写到FILE文件中
-a, –append-output=FILE #把记录追加到FILE文件中
-d, –debug #打印调试输出
-q, –quiet #安静模式(没有输出)
-v, –verbose #冗长模式(这是缺省设置)
-nv, –non-verbose #关掉冗长模式，但不是安静模式
-i, –input-file=FILE #下载在FILE文件中出现的URLs
-F, –force-html #把输入文件当作HTML格式文件对待
-B, –base=URL #将URL作为在-F -i参数指定的文件中出现的相对链接的前缀
–sslcertfile=FILE #可选客户端证书
–sslcertkey=KEYFILE #可选客户端证书的KEYFILE
–egd-file=FILE #指定EGD socket的文件名
```

* 下载
```shell
    –bind-address=ADDRESS 
    #指定本地使用地址(主机名或IP，当本地有多个IP或名字时使用)
    -t, –tries=NUMBER #设定最大尝试链接次数(0 表示无限制).
    -O –output-document=FILE #把文档写到FILE文件中
    -nc, –no-clobber #不要覆盖存在的文件或使用.#前缀
    -c, –continue #接着下载没下载完的文件
    –progress=TYPE #设定进程条标记
    -N, –timestamping #不要重新下载文件除非比本地文件新
    -S, –server-response #打印服务器的回应
    –spider #不下载任何东西
    -T, –timeout=SECONDS #设定响应超时的秒数
    -w, –wait=SECONDS #两次尝试之间间隔SECONDS秒
    –waitretry=SECONDS #在重新链接之间等待1…SECONDS秒
    –random-wait #在下载之间等待0…2*WAIT秒
    -Y, –proxy=on/off #打开或关闭代理
    -Q, –quota=NUMBER #设置下载的容量限制
    –limit-rate=RATE #限定下载输率
```
* 目录
```shell
-nd –no-directories #不创建目录
-x, –force-directories #强制创建目录
-nH, –no-host-directories #不创建主机目录
-P, –directory-prefix=PREFIX #将文件保存到目录 PREFIX/…
–cut-dirs=NUMBER #忽略 NUMBER层远程目录
```

* HTTP 选项
```shell
–http-user=USER #设定HTTP用户名为 USER.
–http-passwd=PASS #设定http密码为 PASS.
-C, –cache=on/off #允许/不允许服务器端的数据缓存 (一般情况下允许).
-E, –html-extension # 将所有text/html文档以.html扩展名保存
–ignore-length #忽略 `Content-Length'头域
–header=STRING #在headers中插入字符串 STRING
–proxy-user=USER #设定代理的用户名为 USER
–proxy-passwd=PASS #设定代理的密码为 PASS
–referer=URL #在HTTP请求中包含 `Referer: URL'头
-s, –save-headers #保存HTTP头到文件
-U, –user-agent=AGENT #设定代理的名称为 AGENT而不是 Wget/VERSION.
–no-http-keep-alive #关闭 HTTP活动链接 (永远链接).
–cookies=off #不使用 cookies.
–load-cookies=FILE #在开始会话前从文件 FILE中加载cookie
–save-cookies=FILE #在会话结束后将 cookies保存到 FILE文件中
```

* FTP 选项
```shell
-nr, –dont-remove-listing #不移走 `.listing'文件
-g, –glob=on/off #打开或关闭文件名的 globbing机制
–passive-ftp #使用被动传输模式 (缺省值).
–active-ftp #使用主动传输模式
–retr-symlinks # 在递归的时候，将链接指向文件(而不是目录)
```

* 递归下载
```shell
-r, –recursive #递归下载－－慎用!
-l, –level=NUMBER #最大递归深度 (inf 或 0 代表无穷).
–delete-after #在现在完毕后局部删除文件
-k, –convert-links #转换非相对链接为相对链接
-K, –backup-converted #在转换文件X之前，将之备份为 X.orig
-m, –mirror #等价于 -r -N -l inf -nr.
-p, –page-requisites #下载显示HTML文件的所有图片
```
* 递归下载中的包含和不包含(accept/reject)
```shell
-A, –accept=LIST #分号分隔的被接受扩展名的列表
-R, –reject=LIST #分号分隔的不被接受的扩展名的列表
-D, –domains=LIST #分号分隔的被接受域的列表
–exclude-domains=LIST #分号分隔的不被接受的域的列表
–follow-ftp #跟踪HTML文档中的FTP链接
–follow-tags=LIST #分号分隔的被跟踪的HTML标签的列表
-G, –ignore-tags=LIST #分号分隔的被忽略的HTML标签的列表
-H, –span-hosts #当递归时转到外部主机
-L, –relative #仅仅跟踪相对链接
-I, –include-directories=LIST #允许目录的列表
-X, –exclude-directories=LIST #不被包含目录的列表
-np, –no-parent #不要追溯到父目录
```

###  1.3 sub/gsub in awk

sub函数只实现第一个位置的替换，gsub函数实现全局的替换

1. sub函数
```shell
echo "a b c 2011-11-22 a:d" | awk 'sub(/-/,"",$4)'
#a b c 201111-22 a:d
```

2. gsub函数
```shell 
echo "a b c 2011-11-22 a:d" | awk 'gsub(/-/,"",$4)'
#a b c 20111122 a:d
```

   
###  1.4 rename
>C语言版  rename 'patternA' 'patternB' [dir/XXX*]

>perl版   rename 's///' [dir/XXX]

###  1.5 XXX.cc : "XXX" was not declared in this scope 
    XXX.cc : "某函数" was not declared in this scope 
    ...
    Error1
可能是该.cc文件没有包含 `#include <unistd.h\>`   
将这行加入重新编译即可。

`#include <unistd.h\>`是POSIX标准定义的unix类系统定义符号常量的头文件，包含了许多UNIX系统服务的函数原型，例如read函数、write函数和getpid函数。

###  1.6 grep

```bash
    grep -A [num] pattern file # 提取匹配行的同时，输出该匹配行的后（After）指定数目行
    grep -B [num] pattern file # 提取匹配行的同时，输出该匹配行的前（before）指定数目行
    grep -C [num] pattern file # 提取匹配行的同时，输出该匹配行的前和后指定数目的行
    # -i 参数忽略大小写
    # -c：只输出匹配行的计数
    # -v 输出不匹配的行
    # -l 输出含有匹配行的文件名列表
    # -L 输出不含有匹配行的文件名列表
    # -m [num] 匹配到指定行数有不再进行匹配
    # -o 只输出匹配到模式的字符串
    # -n 输出匹配行的行号
    # -r 递归式grep文件夹下所有文件和文件夹中的文件
    grep -f pattern_file file  # 非常强大的-f,,,输出匹配到pattern文件某一个pattern的行(pattern_file中一行一个pattern)
        #pattern file中一定不要有空行,不然全输出.
```

### 1.7 sort

sort语法

```
sort [-fbMnrtuk] [file or stdin]
选项与参数：
-f  ：忽略大小写的差异，例如 A 与 a 视为编码相同；
-b  ：忽略最前面的空格符部分；
-M  ：以月份的名字来排序，例如 JAN, DEC 等等的排序方法；
-n  ：使用『纯数字』进行排序(默认是以文字型态来排序的)；
-r  ：反向排序；
-u  ：就是 uniq ，相同的数据中，仅出现一行代表；
-t  ：分隔符，默认是用 [tab] 键来分隔；
-k  ：以那个区间 (field) 来进行排序的意思
```

### 1.8 uniq

```
uniq [-cdu][-f<栏位>][-s<字符位置>][-w<字符位置>][--help][--version][输入文件][输出文件]
参　　数：
-c: 在每列旁边显示该行重复出现的次数。
    -d: 仅显示重复出现的行列。
    -f: 忽略比较指定的栏位。
    -s: 忽略比较指定的字符。
    -u: 仅显示出一次的行列。
    -w: 指定要比较的字符。
    -n：前n个字段和每个字段前的空白一起被忽略
    +n：前n个字符被忽略 
```

### 1.9 screen


>screen [-AmRvx -ls -wipe][-d <作业名称>][-h <行数>][-r <作业名称>][-s ][-S <作业名称>]

参数说明

```bash
    -A 　将所有的视窗都调整为目前终端机的大小。
    -d <作业名称> 　将指定的screen作业离线。
    -h <行数> 　指定视窗的缓冲区行数。
    -m 　即使目前已在作业中的screen作业，仍强制建立新的screen作业。
    -r <作业名称> 　恢复离线的screen作业。
    -R 　先试图恢复离线的作业。若找不到离线的作业，即建立新的screen作业。
    -s 　指定建立新视窗时，所要执行的shell。
    -S <作业名称> 　指定screen作业的名称。
    -v 　显示版本信息。
    -x 　恢复之前离线的screen作业。
    -ls或--list 　显示目前所有的screen作业。
    -wipe 　检查目前所有的screen作业，并删除已经无法使用的screen作业。
```

常用screen参数

```bash
    screen -S yourname # 新建一个叫yourname的session
    screen -ls # 列出当前所有的session
    screen -r yourname # 回到yourname这个session
    screen -d yourname # 远程detach某个session
    screen -d -r yourname # 结束当前session并回到yourname这个session
```

在每个screen session 下，所有命令都以 ctrl+a(C-a) 开始。

```bash
    C-a ? #显示所有键绑定信息
    C-a c #创建一个新的运行shell的窗口并切换到该窗口
    C-a n # Next，切换到下一个 window 
    C-a p # Previous，切换到前一个 window 
    C-a 0..9 # 切换到第 0..9 个 window
    C+a [Space] # 由视窗0循序切换到视窗9
    C-a C-a # 在两个最近使用的 window 间切换 
    C-a x # 锁住当前的 window，需用用户密码解锁
    C-a d # detach，暂时离开当前session，将目前的 screen session (可能含有多个 windows)丢到后台执行，并会回到还没进 screen 时的状态，此时在 screen session 里，每个 window内运行的 process (无论是前台/后台)都在继续执行，即使 logout 也不影响。 
    C-a z # 把当前session放到后台执行，用 shell 的 fg 命令则可回去。
    C-a w # 显示所有窗口列表
    C-a t # Time，显示当前时间，和系统的 load 
    C-a k # kill window，强行关闭当前的 window
    C-a [ # 进入 copy mode，在 copy mode 下可以回滚、搜索、复制就像用使用 vi 一样
        C-b Backward，PageUp 
        C-f Forward，PageDown 
        H(大写) High，将光标移至左上角 
        L Low，将光标移至左下角 
        0 移到行首 
        $ 行末 
        w forward one word，以字为单位往前移 
        b backward one word，以字为单位往后移 
        Space 第一次按为标记区起点，第二次按为终点 
        Esc 结束 copy mode 
    C-a ] # Paste，把刚刚在 copy mode 选定的内容贴上
```

#### 关闭所有screen窗口：
    killall screen

### 1.10 gcc编译时include和lib的路径

```shell
头文件：#include “headfile.h”
搜索顺序为：
先搜索当前目录
然后搜索-I指定的目录
再搜索gcc的环境变量CPLUS_INCLUDE_PATH #C程序使用的是C_INCLUDE_PATH
最后搜索gcc的内定目录
/usr/include
/usr/local/include
/usr/lib/gcc/x86_64-redhat-linux/4.1.1/include
库文件：
编译的时候：
gcc会去找-L
再找gcc的环境变量LIBRARY_PATH
再找内定目录 /lib /usr/lib /usr/local/lib 
这是当初compile gcc时写在程序内的（不可配置的？）  
```

### 1.11 批量转换测序文件(只有序列信息)为fasta格式文件:

    for i in *.seq ; do echo -e ">"$i"\n"`cat $i` >$i.fasta;done

### 1.12 echo参数

```
    功能说明：显示文字。
    语 　 法：echo [-ne][字符串]或 echo [--help][--version]
    补充说明：echo会将输入的字符串送往标准输出。输出的字符串间以空白字符隔开, 并在最后加上换行号。
    参　　 数：-n 不要在最后自动换行
    -e 若字符串中出现以下字符，则特别加以处理，而不会将它当成一般
    文字输出：
       \a 发出警告声；
       \b 删除前一个字符；
       \c 最后不加上换行符号；
       \f 换行但光标仍旧停留在原来的位置；
       \n 换行且光标移至行首；
       \r 光标移至行首，但不换行；
       \t 插入tab；
       \v 与\f相同；
       \\ 插入\字符；
       \nnn 插入nnn（八进制）所代表的ASCII字符；
    –help 显示帮助
    –version 显示版本信息 
```


### 1.13 BOM(Byte Order Mark)的筛选和删除

`<feff>`--->`BOM`
```
#查找含有BOM的文件,并删除位于开头的BOM:
grep -I -r -l $'\xEF\xBB\xBF' * | xargs sed -i 's/^\xEF\xBB\xBF//;'
# -I : 不搜索二进制文件
# -r : 递归搜索 
# -l : 只输出匹配的文件名路径


#查找含有BOM的文件,并删除所有的BOM:
grep -I -r -l $'\xEF\xBB\xBF' * | xargs sed -i 's/\xEF\xBB\xBF//g;'
```
### 1.14 linux 重定向

#### 重定向符号


```
>               输出重定向到一个文件或设备 覆盖原来的文件
>!              输出重定向到一个文件或设备 强制覆盖原来的文件
>>             输出重定向到一个文件或设备 追加原来的文件
<               输入重定向到一个程序 
```

####  标准错误重定向符号


```
2>             将一个标准错误输出重定向到一个文件或设备 覆盖原来的文件  b-shell
2>>           将一个标准错误输出重定向到一个文件或设备 追加到原来的文件
2>&1         将一个标准错误输出重定向到标准输出 注释:1 可能就是代表 标准输出
>&             将一个标准错误输出重定向到一个文件或设备 覆盖原来的文件  c-shell
|&              将一个标准错误 管道 输送 到另一个命令作为输入
```

#### 命令重导向示例


```
在 bash 命令执行的过程中，主要有三种输出入的状况，分别是：
1. 标准输入；代码为 0 ；或称为 stdin ；使用的方式为 <
2. 标准输出：代码为 1 ；或称为 stdout；使用的方式为 1>
3. 错误输出：代码为 2 ；或称为 stderr；使用的方式为 2>
```

```
[test @test test]# ls -al > list.txt    #将显示的结果输出到 list.txt 文件中，若该文件已存在则予以取代！
[test @test test]# ls -al >> list.txt   #将显示的结果累加到 list.txt 文件中，该文件为累加的，旧数据保留！
[test @test test]# ls -al  1> list.txt   2> list.err    #将显示的数据，正确的输出到 list.txt 错误的数据输出到 list.err
[test @test test]# ls -al 1> list.txt 2> &1 #将显示的数据，不论正确或错误均输出到 list.txt 当中！错误与正确文件输出到同一个文件中，则必须以上面的方法来写！不能写成其它格式！
[test @test test]# ls -al 1> list.txt 2> /dev/null  #将显示的数据，正确的输出到 list.txt 错误的数据则予以丢弃！ /dev/null ，可以说成是黑洞装置。为空，即不保存。

```
#### 为何要使用命令输出重导向

- 当屏幕输出的信息很重要，而且我们需要将他存下来的时候；
- 背景执行中的程序，不希望他干扰屏幕正常的输出结果时；
- 一些系统的例行命令（例如写在 /etc/crontab 中的文件）的执行结果，希望他可以存下来时；
- 一些执行命令，我们已经知道他可能的错误讯息，所以想以『 2> /dev/null 』将他丢掉时；
- 错误讯息与正确讯息需要分别输出时。

### 1.15 linux路径处理 之 basename

```
> basename --help                                                                                                               [ 3:10下午]
Usage: basename NAME [SUFFIX]
  or:  basename OPTION... NAME...
Print NAME with any leading directory components removed.
If specified, also remove a trailing SUFFIX.

Mandatory arguments to long options are mandatory for short options too.
  -a, --multiple       support multiple arguments and treat each as a NAME
  -s, --suffix=SUFFIX  remove a trailing SUFFIX
  -z, --zero           separate output with NUL rather than newline
      --help     display this help and exit
      --version  output version information and exit

Examples:
  basename /usr/bin/sort          -> "sort"
  basename include/stdio.h .h     -> "stdio"
  basename -s .h include/stdio.h  -> "stdio"
  basename -a any/str1 any/str2   -> "str1" followed by "str2"

```
## 2. 文件操作

### 2.1 查看

```shell
more file.txt # 分页查看文件
less -S file.txt # 不换行查看文件
cat file.txt # 从前向后查看文件
tac file.txt # 从后向前查看文件
```

### 2.2 查找终止进程

```shell
ps -ef|grep <XXX>
pgrep <XXX> 直接输出pid
kill -s 9 <pid> 强制终止进程 等于pkill -9
```

### 2.3 创建

```shell
touch file 
# 如果文件存在，则是更新文件修改的时间戳；如果文件不存在，则创建空文件
vim file # 用vim创建文件
```

### 2.4 属性

```shell
ls -ltr # 按时间倒序列出所有目录和文件
pwd # 当前路径
ls --color=tty # 当前文件列表,后面参数用于显色
ls -a # 显示所有文件,包括隐藏文件
dir --color=always # 当前文件列表,后面参数用于显色
```

### 2.5 拷贝/移动

```shell
cp 源文件 目标文件 # 拷贝文件
cp -r 源路径 目标路径 # 递归拷贝文件
cp -r -l 源路径 目标路径 # 递归创建文件硬链接，相当于备份
mv 源文件 目标文件 # 移动文件
mv 源路径 目标路径 # 移动文件夹
```

### 2.6 dos|unix

```shell
dos2unix # windows文本转linux文本
unix2dos # linux文本转windows文本
cat m.pl | tr -d '\r' > n.pl # 将windows格式的脚本转换成Linux格式
```

### 2.7 md5sum校验

```shell
md5sum in.fastq.gz # 计算文件的md5值
-b #以二进制模式读入文件内容
-t #以文本模式读入文件内容
-c #根据已生成的md5值，对现存文件进行校验
--status 
#校验完成后，不生成错误或正确的提示信息，可以通过命令的返回值来判断。
sha1sum in.fastq.gz # 计算文件的SHA值
```

### 2.8 链接

```shell
ln 源文件 [目标文件] # 创建硬链接，如果不指定目标文件，则目标路径默认为当前路径
ln -s 源文件 [目标文件] # 创建软链接，如果不指定目标文件，则目标路径默认为当前路径
ln -s 源路径 [目标路径] # 创建文件夹链接，如果不指定目标文件，则目标路径默认为当前路径
注意：ln命令在对文件进行链接时，必须使用绝对路径，若想用相对路径，可以先进入目标路径，再做链接
如：ln -s ../genome.fa .  # 将上一个目录里的genome.fa链接到当前目录
```

### 2.9 删除：

```shell
rm -i 文件 # 删除前询问
rm -rf 文件 # 强制删除
rm -rf 目录名 # 递归强制删除目录及其子目录里的文件夹和文件
rm 链接 # 删除链接文件，不管链接的是文件还是文件夹，都不要在末尾加"/"，否则删除不掉
```

### 2.10 批量删除百万个文件：

```shell
mkdir ./tmp  # 先新建一个文件夹
rsync --delete-before -a -H -v --progress --stats ./tmp/ ./ncrna/  
# 然后使用同步命令删除./ncrna文件夹
# 选项说明：
 –delete-before 接收者在传输之前进行删除操作
 –progress 在传输时显示传输过程
 -a 归档模式，表示以递归方式传输文件，并保持所有文件属性
 -H 保持硬连接的文件
 -v 详细输出模式
 –stats 给出某些文件的传输状态
```

## 3. 压缩与解压

### 3.1 压缩：

```perl

tar zcvf file.tar.gz 文件(夹)路径 # 将文件/文件夹压缩为.tar.gz格式
tar jcvf file.tar.bz2 文件(夹)路径 # 将文件/文件夹压缩为.tar.bz2格式

gzip –c filename > filename.gz 
#-c 将输出写到标准输出上，并保留原有文件。 
#-d 将压缩文件解压。 
#-l 对每个压缩文件，显示下列字段： 
#　（1）压缩文件的大小 
#　（2）未压缩文件的大小 
#　（3）压缩比 
#　未压缩文件的名字 
#-r 递归式地查找指定目录并压缩其中的所有文件或者是解压缩。 
#-t 测试，检查压缩文件是否完整。 
#-v 对每一个压缩和解压的文件，显示文件名和压缩比。 
#-num 用指定的数字num调整压缩的速度，-1或--fast表示最快压缩方法（低压缩比），
#     -9或--best表示最慢压缩方法（高压缩比）。系统缺省值为6。

```


### 3.2 解压：

```
    unzip file.zip # 解压zip格式
    gzip -d file.gz # 解压gz格式
    xz -d file.tar.xz|tar xvf file.tar #解压tar.xz格式
    tar zxvf file.tar.gz # 解压.tar.gz格式(tgz格式)
    tar zxvf file.tar.gz -C 解压路径 # 指定解压路径
    tar jxvf file.tar.bz2 # 解压.tar.bz2格式
    tar jxvf file.tar.bz2 -C 解压路径 # 指定解压路径
```


压缩和解压过程中，若去掉v参数可以提高压缩、解压速度

### 3.3 查看：

    tar ztvf/ztf file.tar.gz # 查看.tar.gz文件列表
    tar jtvf/jtf file.tar.bz2 # 查看.tar.bz2文件列表

查看压缩文件列表中，若有v参数可以查看文件详细信息，类似于ll命令

## 4. 文件分割与合并

### 4.1 分割：

```
    split -b 10m file.tar.gz -d part.tar.gz # 将file.tar.gz按照每份10mb分割，得到的各部分以part.tar.gz+数字命名
    split -l 2 log.txt -d log # 对log.txt按照每两行分割一次，得到的各部分以log+数字命名
```


### 4.2 合并：

```
    cat file-*.fa > out.fa # 合并多个以file-为前缀的fa文件
    paste -d'\t' a.log b.log > combined.log # 按列合并两个log文档，中间用'\t'分隔
```

### 4.3 合并去冗余：

```
    cat file-*.log | sort -u > out.log # 先将多个以file-为前缀的log合并，然后排序去冗余 
```

## 5. 抓取文件特定行/列

### 5.1 抓行

```shell
awk 'NR>=10 && NR<=100' log.txt # 抓取第10到100行
awk 'NR==1000' log.txt # 抓取第1000行
awk 'NR<=100' log.txt #抓取前100行

sed -n '10,100'p log.txt #抓取第10到100行
sed -n '1000'p log.txt # 抓取第1000行
sed -n '1,100' log.txt # 抓取前100行

perl -ne 'print if $.>=10 && $.<=100' log.txt # 
perl -ne 'print if $.==1000' log.txt # 抓取第1000行
perl -ne 'print if $.<=100' log.txt # 抓取前100行

head -n 100 log.txt # 抓取前100行
tail -n 100 log.txt # 抓取最后100行
```

### 5.2 抓列

```shell
cut -d'\t' -f 3,5 log.txt # 抓取第3、5列，分隔符为'\t'
cut -f 1-5 log.txt # 抓取文件第1-5列
cut -f 5- log.txt # 抓取文件第5列及以后的列
awk 'BEGIN{FS="\t"}{print $2}' # 抓取第2列信息，分隔符为'\t'
head /etc/hosts| perl -F'\t|\s' -ane 'if ($F[3] eq "c2-3"){ print $F[1],"\n"}' 
# 分隔符为'\t'或空格，第4列为c2-3时，打印第2列
head /etc/hosts| awk 'BEGIN{FS="[\t| ]"} END{if($4="c2-3")print $2}' 
# 分隔符为'\t'或空格，当第4列为c2-3时，打印第2列

perl -ane 'print "$F[1]\t$F[2]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[19]\n"' bms信息 > bms.txt 
# 将网页BMS信息转换成7列，用于CSAP流程
```

### 5.3 抓特征行

```shell
grep pattern in.txt
grep -E 'pattern1|pattern2|pattern3' in.txt  # 抓取含有pattern1、pattern2或pattern3的行
```

## 6. 文件编辑

### 6.1 编辑器

    vi/vim # 文件编辑器

### 6.2 插入/追加/替换

```shell
sed '1 i Hello' log.txt # 1 表示第一行,i表示insert插入，当前操作是在第一行前插入"Hello"
sed '10 a Hello' log.txt # a表示append,当前操作是在第10行后添加一行
sed '$ a Hello' log.txt # a表示apppend,当前操作是在log.txt行末添加一行
sed '2 c Hello' log.txt # c表示替换,当前操作将第二行替换为"Hello"
sed -i 's/bin/sbin/g' log.txt # 在源文件上修改，将所有bin替换成sbin
perl -ne 'if ($.==1){print "Hello\n$_"}' log.txt # 在第一行前插入"Hello"
```

## 7. 查找

```shell
find 路径 -name '*.gz' # 查找gz后缀的文件
find 路径 -name '*.gz' -or -name '*.bam' # 查找gz或bam后缀的文件
find 路径 -not -name '*.gz' # 反向查找gz后缀的文件
find 路径 -not -name '*.gz' -and -not -name '*.bam' # 反向查找gz或bam后缀的文件
find 路径 -not -name '*.gz' -and -not -name '*.bam' | xargs cp -r -t 目标路径 # 反向查找gz或bam后缀的文件并递归拷贝到目标路径
find 路径 -not -name '*.gz' -and -not -name '*.bam' | xargs cp -r -t 目标路径 # 反向查找gz或bam后缀的文件并递归拷贝到目标路径
for i in `find 路径 -size +10M`; do echo > $i; done # 查找大于10M的文件，并把它变为空文件
locate 关键字 # 查找，通常为可执行文件
```

## 8. 排序

```shell
sort -k 4,4 -k 2,2 -nk 1,1 file.txt  
#先按第四列排序，再第二列，最后对第一列按数字排序
```

## 9. 循环

```shell
for i in `seq 1 10`; do echo $i; done
cat file | while read line; do echo $line; done
while read line; do echo $line; done < file
```

## 10. 磁盘管理  

总核数 = 物理CPU个数 X 每颗物理CPU的核数 
总逻辑CPU数 = 物理CPU个数 X 每颗物理CPU的核数 X 超线程数

### 10.1 查看物理CPU个数
    cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l

### 10.2 查看每个物理CPU中core的个数(即核数)
    cat /proc/cpuinfo| grep "cpu cores"| uniq

### 10.3 查看逻辑CPU的个数
    cat /proc/cpuinfo| grep "processor"| wc -l

###  10.4 查看CPU信息（型号）
    cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c

###  10.5 查看内存信息

```sh
cat /proc/meminfo
free #直接显示内存（kb）
```

### 10.6 查看磁盘占用

    df . -h # 查看当前路径磁盘使用情况
    du -smh 目录或文件 # 查看目录或文件占用磁盘大小

### 10.7 查看任务状态：

```sh
top # 查看当前节点状态
c # 查看详细命令行
1 # 查看各CPU状态

ps xf # 查看所有任务状态
ps -euf
ps -aux
ps -a x -o user,pid,stat,command| grep monitor # 检索含有特定字符串的任务
ps -a -o user,pid,ppid,stat,command # 自定义查看任务
ps -eo user,uid,ppid,pid,stat,rss,size,rss,cmd|grep R+

任务状态说明
使用ps格式输出来查看进程状态:
ps -eo user,stat..,cmd

user 用户名
uid 用户号
pid 进程号
ppid 父进程号
size 内存大小, Kbytes字节.
vsize 总虚拟内存大小, bytes字节(包含code+data+stack)
share 总共享页数
nice 进程优先级(缺省为0, 最大为-20)
priority(pri) 内核调度优先级
pmem 进程分享的物理内存数的百分比
trs 程序执行代码驻留大小
rss 进程使用的总物理内存数, Kbytes字节
time 进程执行起到现在总的CPU暂用时间
stat 进程状态
cmd(args) 执行命令的简单格式

例子:
查看当前系统进程的uid,pid,stat,pri, 以uid号排序.
ps -eo pid,stat,pri,uid –sort uid

查看当前系统进程的user,pid,stat,rss,args, 以rss排序.
ps -eo user,pid,stat,rss,args –sort rss

qstat # 查看当前用户所有任务状态
qstat -u username # 查看指定用户的任务状态
qstat -j jobId # 查看指定任务的详细信息
qhost -j -h compute-17-47 # 查看指定节点的任务信息
qstat -r # 查看各任务内存使用情况
qstat -r -u 用户名 # 查看指定用户各任务及其资源使用情况
```

## 11. FTP/sftp

### ftp:

```shell
#连接FTP:  
ftp [option] [url] 或 进入FTP后: ftp> open [url]

-d 详细显示指令执行过程，便于排错或分析程序执行的情形。
-i 关闭互动模式，不询问任何问题。
-g 关闭本地主机文件名称支持特殊字符的扩充特性。
-n 不使用自动登陆。
-v 显示指令执行过程。

#下载文件：
1. get [remote-file] [local-file]
2. mget [remote-files] #批量下载 mget *.*
#上传文件：
1. put [local-file] [remote-file]              
2. mput local-files #批量上传
#先用prompt 
#切换交谈式指令(使用mput/mget 时不用每个文件皆询问yes/no)

#断开连接： 
bye/quit      

ftp> !      
#退出当前的窗口，返回Linux 终端，当我们退出终端的时候，又会返回到FTP上。 删除文件: delete/mdelete
ftp>?           
#指令帮助, 常用的ls pwd cd mkdir等等都可

######
```

ftp使用的内部命令如下(中括号表示可选项): 

```
1. ![cmd[args]]：在本地机中执行交互shell，exit回到ftp环境，如：!ls*.zip. 

2. $ macro-ame[args]：执行宏定义macro-name. 

3. account[password]：提供登录远程系统成功后访问系统资源所需的补充口令。 

4. append local-file[remote-file]：将本地文件追加到远程系统主机，若未指定远程系统文件名，则使用本地文件名。 

5. ascii：使用ascii类型传输方式。 

6. bell：每个命令执行完毕后计算机响铃一次。 

7. bin：使用二进制文件传输方式。 

8. bye：退出ftp会话过程。 

9. case：在使用mget时，将远程主机文件名中的大写转为小写字母。 

10. cd remote-dir：进入远程主机目录。 

11. cdup：进入远程主机目录的父目录。 

12. chmod mode file-name：将远程主机文件file-name的存取方式设置为mode，如：chmod 777 a.out。 

13. close：中断与远程服务器的ftp会话(与open对应)。 

14. cr：使用asscii方式传输文件时，将回车换行转换为回行。 

15. delete remote-file：删除远程主机文件。 

16. debug[debug-value]：设置调试方式，显示发送至远程主机的每条命令，如：deb up 3，若设为0，表示取消debug。 

17. dir[remote-dir][local-file]：显示远程主机目录，并将结果存入本地文件local-file。 

18. disconnection：同close。 

19. form format：将文件传输方式设置为format，缺省为file方式。 

20. get remote-file[local-file]：将远程主机的文件remote-file传至本地硬盘的local-file。 

21. glob：设置mdelete，mget，mput的文件名扩展，缺省时不扩展文件名，同命令行的-g参数。 

22. hash：每传输1024字节，显示一个hash符号(#)。 

23. help[cmd]：显示ftp内部命令cmd的帮助信息，如：help get。 

24. idle[seconds]：将远程服务器的休眠计时器设为[seconds]秒。 

25. image：设置二进制传输方式(同binary)。 

26. lcd[dir]：将本地工作目录切换至dir。 

27. ls[remote-dir][local-file]：显示远程目录remote-dir，并存入本地文件local-file。 

28. macdef macro-name：定义一个宏，遇到macdef下的空行时，宏定义结束。 

29. mdelete[remote-file]：删除远程主机文件。 

30. mdir remote-files local-file：与dir类似，但可指定多个远程文件，如：mdir *.o.*.zipoutfile 

31. mget remote-files：传输多个远程文件。 

32. mkdir dir-name：在远程主机中建一目录。 

33. mls remote-file local-file：同nlist，但可指定多个文件名。 

34. mode[modename]：将文件传输方式设置为modename，缺省为stream方式。 

35. modtime file-name：显示远程主机文件的最后修改时间。 

36. mput local-file：将多个文件传输至远程主机。 

37. newer file-name：如果远程机中file-name的修改时间比本地硬盘同名文件的时间更近，则重传该文件。 

38. nlist[remote-dir][local-file]：显示远程主机目录的文件清单，并存入本地硬盘的local-file。 

39. nmap[inpattern outpattern]：设置文件名映射机制，使得文件传输时，文件中的某些字符相互转换，如：
	nmap $1.$2.$3[$1，$2].[$2，$3]，则传输文件a1.a2.a3时，文件名变为a1，a2。
	该命令特别适用于远程主机为非UNIX机的情况。 

40. ntrans[inchars[outchars]]：设置文件名字符的翻译机制，如ntrans 1R，则文件名LLL将变为RRR。 

41. open host[port]：建立指定ftp服务器连接，可指定连接端口。 

42. passive：进入被动传输方式。 

43. prompt：设置多个文件传输时的交互提示。 

44. proxy ftp-cmd：在次要控制连接中，执行一条ftp命令，该命令允许连接两个ftp服务器，
	以在两个服务器间传输文件。第一条ftp命令必须为open，以首先建立两个服务器间的连接。 

45. put local-file[remote-file]：将本地文件local-file传送至远程主机。 

46. pwd：显示远程主机的当前工作目录。 

47. quit：同bye，退出ftp会话。 

48. quote arg1，arg2...：将参数逐字发至远程ftp服务器，如：quote syst. 

49. recv remote-file[local-file]：同get。 

50. reget remote-file[local-file]：类似于get，但若local-file存在，则从上次传输中断处续传。 

51. rhelp[cmd-name]：请求获得远程主机的帮助。 

52. rstatus[file-name]：若未指定文件名，则显示远程主机的状态，否则显示文件状态。 

53. rename[from][to]：更改远程主机文件名。 

54. reset：清除回答队列。 

55. restart marker：从指定的标志marker处，重新开始get或put，如：restart 130。 

56. rmdir dir-name：删除远程主机目录。 

57. runique：设置文件名唯一性存储，若文件存在，则在原文件后加后缀..1，.2等。 

58. send local-file[remote-file]：同put。 

59. sendport：设置PORT命令的使用。 

60. site arg1，arg2...：将参数作为SITE命令逐字发送至远程ftp主机。 

61. size file-name：显示远程主机文件大小，如：site idle 7200。 

62. status：显示当前ftp状态。 

63. struct[struct-name]：将文件传输结构设置为struct-name，缺省时使用stream结构。 

64. sunique：将远程主机文件名存储设置为唯一(与runique对应)。 

65. system：显示远程主机的操作系统类型。 

66. tenex：将文件传输类型设置为TENEX机的所需的类型。 

67. tick：设置传输时的字节计数器。 

68. trace：设置包跟踪。 

69. type[type-name]：设置文件传输类型为type-name，缺省为ascii，如：type binary，设置二进制传输方式。 

70. umask[newmask]：将远程服务器的缺省umask设置为newmask，如：umask 3。 

71. user user-name[password][account]：向远程主机表明自己的身份，需要口令时，必须输入口令，如：
	user anonymous my@email。 

72. verbose：同命令行的-v参数，即设置详尽报告方式，ftp服务器的所有响应都将显示给用户，缺省为on. 

73. ?[cmd]：同help。
```

### sftp:

```sh
sftp username@xxx.xxx.xx.xx
#input password
sftp> get [file_on_sftp] [local_dir] #下载文件，好像不能下载文件夹

sftp> put [local_file] [sftp_dir] #上传文件
```

|         order        |      mean     |
|----------------------|---------------|
| pwd                  | sftp cur_dir  |
| lpwd                 | local cur_dir |
| cd                   | cd sftp       |
| lcd                  | cd local      |
| ls;rm;rmdir;mkdir... | sftp          |
| lls;lrm...           | local         |
| exit/quit/bye        | exit          |


## 12. 杂项

### make -j

    make -j4/8 #编译时使用4/8个cpu 更快: make -j4 & make install    

### 查看文件完整路径：
    ls abc.txt | sed "s:^:`pwd`/:g"

### 按修改时间顺序查看文件：

    ls -ltr

### 使用通配符查看文件：
    ls /share/*/*

### 查看文件夹结构：
    tree

### 判断文件是否存在：

    [ -e "/home/root.log" ] && echo exist
    [ $(ls /home/zhangwei9/*/*.py 2> /dev/null|wc -l) -gt 1 ] && echo yes #这是使用通配符查看文件是否存在的方法
    

## 13. 条件测试

通常用 "[ ]"来表示条件测试。注意这里的**空格**很重要。要确保方括号的空格。

```
    [ -f "somefile" ] ：判断是否是一个文件
    [ -x "/bin/ls" ] ：判断/bin/ls是否存在并有可执行权限
    [ -n "$var" ] ：判断var变量是否有值
    [ "$a" = "$b" ] ：判断a和b是否相等 
```

- 文件夹不存在则创建

```shell
if [ ! -d "/data/" ];then
mkdir /data
else
echo "文件夹已经存在"
fi
```

- 文件存在则删除


```shell
if [ ! -f "/data/filename" ];then
echo "文件不存在"
else
rm -rf /data/filename
fi

```

- 判断文件夹是否存在


```shell
if [ -d "/data/" ];then
echo "文件夹存在"
else
echo "文件夹不存在"
fi
```

- 判断文件是否存在


```perl
if [ -d "/data/test" ];then
echo "文件存在"
else
echo "文件不存在"
fi
```


### 13.1 文件判断

```bash
    [ -a FILE ] 如果 FILE 存在则为真。
    [ -b FILE ] 如果 FILE 存在且是一个块特殊文件则为真。
    [ -c FILE ] 如果 FILE 存在且是一个字特殊文件则为真。
    [ -d FILE ] 如果 FILE 存在且是一个目录则为真。
    [ -e FILE ] 如果 FILE 存在则为真。
    [ -f FILE ] 如果 FILE 存在且是一个普通文件则为真。
    [ -g FILE ] 如果 FILE 存在且已经设置了SGID则为真。
    [ -h FILE ] 如果 FILE 存在且是一个符号连接则为真。
    [ -k FILE ] 如果 FILE 存在且已经设置了粘制位则为真。
    [ -p FILE ] 如果 FILE 存在且是一个名字管道(F如果O)则为真。
    [ -r FILE ] 如果 FILE 存在且是可读的则为真。
    [ -s FILE ] 如果 FILE 存在且大小不为0则为真。
    [ -t FD ] 如果文件描述符 FD 打开且指向一个终端则为真。
    [ -u FILE ] 如果 FILE 存在且设置了SUID (set user ID)则为真。
    [ -w FILE ] 如果 FILE 如果 FILE 存在且是可写的则为真。
    [ -x FILE ] 如果 FILE 存在且是可执行的则为真。
    [ -O FILE ] 如果 FILE 存在且属有效用户ID则为真。
    [ -G FILE ] 如果 FILE 存在且属有效用户组则为真。
    [ -L FILE ] 如果 FILE 存在且是一个符号连接则为真。
    [ -N FILE ] 如果 FILE 存在 and has been mod如果ied since it was last read则为真。
    [ -S FILE ] 如果 FILE 存在且是一个套接字则为真。
    [ FILE1 -nt FILE2 ] 如果 FILE1 has been changed more recently than FILE2, or 如果 FILE1 exists and FILE2 does not则为真。
    [ FILE1 -ot FILE2 ] 如果 FILE1 比 FILE2 要老, 或者 FILE2 存在且 FILE1 不存在则为真。
    [ FILE1 -ef FILE2 ] 如果 FILE1 和 FILE2 指向相同的设备和节点号则为真。
    [ -o OPTIONNAME ] 如果 shell选项 “OPTIONNAME” 开启则为真。
```

### 13.2 字符串/数字判断

```bash
    [ -z STRING ] “STRING” 的长度为零则为真。
    [ -n STRING ] or [ STRING ] “STRING” 的长度为非零 non-zero则为真。
    [ STRING1 == STRING2 ] 如果2个字符串相同则为真。“=” may be used instead of “==” for strict POSIX compliance
    [ STRING1 != STRING2 ] 如果字符串不相等则为真。
    [ STRING1 < STRING2 ] 如果 “STRING1” sorts before “STRING2” lexicographically in the current locale则为真。
    [ STRING1 > STRING2 ] 如果 “STRING1” sorts after “STRING2” lexicographically in the current locale则为真。
    [ ARG1 OP ARG2 ] “OP” is one of -eq, -ne, -lt, -le, -gt or -ge. These arithmetic binary operators return true if “ARG1” is equal to, not equal to, less than, less than or equal to, greater than, or greater than or equal to “ARG2”, respectively. “ARG1” and “ARG2” are integers.
    
    UNIX shell 里面比较字符写法：
    -eq 等于
    -ne 不等于
    -gt 大于
    -lt 小于
    -le 小于等于
    -ge 大于等于
    -z 空串
    = 两个字符相等
    != 两个字符不等
    -n 非空串
```


## 14. 特殊变量

```
$0                 正在被执行命令的名字。对于shell脚本而言，这是被激活命令的路径
$n                 该变量与脚本被激活时所带的参数相对应。n是正整数，与参数位置相对应($1,$2…)
$#                 提供脚本的参数号
$*                 所有这些参数都被双引号引住。若一个脚本接收两个参数，$*等于$1$2
$@                 所有这些参数都分别被双引号引住。若一个脚本接收到两个参数，$@等价于$1$2
$?                 前一个命令执行后的退出状态
$$                 当前shell的进程号。对于shell脚本，这是其正在执行时的进程ID
$!                 前一个后台命令的进程
```

## 15. sed命令-反向输出文件


```
sed '1!G;h;$!d' old_file
#解读
```
