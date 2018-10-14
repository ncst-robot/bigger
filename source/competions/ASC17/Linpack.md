---
title: 安装LinPack
date: 2018-8-21 15:14:26
tags: 学科竞赛
---

## 准备工作

* **Linux** **平台**，最新稳定内核的Linux 发行版最佳，可以选择 Red hat, Centos 等。
* **MPICH2**，这是并行计算的软件
* **Gotoblas**， BLAS库(Basic Linear Algebra Subprograms)是执行向量和矩阵运算的子程序集合，这里我们选择公认性能最好的 Gotoblas
* **HPL**，LinPack 测试的软件

## 安装 MPICH2

1. [下载](http://www.mpich.org/downloads/) MPICH2安装包

2. 解压安装包 

   ```
   tar xzvf mpich-x.x.x.tgz
   ```

3. 配置编译环境，并选择安装路径。

   ```
   cd mpich-x.x.x
   ./configure --prefix=/usr/local/mpich-x.x.x
   ```

   *注意：这里选择安装路径为 /usr/local/mipch-x.x.x。如果提示缺少编译器，则按照要求安装即可*

4. 安装软件

   ```
   make
   make install
   ```

5. 安装 OK !

### 配置环境变量   

1. 打开 **/etc/profile**，在文件倒数第三行输入

   ```
   PATH=$PATH:/usr/local/mpich-x.x.x/bin
   MANPATH=$MANPATH:/usr/local/mpich-x.x.x/man
   export PATH MANPATH
   ```

2. 应用设置

   ```
   source /etc/profile
   ```

### 测试MPICH

1. 切换到 MPICH 安装目录下的 examples 文件夹

2. 编译测试

   ```
   mpicc hellow.c -o hellow
   ```

3. 运行测试

   ```
   mpirun -np N  ./hellow
   ```

   *说明：这里的 N 改成一个常数，表示你要用来运行这个并行程序的节点。当然，如果不是在集群环境上，你一个 CPU 就一个节点，进程数也就是一个最多，本地机子默认的编号就是 0。你 N 的不同无异于就是把程序跑N遍而已。*		

**[补充说明]**节点之间传递消息，一般要先认证身份，每次传递都要认证身份比较麻烦。所以，可以搞一个“通行证”一样的东西，使得传递消息变得更加便捷。
示例命令行代码如下：

```
ssh-keygen -t dsa
cp id˙dsa.pub authorized˙keys
chmod go-rwx authorized˙keys
ssh-agent  $SHELL
ssh-add
```

**如何理解并行计算的计算流程呢？**

我是这样想的。按并行的方式写一段并行的程序，然后在集群环境里主机上运行apirun的时候指定需要的进程数。接着，计算机在集群环境下尽可能找到对应的节点，分配进程任务并给他们编号。此后，将程序拷贝一份给每一个节点，每个节点在这个共同的工作中都担任着一份角色。接着，他们就按程序中设计的方式，各自运行着由自己编号决定的自己的那一段代码，相互之间进行通讯，最后共同完成这项任务。那么，不同节点程序进行有早晚，如何保证协调一致有序进行呢？比如说，你可以等呀，可以找个地方先寄存一下你给别人的消息之类的。这就涉及到了MPI通讯的阻塞型和非阻塞型通讯模式。

## 安装 Gotoblas   

1. [下载](https://www.tacc.utexas.edu/documents/1084364/1087496/GotoBLAS2-1.13.tar.gz/b58aeb8c-9d8d-4ec2-b5f1-5a5843b4d47b) Gotoblas

2. 解压到 /root/linpack 文件夹

   ```
   tar xvf GotoBLAS-*.tar.gz
   mv GotoBLAS-* ~/linpack/Gotoblas
   ```

3.  切换到 Gotoblas 文件夹

4. 安装 Gotoblas

   ```
   ./quickbuild.64bit (如果是32位系统，运行./quickbuild.31bit)
   ```

5. 安装成功后，在本目录下就会生成 *libgoto2.a* 和 *libgoto2.so* 两个文件。

*若出现错误：../kernel/x86_64/gemm_ncopy_4.S:192: Error: undefined symbol`RPREFETCHSIZE' in operation  或者类似的：leaving directory  ...GotoBLAS2/kernel* 需要运行以下命令：

```
gmake clean
make BINARY=64 TARGET=NEHALEM
```

*出现以上错误的原因为：cpu 太新，配置文件不识别，需要重新指定一下CPU类型。*

安装完成后会有版本信息：

> GotoBLAS build complete.
>
> OS               ... Linux
> 	
> Architecture     ... x86
> 	
> BINARY           ... 32bit
> 	
> C compiler       ... GCC  (command line : gcc)
> 	
> Fortran compiler ... GFORTRAN  (command line : gfortran)
> 	
> Library Name     ... libgoto2_nehalemp-r-r1.13.a (Multi threaded; Max num-threads is 2)

## 安装 HPL

1. [下载](http://www.netlib.org/benchmark/hpl/hpl-2.0.tar.gz) HPL

2. 解压到 /root/linpack 文件夹

   ```
   tar xvf hpl-*.tar.gz
   mv hpl-* ~/linpack/hpl
   ```

3. 在 hpl-2.2 安装路径下的 **setup** 文件夹下提取与自己平台相近的 **Make.arch** 文件，复制到 hpl-2.2 文件夹内，比如我们的平台为 Intel xeon ，所以就选择了 Make.Linux_PII_FBLAS，它代表 Linux 操作系统、PII平台、采用 FBLAS库。

4. 复制文件

   ```
   cp hpl-2.2/setup/Make.Linux_ATHLON_FBLAS  ../Make.test
   ```

5. 编辑刚刚复制的文件，根据说明修改各个选项，使之符合自己的系统，比如我们系统的详细情况为，Intel xeon 平台，MPICH2 安装目录为 */usr/local/mipch2* ， hpl 和 Gotoblas安装目录为 */root/linpack*，下面是我们的配置文件Make.Linux_xeon，对需要修改的部分我们做了注解，可以参考修改，**一定不要照抄**，否则会出现错误：

***注解：***

如果选用 atlas 数学库，则用 **libatlas.a** 和 **libblas.a** 库文件。
如果是在 AMD CPU 上，则用 **arch=Linux_ATHLON_CBLAS**

主要修改如下：

```
  vi /###/hpl-2.0/Makefile

  #修改arch与Make.test的ARCH相同

  TOPdir       = /###/hpl/hpl-2.0

  #修改为拷贝后的Make. Linux_ATHLON_CBLAS文件所在位置，即hpc-2.0根目录。

  MPdir        = /###/mpich-3.2.1

  MPinc        = -I$(MPdir)/include

  MPlib        = $(MPdir)/lib##/libmpich.a

  #修改为mpi路径、库路径、头文件路径。

  LAdir        = /###/GotoBLAS2

  LAlib        = (LAdir)/lib/libcblas.a (LAdir)/lib/libatlas.a

  或者LAlib        = (LAdir)/lib/libgoto2.a (LAdir)/lib/libgoto2.so

  #修改为atlas的库路径及库文件路径。

  CC           = /###/mpich-3.2.1/bin/mpicc

  LINKER       = /###/mpich-3.2.1/bin/mpicc

  #修改位mpi的执行路径，如果LINKER是f77，则用mpif77。

  修改后保存

  $make arch= Linux_ATHLON_CBLAS

  完成后在bin目录的Linux_ATHLON_CBLAS下面将产生测试文件HPL.dat和xhpl

  在lib目录的Linux_ATHLON_CBLAS下面将产生库文件libhpl
```

### 运行小测试

   `cd` 到 hpl 的 **bin/test** 目录下

```
mpirun –np 4 ./xhpl
```

