---
title: 配置WAMP
date: 2018-8-21 15:09:11
tags: 工具使用说明
---

## 软件介绍

Wamp Server 是一款功能强大的PHP 集成安装环境。

为了节约时间，本次使用  Wamp Server 来进行配置。 wamp 的全部含义就是本篇文章的标题。

## 使用版本和操作系统

Wamp Server v3.0.6 -64bit

Apache: 2.4.23（Win64）

PHP: 5.6.25

MySQL: 5.7.14

Windows10 家庭中文版

## 基础配置

1. 无脑下一步
2. 完成

## 扩展功能

### 更改根目录(项目存放地址)

#### 第一种方案

**配置结果**

- 失败

**操作步骤**

1. 打开 Apache >> httpd.conf，找到 DocumentRoot，修改路径为存放项目的路径

   ```
   #DocumentRoot "${INSTALL_DIR}/www"
   DocumentRoot "F:/Coding/phpProject"
   #<Directory "${INSTALL_DIR}/www/">
   <Directory "F:/Coding/phpProject/">
   ```

2. 修改 wamp安装目录下 scripts >> config.ini.php

   ```
   //$wwwDir = $c_installDir.'/www';
   $wwwDir = 'F:/Coding/phpProject';
   ```

#### 第二种方案

将第一种方案修改的复原，进行下面的修改

**配置结果**

- 成功

**操作步骤**

1. 单击wamp图标 >> Apache >> httpd-vhosts.conf

   ```
   #	DocumentRoot E:/wamp64/www
   	DocumentRoot F:/Coding/phpProject
   #	<Directory  "E:/wamp64/www/">
   	<Directory  "F:/Coding/phpProject/">
   ```

2. 重新启动服务

### 修改 www directory

1. 修改 wamp 安装目录下 wampmanager.ini 和 wampmanager.tpl

   ```
   ;Type: item; Caption: "www directory"; Action: shellexecute; FileName: "E:/wamp64/www"; Glyph: 2
   Type: item; Caption: "www directory"; Action: shellexecute; FileName: "F:/Coding/phpProject"; Glyph: 2
   ```

   ```
   ;Type: item; Caption: "${w_wwwDirectory}"; Action: shellexecute; FileName: "${wwwDir}"; Glyph: 2
   Type: item; Caption: "${w_wwwDirectory}"; Action: shellexecute; FileName: "F:/Coding/phpProject"; Glyph: 2
   ```

2. 重启服务***不起作用***，一定要退出软件重新打开

## 经验总结