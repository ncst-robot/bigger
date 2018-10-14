---
title: 解惑 Ubuntu
date: 2018-8-22 17:49:06
tags: 故障解决
---


## pip

### \#1 pip install tesserocr

首先按照[官网的操作](https://pypi.org/project/tesserocr/)，出现了下面的错误。

> 错误描述：
>
>   x86_64-linux-gnu-gcc: error trying to exec 'cc1plus': execvp: 没有那个文件或目录
>   error: command 'x86_64-linux-gnu-gcc' failed with exit status 1
>
> ​	----------------------------------------
>
> Command "/usr/bin/python -u -c "import setuptools, tokenize;__file__='/tmp/pip-build-lPWU5A/tesserocr/setup.py';f=getattr(tokenize, 'open', open)(__file__);code=f.read().replace('\r\n', '\n');f.close();exec(compile(code, __file__, 'exec'))" install --record /tmp/pip-KjLMZC-record/install-record.txt --single-version-externally-managed --compile --user --prefix=" failed with error code 1 in /tmp/pip-build-lPWU5A/tesserocr/

根据错误日志可以发现：**这个错误是gcc和g++版本不兼容导致的，也有可能是安装完gcc没有安装g++**

首先安装gcc和g++及一些依赖包
```
sudo apt-get install build-essential
```
（我安装到上面那步就可以了，下面没再运行，结果就成功了，**为什么需要build-essential？**[看下文#2](#build-essential)）

![tesserocr](tesserocr.jpg)

```
sudo apt-get install g++
```


安装完成后使用 gcc -v 查看版本，然后使用g++ -v 查看版本，保证版本一致

如果系统中安装有多个版本的gcc

那么就需要ln一下，我的机器上边安装的是4.3的，所以执行命令如下

```
sudo ln -sf g++-4.3 /usr/bin/g++

sudo ln -sf g++-4.3 /usr/bin/i686-linux-gnu-g++

sudo ln -sf gcc-4.3 /usr/bin/gcc

sudo ln -sf gcov-4.3 /usr/bin/gcov

sudo ln -sf gcc-4.3 /usr/bin/i686-linux-gnu-gcc
```

然后编译，OK。

### \#2 build-essential

linux操作系统上面开发程序， 光有了gcc 是不行的
它还需要一个   build-essential软件包
作用是提供编译程序必须软件包的列表信息

也就是说 编译程序有了这个软件包
它才知道 头文件在哪 才知道库函数在哪
还会下载依赖的软件包   最后才组成一个开发环境
当然 build-essential包 安装时 需要的依赖包 有些你用不上

软件包: build-essential 安装方法：
```
sudo apt-get install build-essential 
```
[返回原文#1](#pip-install-tesserocr)

## apt-get

### \#1 Error: BrokenCount > 0

> 出现这种情况的原因大多是安装的软件包不满足依赖关系
> 我出现这种情况是因为××更换了镜像源××

下面是[Ubuntu论坛](https://ubuntuforums.org/)给出的解决方案

1. 清除之前的缓存，查看能否解决问题
2. 更新镜像源
3. 安装配置文件
4. 再次安装

```
sudo apt-get clean
sudo apt-get update
sudo dpkg --configure -a
sudo apt-get install -f
```

如果上面的回答不能解决问题，可以尝试下面的解决方案（清理的更加彻底了）

```
sudo mv /var/lib/dpkg/status /var/lib/dpkg/status-bad
sudo cp /var/lib/dpkg/status-old /var/lib/dpkg/status
sudo mv /var/lib/dpkg/available /var/lib/dpkg/available-bad
sudo cp /var/lib/dpkg/available-old /var/lib/dpkg/available
sudo rm -rf /var/lib/dpkg/updates/*
sudo rm -rf /var/lib/apt/lists/*
sudo mkdir /var/lib/apt/lists/partial
sudo rm /var/cache/apt/*.bin
sudo apt-get clean
sudo apt-get autoremove
sudo apt-get update
sudo dpkg --configure -a
sudo apt-get install -f
```

### \#2 镜像源

第三方库或者软件的**版本**和**镜像源**有直接的关系，根据经验，使用[Ubuntu国内的源](http://cn.archive.ubuntu.com/ubuntu/)速度会比[国外](http://us.archive.ubuntu.com/ubuntu/)的快一些，版本是最新的，但是速度和[阿里](http://mirrors.aliyun.com/ubuntu/)，[网易](http://mirrors.163.com/ubuntu/)，[中科大](http://mirrors.ustc.edu.cn/help/ubuntu.html)，[清华](https://mirrors.tuna.tsinghua.edu.cn/ubuntu/)等相比较，会有点慢。

[Ubuntu 18.04 镜像源列表](https://blog.csdn.net/xiangxianghehe/article/details/80112149)

### \#3 ppa

问题描述：

> E: The repository 'http://ppa.launchpad.net/noobslab/deepin-sc/ubuntu bionic Release' does not have a Release file.

解决方案：

```
cd /etc/apt/sources.list.d
ls
sudo rm noobslab-ubuntu-deepin-sc-bionic.list
sudo rm noobslab-ubuntu-deepin-sc-bionic.list.save
```

## dpkg

### \#1 dpkg: dependency problems prevent configuration

> dpkg: dependency problems prevent configuration of cr3:
>  cr3 depends on libpng12-0 (>= 1.2.13-4); however:
>   Package libpng12-0 is not installed.

这个问题是安装包过于老旧或者缺少软件包

解决方法：

```
sudo apt --fix-broken install
```

### \#2 dpkg: 错误：正在解析文件 '/var/lib/dpkg/updates/0004'

1. sudo rm /var/lib/dpkg/updates/*
2. sudo apt-get update

### \#3 无法获得锁 /var/lib/dpkg/lock - open

1. 查看占用命令的进程：ps aux
2. 杀掉进程：sudo kill #PID

## others

### \#1 QGtkStyle could not resolve GTK. Make sure you have installed the proper libraries.

***Unresolved***

### \#2 (WPS Office Fonts) No necessary symbol fonts

参考：[Reference](https://github.com/IamDH4/ttf-wps-fonts)

```
cd /tmp

git clone https://github.com/iamdh4/ttf-wps-fonts.git

cd ttf-wps-fonts

sudo bash install.sh

rm -rf /tmp/ttf-wps-fonts

```

## Others

### Ubuntu与主机共享文件

[百度经验](https://jingyan.baidu.com/article/2f9b480dd15f4241cb6cc2d8.html)

### 同时忘记用户密码和root密码

> 在设置密码的时候，用到了小键盘，重启后再次用小键盘输入密码时，发现输入的并不是数字，而是其他符号。所以在设置关键信息的时候，**小键盘还是得慎用**啊。

解决方案：

1. 在引导界面也就是开机倒计时的时候，按下“e”进入编辑模式
2. 倒数第二或者三行的样子，把`ro recovery*****`和他后面的内容改成`rw single init=/bin/bash`
3. 按下F10，重启，进入到单用户模式
4. 用passwd命令更改密码。默认是root，后面加用户名就是改那个用户的密码

### Xshell远程连接Ubuntu

- [物理机和虚拟机互相可以ping通，xshell无法连接](https://blog.csdn.net/u010176014/article/details/51930877)
- [ssh服务器拒绝了密码，请再试一次](https://blog.csdn.net/u013366098/article/details/50542517)

