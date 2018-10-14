---
title: Python常用功能
date: 2018-9-30 12:19:39
tags: 编程语言
---

## 查看安装路径

window下命令

```python
where python
```

linux下命令

```python
whereis python
```

查看pip安装了多少包

```python
pip list
```

查看pip安装的软件有哪些

```python
pip freeze
```

查看xx包的安装路径，再次执行命令

```python
pip install xx
```

如果电脑有两个python,一个python2，一个python3，使用上面的命令查看的是python3中pip安装的包。要查看python2pip安装的包，如下：

```python
python2 -m pip list 
```

同理要查看python3 的pip安装的包，则如下：

```python
python3 -m pip list
```

上面可能有的人会出现“python2/python3不是内部或外部命令也不是可运行程序”，那是因为没有自行设置环境变量导致的。所以要实现上面将python2和python3的pip分开的办法是先设置环境变量。

## 查看Python支持的.whl文件版本

**AMD64**

```
import pip._internal
print(pip._internal.pep425tags.get_supported())
```

**WIN32**

```
import pip
print(pip.pep425tags.get_supported())
```

![Python](pywhl.png)

## 数据操作

- [列表操作](https://www.cnblogs.com/wangtao1993/p/6400107.html)
- [保存matrix或者保存ndarray](https://blog.csdn.net/hhtnan/article/details/79629147)
- [数据类型转换](https://www.cnblogs.com/mywood/p/7428138.html)
- [读取CSV某列](https://blog.csdn.net/test_soy/article/details/79718458)
- [numpy数组写入到csv](https://blog.csdn.net/qq_26479655/article/details/72858403)
- [pandas to_csv 最左边 多一列 的问题](https://blog.csdn.net/guotong1988/article/details/80513879)
- [DataFrame对象操作](https://blog.csdn.net/u014281392/article/details/75331570)

## import搜索路径

1. 在当前目录下搜索该模块
2. 在环境变量 PYTHONPATH 中指定的路径列表中依次搜索
3. 在 Python 安装路径的 lib 库中搜索

### 查看当前的搜索路径

```python
import sys
print(sys.path)
```

### 临时添加搜索路径

```python
sys.path.append() # 方式1
sys.path.insert() # 方式2
export PYTHONPATH = $PYTHONPATH:/home/ershisui # 方式3
```

### 永久添加搜索路径

1. 添加系统环境变量`PYTHONPATH`
2. 变量值是要搜索的路径

![搜索路径](sousuo.png)

### 查看效果

![效果](pathxiaoguo.png)

> [查看更多详细 &raquo;](https://docs.python.org/3/install/index.html#modifying-python-s-search-path)

