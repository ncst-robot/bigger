---
title: Git 简易指南
date: 2018-9-8 13:25:26
tags: 工具使用说明
---

本文参考 [git-简易指南](http://www.bootcss.com/p/git-guide) 编写

#### 上传本地代码到gitHub仓库

* 第一步：建立git仓库

  ```
  cd到你的本地项目根目录下，执行git命令
  git init
  ```

* 第二步：将项目的所有文件添加到仓库中

  ```
  git add .
  如果想添加某个特定的文件，只需把.换成特定的文件名即可
  ```

* 第三步：将add的文件commit到仓库

  ```
  git commit -m "注释语句"
  ```

* 第四步：去github上创建自己的Repository，点击下面的Create repository，拿到创建的仓库的https地址

* 第五步：重点来了，将本地的仓库关联到github上

  ```
  git remote add origin github仓库地址
  ```

* 第六步：上传github之前，要先pull一下，执行如下命令：

  ```
  git pull origin master
  ```

  _错误提示 : fatal: refusing to merge unrelated histories_

  ```
  解决：在进行git pull 时，添加一个可选项（在更高版本的保护机制）
  git pull origin master --allow-unrelated-histories
  ```

* 第七步，也就是最后一步，上传代码到github远程仓库

  ```
  git push -u origin master
  ```

  _执行完后，如果没有异常，等待执行完就上传成功了，中间可能会让你输入Username和Password，你只要输入github的账号和密码就行了_

#### 从本地删除远程仓库下的文件

* 从索引和工作目录中删除文件

  ```
  git rm -r filename
  ```

- 删除索引中的文件并把它保留在工作目录中

  ```
  git rm--cached filename
  ```

* 删除文件后的恢复

  ```
  git checkout HEAD -- filename
  ```

#### 文件重命名

将 a.txt 重命名为 c.txt

```
git mv a.txt c.txt
```

#### 克隆仓库下的某子文件夹

参考CSDN博客[周大侠啊](https://blog.csdn.net/qq_36560161/article/details/78260532)
