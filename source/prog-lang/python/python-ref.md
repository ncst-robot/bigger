---
title: Python参考
date: 2018-9-2 22:17:41
tags: [编程语言,人工智能]
---

## Python常用镜像源

- 官方：`https://pypi.python.org/pypi`
- 豆瓣：`https://pypi.doubanio.com/simple/`
- 阿里：`http://mirrors.aliyun.com/pypi/simple/`
- 中科大：`https://mirrors.ustc.edu.cn/pypi/web/simple/`
- 清华：`https://pypi.tuna.tsinghua.edu.cn/simple/`
- 其他镜像站：[前往>>](https://blog.csdn.net/u011433858/article/details/80398947)

### 使用方法

1. 仅本次使用国内镜像源

```
pip install pythonModuleName -i https://pypi.douban.com/simple
```

2. 配置成默认的

在你的“C:\Users\你的用户名\”目录下创建“pip”目录，“pip”目录下创建“pip.ini”文件（**注意：以UTF-8 无BOM格式编码**）； “pip.ini”文件内容：

```
[global]
index-url=http://mirrors.aliyun.com/pypi/simple/
[install]
trusted-host=mirrors.aliyun.com
```

注意：trusted-host 选项为了避免麻烦是必须的，否则使用的时候会提示不受信任，或者添加“--trusted-host=mirrors.aliyun.com”选项；

**注意：有网页提示需要创建或修改配置文件（linux的文件在~/.pip/pip.conf，windows在%HOMEPATH%\pip\pip.ini），至少Windows7下“%HOMEPATH%\pip\pip.ini”这个目录是不起作用的。**

## 查找开源库

> [官网](https://pypi.org/)

## 教程

- [笨办法学Python](https://wizardforcel.gitbooks.io/lpthw/content/58.html)
- [Python编程时光](https://mings-blog.readthedocs.io/zh_CN/latest/index.html)
- [Python官方文档](https://docs.python.org/3.6/contents.html)
- [NDArray API](https://mxnet.incubator.apache.org/api/python/ndarray/ndarray.html)
