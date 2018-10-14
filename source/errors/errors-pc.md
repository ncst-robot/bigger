---
title: 解惑 PC/笔记本
date: 2018-8-22 10:31:31
tag: 故障解决
---

## 文件无法重命名 

适用版本：Win10 Lenovo ideapad 310s

- 方法一：禁用所有开机启动项，重启
- 方法二：进入[安全模式](http://www.dwz.cn/250j5Z)测试
- 方法三：[新建一个账户](http://t.lenovo.cn/HVDVbe9W)

## 百度搜索技巧

[百度搜索高级技巧](https://jingyan.baidu.com/article/d621e8dae7593c2864913f7b.html)

## 浏览器默认主页篡改

[原因和解决方法](https://www.zhihu.com/question/21883209)

## 网页报错

[You don't have permission to access / on this server.](https://www.zzidc.com/help/helpDetail?id=527)

## 文件/文件夹无法删除或删除后重新出现

出现这种情况的原因：

1. 文件夹在FAT（文件分区表）中的数据已经被锁定，不能够移动到回收站，导致页面一旦刷新就会重新出现该文件夹。可以尝试使用专用软件进行数据清除。
2. 文件夹受到某些[软件保护](https://www.baidu.com/s?wd=%E8%BD%AF%E4%BB%B6%E4%BF%9D%E6%8A%A4&tn=SE_PcZhidaonwhc_ngpagmjz&rsv_dl=gh_pc_zhidao)，删除之后会自动重新建立。此时可以使用一些安全软件进行文件夹粉碎，并勾选“禁止该文件（夹）恢复”功能。

另外，如果原因是打开某个软件后，这个软件才重新出现：

- 缓存路径设置的是这个文件夹，所以每次开启都会重新创建
- 解决这个问题，只需要将路径修改一下就可以了

![例图](05.jpg) 

## 进入BIOS的步骤

1. 查看自己的BIOS版本

   ```
   $ systeminfo
   ```

2. 对号入座，[电脑进入BIOS的两种实用方法](http://www.tudoupe.com/help/szjc/20153117.html)

