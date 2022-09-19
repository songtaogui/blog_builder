+++
title = "bash_on_ubuntu_on_windows"
showall = true
summary = """
  How to set up bash on ubuntu on windows on win10
  """

# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasnutshell = false
hasplotly = false
hasmermaid = false
tags = ["programming", "bash", "linux"]
pubdate = Date("2017-11-25")
+++
{{page_tags}}


## 启用Bash on ubuntu on Windows

需要:最新 Windows 10 (至少 Build 14316 )

1. 开启Bash:

- `「设置」-「安全和更新」-「针对开发人员」-「开发人员模式」 `

- `「控制面板」-「卸载程序」-「启用或关闭 Windows 功能」- 在弹出的窗口中勾选「Windows subsystem for Linux(Beta)」组件-确定` 

2. 如果想偷懒的话，可以直接在 PowerShell 中执行如下命令启用 Windows subsystem for Linux 功能：

        
        #在POWERSHELL中输入:
        Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
        
3. 重启计算机后,[CMD]-输入"bash"-下载ubuntu子系统
   在1706版的Win10中，直接从应用商店下载ubuntu子系统

## 命令参考

有两个命令  `bash.exe` 和 `lxrun.exe` 用于和 Windows Subsystem for Linux (WSL) 进行交互。它们安装在 `\Windows\System32` 目录下，可以在命令行或 Powershell 中运行。

- `bash.exe` 启动 bash 环境并运行 /bin/bash
- `lxrun.exe` 用于管理 WSL，可以用来安装或卸载 Ubuntu 镜像

|         命令        |                                    描述                                    |
|---------------------|----------------------------------------------------------------------------|
| bash                | 在当前目录启动 bash shell，如果 Bash 没有安装，这自动运行 `lxrun /install` |
| bash ~              | 启动 `bash`，并切换到用户的 Ubuntu 主目录，类似运行 `cd ~`                 |
| bash -c "command" | 运行命令、打印输出并返回 Windows 命令行,例子：`bash -c "ls"`               |

| 命令             | 描述                                                         |
|----------------- |--------------------------------------------------------------|
| lxrun            | 用于管理 WSL 实例                                            |
| lxrun /install   | 启动下载和安装过程, `/y `选项可以用于自动应答安装过程的确认提示|
| lxrun /uninstall | 卸载并删除 Ubuntu 镜像。默认不删除用户的 Ubuntu 主目录。`/y` 选项可以用于自动应答安装过程的确认提示, `/full` 选项会卸载并删除用户的 Ubuntu 主目录|
|lxrun /update     |更新linux子系统 |  
|lxrun /update /critical|只更新关键更新，更新完成后会强制关闭linux进程|

## 【2017-11-25更新】wsl-terminal比cmder更方便
[`wsl-terminal`](https://zhuanlan.zhihu.com/p/22033219)
wsl-terminal.conf设置shell 图标等
### listary 设置 wsl-terminal
![](https://leanote.com/api/file/getImage?fileId=5a199dfcab6441248c002604)
## cmder 设置 启动 bash
默认cmder中从cmd启动bash 不支持翻页和方向键的使用，需要更改启动选项为

```perl
%windir%\system32\bash.exe -new_console:pd:%CD%
```

## Listary设置bash启动关键词(用cmder从当前路径启动):

```
路径: %YourPath%\ConEmu64.exe
参数: -icon "你的icon路径"  -run %windir%\system32\bash.exe -new_console:pd:{current_folder}
```

## 图形界面支持

在win下下载安装 `VcXsrv` 保持后台开启状态；

在bash中输入 `export DISPLAY=:0` (加入zshrc或者bashrc)

打开图形应用 就自动开启x11图形窗口了

## Ubuntu 14 更换源

默认源太慢了,更换为国内源:

- 备份原来的源文件: 
```
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
```
- 更改源文件`sudo vim /etc/apt/sources.list`为以下值(我用的163网易):
```
#------------------ubuntu14.04 trusty(sohu#山东网通用户强烈建议#)-----------------------#
deb http://mirrors.sohu.com/ubuntu/ trusty multiverse universe restricted main 
deb http://mirrors.sohu.com/ubuntu/ trusty-updates multiverse universe restricted main 
deb http://mirrors.sohu.com/ubuntu/ trusty-backports multiverse universe restricted main 
deb http://mirrors.sohu.com/ubuntu/ trusty-security multiverse universe restricted main 
deb http://mirrors.sohu.com/ubuntu/ trusty-proposed multiverse universe restricted main 


#-------------ubuntu14.04 trusty(163#网易电信网通双线接入网速杆杆的#)-----------------#
deb http://mirrors.163.com/ubuntu/ trusty main multiverse restricted universe  
deb http://mirrors.163.com/ubuntu/ trusty-security main multiverse restricted universe 
deb http://mirrors.163.com/ubuntu/ trusty-updates main multiverse restricted universe 
deb http://mirrors.163.com/ubuntu/ trusty-proposed universe restricted multiverse main 
deb http://mirrors.163.com/ubuntu/ trusty-backports main multiverse restricted universe 


#-------------------ubuntu14.04 trusty(taiwan)--------------------------#
deb http://tw.archive.ubuntu.com/ubuntu/ trusty multiverse universe restricted main  
deb http://tw.archive.ubuntu.com/ubuntu/ trusty-security multiverse universe restricted main  
deb http://tw.archive.ubuntu.com/ubuntu/ trusty-updates multiverse universe restricted main
deb http://tw.archive.ubuntu.com/ubuntu/ trusty-proposed multiverse universe restricted main
deb http://tw.archive.ubuntu.com/ubuntu/ trusty-backports multiverse universe restricted main 



#-------------------ubuntu14.04 trusty(上海交通大学)--------------------------#
deb http://ftp.sjtu.edu.cn/ubuntu/ trusty universe restricted multiverse main 
deb http://ftp.sjtu.edu.cn/ubuntu/ trusty-security universe restricted multiverse main 
deb http://ftp.sjtu.edu.cn/ubuntu/ trusty-updates universe restricted multiverse main 
deb http://ftp.sjtu.edu.cn/ubuntu/ trusty-proposed universe restricted multiverse main 
deb http://ftp.sjtu.edu.cn/ubuntu/ trusty-backports universe restricted multiverse main 


#-------------------ubuntu14.04 trusty(北京交通大学)--------------------------#
deb http://mirror.bjtu.edu.cn/ubuntu/ trusty universe restricted multiverse main 
deb http://mirror.bjtu.edu.cn/ubuntu/ trusty-security universe restricted multiverse main 
deb http://mirror.bjtu.edu.cn/ubuntu/ trusty-updates universe restricted multiverse main 
deb http://mirror.bjtu.edu.cn/ubuntu/ trusty-proposed universe restricted multiverse main 
deb http://mirror.bjtu.edu.cn/ubuntu/ trusty-backports universe restricted multiverse main 
```
- 更改后`sudo apt-get update`更新源。

## Ubuntu安装zsh和oh my zsh

- 查看已安装sh:

```
cat /etc/shells
```

- 安装zsh、git和wget：

```
sudo apt-get install zsh git wget
```

- 获取并自动安装`oh-my-zsh`：

```
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
```
## autojump 之 git本地安装

克隆autojump的repo，Terminal下执行：

    git clone git://github.com/joelthelion/autojump.git

然后进入clone下来的目录，执行安装脚本：

    ./install.py

在安装过程中，会在～/下建立.autojump文件夹
根据提示在`./bashrc` 和 `./zshrc` 中添加配置指令:

    [[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

使用:

    autojump [filename]
    #或:
    j [filename]

## Ubuntu安装最新版本R

- 添加密钥

CRAN中存储的Ubuntu包需要通过密钥E084DAB9进行签名验证，运行以下命令添加密钥到ubuntu系统

`sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9`

- 配置R源

用文本编辑软件如 vim 打开 `/etc/apt/sources.list` 文件，在文本末尾新增一行：

`deb http://mirrors.xmu.edu.cn/CRAN/bin/linux/ubuntu/ trusty/` (ubuntu是14.04 LTS 对应代号trusty)

- 更新源并安装新R

`sudo apt-get update;sudo apt-get install r-base`

## 杂项

### 去掉错误提示音

去掉终端错误提示音:

    sudo echo "set bell-style none" >> ~/.inputrc
    
去掉vim错误提示音:

    #在vimrc中加入:
    set noeb
    set vb

如果还有提示音,就从windows中禁止:

>打开控制面板——>打开硬件和声音——>打开声音——>选择声音——>修改关键性停止的声音方案，来取消提示音

