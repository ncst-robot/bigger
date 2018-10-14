---
title: 基本数据类型占用的字节数
date: 2018-9-24 16:36:36
tags: 单片机
---
## 32位编译器|变量类型 | 所占字节数||---------|------------||char |1个字节 ||char*（即指针变量）|4个字节（32位的寻址空间是2^32, 即32个bit，也就是4个字节） ||short int |2个字节 ||int| 4个字节 ||unsigned int |4个字节 ||float|4个字节 ||double|8个字节 ||long|4个字节 ||long long|8个字节 ||unsigned long|4个字节|
## 64位编译器

|变量类型 | 所占字节数|
|---------|------------||char |1个字节 ||char*(即指针变量)|8个字节 ||short int |2个字节 ||int| 4个字节 ||unsigned int |4个字节 ||float|4个字节 ||double|8个字节 ||long|8个字节 ||long long|8个字节 ||unsigned long|8个字节
