+++
title = "docker和singularity容器使用简介"
# tags = [ "programming","bioinformatics","genetics","paper","work","daily","random","insight", ... ]
tags = ["programming","linux", "container"]
showall = true
summary = """
  简单用法介绍docker和singularity
  """

# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasnutshell = false
hasplotly = false
hasmermaid = false
hascomment = true

pubdate = Date("2022-08-17")
+++

{{page_tags}}

\toc

## docker

> https://www.runoob.com/docker/docker-command-manual.html

### Hello World

\bash{
# docker run [image_name] [cmd]
docker run ubuntu:15.10 /bin/echo "Hello World"

# 交互模式: -i -t
# -i: 对容器内的STDIN进行交互
# -t: 在新容器中指定一个伪终端
docker run -i -t ubuntu:15.10 /bin/bash
# exit or ctrl+D to exit

# 后台模式
docker run -d ubuntu:15.10 /bin/sh -c "while true; do echo hello world; sleep 1; done"
# 该模式会在后台运行一个容器, 运行上述指令输出容器ID

# 用docker ps查看在运行的容器:
docker ps -a

CONTAINER ID        IMAGE                  COMMAND              ...  
5917eac21c36        ubuntu:15.10           "/bin/sh -c 'while t…"    ...

# 容器状态有7种:
created; restarting; running/Up; removing; paused; exited; dead

# 查看容器stdin:
docker logs [container_ID]
# 停止容器:
docker stop [container_ID]
}

### 容器

\bash{

# 获取镜像:
docker pull xxxx

# 启动容器, 交互模式:
docker run -it xxxx /bin/bash
# 启动时挂载主机目录:
--mount type=bind,source=/src/webapp,target=/usr/share/nginx/html,readonly
# 主机的/src/webapp ==> 容器的/usr/share/nginx/html, 且设置为只读


# 启动容器, 交互后台运行:
docker run -itd --name yourname xxx /bin/bash

# 停止, 重启
docker stop <CID>
docker restart <CID>

# 进入后台容器
docker exec -it <CID> /bin/bash # exec进入容器再退出后 不会导致容器的停止

# 导出导入容器
docker export <CID> > xxxx.tar
cat xxx.tar | docker import - new_xxxx

# 删除容器
docker rm -f <CID>
# 清楚所有终止状态的容器:
docker container prune

# web服务 -> 端口映射
docker run -d -p 8090:8090 xxx python app.py # 将容器内部的8090端口映射到本机的8090端口上
# 查看容器的端口映射
docker ps   # 或者
docker port <CID>

# 查看web应用容器的进程
docker top xxxx

# 查看web应用的底层信息
docker inspect xxxx

}

### 镜像

\bash{

# list local images
docker images

# save and load
docker save -o /path/to/xxx.tar image_name
docker load -i /path/to/xxx.tar

# get new local image
docker pull xxxx

# serach image from docker hub
docker search httpd

# delete image
docker rmi xxxx

# create/update image
## update image: run image -> apt-get update -> docker commit 提交新容器副本

## create image: docker build, 需要Dockerfile
FROM    centos:6.7
MAINTAINER      Fisher "fisher@sudops.com"

RUN     /bin/echo 'root:123456' |chpasswd
RUN     useradd runoob
RUN     /bin/echo 'runoob:123456' |chpasswd
RUN     /bin/echo -e "LANG=\"en_US.UTF-8\"" >/etc/default/local
EXPOSE  22
EXPOSE  80
CMD     /usr/sbin/sshd -D

# docker build -t [image_name] [dir_to_Dockerfile]
docker build -t runoob/centos:6.7 .

# docker tag -> add tag to image
}

### 容器连接

\bash{
# 指定网络地址(tcp)
docker run -d -p 127.0.0.1:5001:5000 training/webapp python app.py

#其他的内容暂时用不上: https://www.runoob.com/docker/docker-container-connection.html
}
### 仓储

\bash{
# 在 https://hub.docker.com 免费注册一个 Docker 账号。
docker login
docker logout
docker search
docker pull
docker push
}

### Dockerfile


>https://www.runoob.com/docker/docker-dockerfile.html



## Singularity

### 简介

- 没有image的概念, 创建和运行的都是容器
- SIF格式: 生产使用的, 只读容器
- Sandbox: 可写的容器, 开发使用

### 构建容器

\bash{
## pull from singularity hub
singularity pull hello.sif

## build from docker hub
singularity build ./xxx.sif docker://xxx/xxx:latest

## manually build
singularity build --sandbox sandbox docker://xxx/xxx:latest-gpu
## 可以直接在sandbox目录进行修改:
mkdir sandbox/opt/test
cp ttt.sh sandbox/opt/test
...
## 改动后生成只读的SIF:
singularity build xxx.sif sandbox/

## 通过Definition 文件制作容器
## 编写Definition文件: https://sylabs.io/guides/3.7/user-guide/definition_files.html
singularity build xxx.sif xxx.def

}

### Def 文件

#### Header
基本操作系统信息, 包含多个关键字: 

`Bootstrap`: 必须有且要放到第一行的关键字, 后边跟的不同事件决定了其他的关键字属性. 可用的事件有:

| Agents         | Desc                               |
| -------------- | ---------------------------------- |
| library        | images on Container Lib            |
| docker         | images on docker hub               |
| shub           | images  on Sinngularity Hub        |
| oras           | images from support OCI registries |
| scratch        | container from scratch             |
| localimage     | images saved on local machine      |
| yum            | yum based systems                  |
| debootstraap   | apt based systems                  |
| oci            |                                    |
| oci-archive    |                                    |
| docker-daemon  |                                    |
| docker-archive | archived docker images             |
| arch           | Arch Linux                         |
| busybox        |                                    |
| zypper         |                                    |






#### Sections


### 容器操作

\bash{

# exec
singularity exec xxx.sif [cmd] [opt]

# run
singularity run xxx.sif 

# shell
singularity shell xxx.sif

# mount
--bind /local/path:/container/path

}
