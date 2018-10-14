---
title: 配置VIM (Windows)
date: 2018-8-21 15:09:38
tags: 工具使用说明
---

## 软件介绍

Vim作为一个好用的编辑器,可以实现很多功能.如果配置的比较好,可以作为一个IDE来作为开发轻量级的开发工具,但是功能上绝对不失其他的几十G的大型IDE.

## 使用版本和操作系统

* 操作系统: Windows 10 家庭中文版
* python 2.7.15 \(32位\)
* VIM - Vi IMproved 8.0 \(MS-Windows 32位控制版本\)
* cmake 3.10.3
* [Windows 8.1 SDK](https://go.microsoft.com/fwlink/p/?LinkId=323507)

## 基础配置

## 扩展功能

### 智能补全: YCM

1. 准备软件:[MSBuild](#) \(需要对 MSBuild.exe 添加环境变量\)

2. cmd

3. git clone[https://github.com/Valloric/YouCompleteMe.git](https://github.com/Valloric/YouCompleteMe.git)

4. cd YouCompeleteMe

5. python install.py

   如果出现提示,输入提示的命令

   git submodule update --init --recursive

##### 配置结果

* 失败

## 经验总结

* 由于不熟悉操作流程,在这个简单的配置上面花费了两天的时间都没有搞定.

* 对于新鲜事物,如果想要批量的完成,首先需要明白它的工作原理.然后才能有自己的思考能力,不至于每次出现问题都去百度,但是却搜索不到自己想要的答案.



