# 配置HEXO

## 软件介绍 

Hexo 是一个快速、简洁且高效的博客框架。Hexo 使用 [Markdown](http://daringfireball.net/projects/markdown/)（或其他渲染引擎）解析文章，在几秒内，即可利用靓丽的主题生成静态网页。 

## 使用版本和操作系统

* [官网](https://hexo.io/)最新版
* Windows 10 家庭中文版

## 基础配置

1. 进入到要存放代码的根目录，在资源管理器中打开 cmd
2. 运行 `npm install -g hexo-cli `
3. 环境配置完成
4. 生成网页并提交到博客地址 `hexo g && hexo d`
5. 全部完成

## 扩展功能

### 更换主题

1. 打开根目录下 _config.yml 文件，找到 theme
2. 修改自己想要的[主题名称](https://hexo.io/themes/)
3. 到 GitHub 下载相应的主题，并保存【github 会有安装步骤】
4. hexo s [本地预览](http://127.0.0.1:4000/)

### [更换Next主题和优化](https://blog.csdn.net/blue_zy/article/details/79058763)

### 添加多个标签

```
tags: [tag1,tag2,...]
```

