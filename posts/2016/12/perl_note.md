+++
title = "perl_note"
showall = true
summary = """
  my perl note, mainly perl one-liners
  """

# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasnutshell = false
hasplotly = false
hasmermaid = false
tags = ["programming", "perl"]
pubdate = Date("2016-12-13")
+++
{{page_tags}}


## Perl-One-Liner
### 1. Perl-One-Liner参数和perl特殊变量:
```
-e:表示后接指令 ''
-n:逐行读取文件
-l:先chomp,输出时再加换行
-p:逐行读取并逐行输出
-a:按照-F进行split,结果存储在@F中 若要重新指定-F，要先声明-F 再声明-a： perl -F"\t" -lane '...'
-i:原文件编辑 -i.bak 创建".bak"备份 eg: perl -pi.bak -e 's/you/me/g' file；
等同于脚本里编辑 $^I变量（只适用于<>）
----------------------------------------------------
$_ 当前变量
$. 行号
$/ 输入分隔符eg: open XX; $/=">";while(<>){...} #按fas格式逐条读取
$\ 输出分隔符:perl -e '$\ = ". "; print "hello"; print "world"' 结果是 "hello. world."
$1, $2, $3 模式匹配
$, 输出多个变量时每个变量间的分隔符
$" 在引号间输出多个变量时的分隔符 " 
$& 用来存放匹配中的值
$` 用来存放匹配中之前所有字符
$' 用来存放匹配中之后所有字符
```

### 2. 统计匹配到的次数（linux下grep -c），使用tr///;或者s///g:

```sh
$count=$temp=~tr/A//; #要区分大小写
$count=$temp=~s/(A)/$1/g; #可以通过i参数设定不区分大小写
```

### 3. 合并A列相同的B列数据,判断hash_keys出现次数

```sh
$ cat data |sort -k 1|perl -ane 'chomp;if( $a{$F[0]}++){$a="$F[1] "}else{$a = "\n$_ "};print "$a";' 
```
### 4. 查找重复行:
```sh
perl -ne 'print if $a{$_}++' file 
```
### 5. @{[ ... ]}: 在双引号中执行命令
__原理:__ [...]看作引用, 引用中可以执行命令,然后立刻解引用@{}
```sh
print qq{ @{[ join "-",1..10]} } 得到1_2_3_4_5_6_7_8_9_10
print qq{join "_",1..10} 得到join "_",1..10
```
### 6. 大小写转换, u大l小
```sh
print uc 等同于 print "\U$_\E" #\E可省,全大写
print lc 等同于 print "\L$_\E" #\E可省,全小写
print ucfirst lc = print "\u\L$_" #先全变小写再首字母大写
```
### 7. 语句1 && 语句2 :
等同于 if(语句1){语句2}
### 8. 反向输出行/列:
```sh
行: perl -lne 'print scalar reverse' 
perl -lpe '$_ = reverse'
列: perl -F"\t" -alne 'print "@{[reverse @F]}"' #-F指定分隔符 -F和分隔符之间不加空格!!
```
### 9. 输出后10行 (tail -10):
```sh
perl -ne 'push @a, $_; @a = @a[@a-10..$#a] if @a>10; END { print @a }' file
perl -ne 'push @a, $_; shift @a if @a>10; END { print @a }' file
```
### 10.输出不匹配的行:
```sh
perl -ne '!/regex/ && print'
perl -ne 'print if !/regex/'
perl -ne 'print unless /regex/'
perl -ne '/regex/ || print'
```
### 11. grep -B 1 :
```sh
perl -ne '/regex/ && $last && print $last; $last = $_'
grep -A 1 :
perl -ne 'if ($p) { print; $p = 0 } $p++ if /regex/' 
perl -ne '$p && print; $p = /regex/'
```
### 12. 输出指定行:
```sh
perl -ne '$. == 13 && print && exit'
perl -ne '$. != 27 && print'
perl -ne '@lines = (13, 19, 88, 290, 999, 1400, 2000);print if grep { $_ == $. } @lines' 
perl -ne 'print if 17..30' # ..操作符用在数字中时,将在$.中检测
```
### 13. 输出指定两个表达式之间的所有行:
```sh
perl -ne 'print if /regex1/../regex2/' 
# .. 操作符用在RE中时,将在$_中检测,检测到regex1前,返回FALSE,检测到regex1后,
# 一直返回TURE,直到检测到regex2后返回最后一个TURE,之后再一直返回FALSE.
```
### 14. 输出最长行:
```sh
perl -ne '$l = $_ if length($_) > length($l);END { print $l }' 
```
### 15. 输出最短行:
```sh
perl -ne ' $s = $_ if $. == 1; $s = $_ if length($_) < length($s); END { print $s } ' #输出最短行时要先定义$s,不然默认0一直最小
```
### 16. 行去重/只输出重复行:
行去重:
```sh
perl -ne 'print if ++$a{$_} == 2'
```
只输出重复行:
```sh
perl -ne 'print unless $a{$_}++'
```
### 17. /[ -~]/

匹配所有可打印字符,在ASCII中所有可打印字符的顺序,以空格" "开始,以"~"结束,
所以[ -~](类似[A-Z])包含所有可打印字符

## Nomal Perl
### 1. 输出匹配字符串的位置(pos函数 返回匹配后的末尾位置):
```sh
while ($seq =~ /(n+)/ig){
my $len = length $1; 
my $end = pos $seq;
my $start = $end-$len+1; 
my $name ="N_$len";
print OUT "$id\t$start\t$end\t$name\t$score\t$strand\n";
```
### 2. cpan安装模块：
```sh
perl -MCPAN -e shell #进入cpan
install XXX::XX #安装模块
```

### 3.perl 的智能匹配操作符

```
Perl5.018以上版本建议不用 ~~ 了，所以使用`~~`时会有警告。如果不想要警告，加入以下代码：
? `no if $] >= 5.018, warnings => "experimental::smartmatch";`
```

```sh
perl5.010版本以上支持的智能匹配操作符，可以极大效率的提高我们的代码简洁度。
%a ~~ %b 哈希的键是否一致 
%a ~~ @b 至少 %a 中的一个键在列表@b中 
%a ~~ /Fred/ 至少一个键匹配给定的模式 
%a ~~ 'Fred' 哈希中某一指定键$a{Fred}是否存在 $a{Fred} 
@a ~~ @b 数组是否相同 
@a ~~ /Fred/ 有一个元素匹配给定的模式 
@a ~~ 123 至少有一个元素转化为数字后是123 
@a ~~ 'Fred' 至少有一个元素转化为字符串后是'Fred' 
$name ~~ undef $name确实尚未定义 
$name ~~ /Fred/ 模式匹配 
123 ~~ '123.0' 数字和字符串是否相等 
'Fred' ~~ 'Fred' 字符串是否相同 
123 ~~ 456 数字是否相等
智能匹配可以取代复杂的循环。
```
### 4. 编写可用于管道和shell批量输入参数的perl脚本：
```sh
#!/usr/bin/env perl
@ARGV = ('-') unless @ARGV; 
while (my $ARGV = shift) {...}
```
### 5. perl hash和数组指针的使用,实现类似R中merge的功能:
```perl
my $list = shift;
my $another_list = shift;
my %list;
open IN,"$list" || die $!;
while(<IN>){
    chomp;
    s/\r$//;
    my @t = split /\t/;
    $list{$t[0]} = []; # [] is array reference
}
close IN;
open IN,"$another_list" || die $!;
while(<IN>){
chomp;
    s/\r$//;
    my @t = split /\t/;
    if(exists $list{$t[0]}){
        push @{$list{$t[0]}},@t;
    }
}
close IN;
```
### 6 Print 技巧

```
print join("\t",@XXX),"\n"; #用join控制数组的间隔
```

