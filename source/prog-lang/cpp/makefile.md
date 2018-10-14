---
title: makefile笔记
date: 2018-10-9 18:53:15
tags: C++
---

##  什么是makefile

makefile是一个linux操作系统中的一个**脚本**文件。用来解决**文件依赖性**，完成软件的自动化**编译**。

## 软件生成过程

makefile在软件生成过程中完成编译和链接，也就是下面的“**&raquo;**”。

源代码 &raquo; 中间文件 &raquo; 可执行文件

> 中间文件指的是：Windows下的`.obj`文件，Linux下的`.o`文件，即 Object File。
>
> 在实际项目中，会有较多的 Object File 。这对于编译很不方便，于是，就把中间文件打包，在Windows下这种包叫“库文件”（Library File)，也就是 .lib 文件，在UNIX下，是Archive File，也就是 .a 文件。

