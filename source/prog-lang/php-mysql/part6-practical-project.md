---
title: 网站建设之项目实战
date: 2018-8-21 15:23:11
tags: [编程语言,网站建设]
---

下载书籍 [[download](https://pan.baidu.com/s/1MrBCS-fpLmSs57swjW3JGA) PDF]

## 在大型项目中使用 PHP 和 MySQL

* 在 Web 开发中应用软件工程
* 规划和运行 Web 应用程序项目
* 重用代码
* 编写可维护代码
* 实现版本控制
* 选择一个开发环境
* 项目的文档化
* 建立原型
* 分离逻辑、内容和外观：PHP、HTML和CSS
* 优化代码

### 在 Web 开发中应用软件工程

我们都知道，软件工程是软件开发过程中系统化的、可以量化的开发方法。也就是说，它是工程原则在软件开发中的应用。

### 规划和运行 Web 应用程序项目

基本步骤：

* 明确目标用户
* 明确应用程序分成几个部分，它们之间相互协调
* 查看哪些功能模块已经存在，不要重复造轮子
* 明确工作进程，其包括
  * 代码编写标准
  * 目录结构
  * 版本控制管理
  * 开发环境
  * 文档化级别和标准
  * 小组成员的任务分配
* 构建一个原型，展示给用户，并反复修改和展示
* 内容和逻辑分离
* 系统优化
* 边开发边测试

### 重用代码

开发之前要看看哪些组件和函数可以从别的地方获取。不要重复造轮子。

PHP 的一个优点是它有大量的内置的函数库。查找函数的一个好方法是按照函数组分类的手册。

应当避免多种编程语言参杂，有些程序员编写的封装函数用的是别的语言，这样，程序的可维护性会降低，而且程序的执行效率也会降低。

如果发现所需的功能在PHP主函数库里没有提供，那么有两个选择。如果需要的功能非常简单，可以选择自己编写该函数或对象。然而，如果需要创建一个相当复杂的功能——例如购物车、Web邮件系统或Web论坛——我们会发现这些东西别人已经做好了。在开放源代码社区工作的一个动力就是像这些应用程序组件的代码经常是免费的。如果发现某个组件与需要构建的相似甚至相同，那么就可将这些源代码作为基础，在此基础上修改或创建自己的组件。

### 编写可维护代码

* 编码标准

大多数IT组织都制定了编码标准——选择文件名、变量名以形成内部编码准则、注释代码的准则、代码缩进的准则等。

* 对代码的注释

文件，无论是完整的脚本还是包含文件——每个文件应该有一个注释，说明该文件的名称、功能、作者和更新日期。

函数——函数的注释应指明函数的功能，输入参数和返回值。

类——注释应描述类的用途。类方法应该具有与函数描述相同的注释。

脚本或函数里面的一大段代码——在脚本之前添加一段伪码样式的注释然后再编写代码是很好的。因此，初始化脚本可能是这样：

```php
<?php

    // validate input data

    // send to database

    // report results

?>

```

复杂的代码——当整天围绕某件事，或者花费了很长时间来解决这个问题时，应该编写一段注释解释那样做的原因。这样，当下次看到这段代码时，就不会皱着眉头想，“究竟我为什么会那样做呢？”

* 代码缩进

缩进深度要明显，但是不能太大。应当避免使用 TAB 键，虽然方便，但是占用太多空间，而且不同的编辑器 TAB 键缩进不同。一般缩进 2~3 个空格。

* 分解代码

将功能相似函数放到一个文件中，例如，可以将所有与数据库相关的函数放到一个名为 dbfunctions.php 文件中。易读，提高源代码的重用性，方便维护和团队工作。

* 使用标准的目录结构
* 文档化和共享内部函数

### 实现版本控制

* [BitKeeper](https://www.bitkeeper.org/index.html)
* [PERFORCE](https://www.perforce.com/)
* [GitHub](https://github.com/)

### 选择一个开发环境

### 项目的文档化

* 设计文档
* 技术文档/开发指南
* 数据词典（包含类文档）
* 用户指南（尽管大多数 Web 应用程序是自我解释的）

自动生成文档：

* [phpdoc](http://www.phpdoc.de/)
* [phpDocumentor](https://phpdoc.org/)

### 建立原型

一个原型是对于获得用户需求很有意义的工具。通常，原型是应用程序的简化的一部分工作版本，可以用来与客户进行讨论，并作为最终系统的基础。对原型的多次反复讨论将最终产生应用程序。

### 将逻辑和内容分离

基本方法：

* 用包含文件保存不同部分的内容
* 用一个函数或者带有一组成员函数的类 API 将动态内容插入到静态网页模版中。
* 使用模板系统。常用 [Smarty](https://www.smarty.net/)

### 优化代码

优化数据库，减少用户等待时间：

* 减少数据库连接。通常，这是最慢的部分
* 加速数据库查询。通常的原则是尽可能减少连接，增加索引。
* 使 PHP 中生成的静态内容减少到最少。
* 尽可能使用字符串函数代替正则表达式

使用 Zend 产品：http://www.zend.com

### 测试

* 代码审查。另一位编程人员来检查
  * 可能忽略的错误
  * 原程序设计者没有想到的测试用例
  * 代码优化
  * 安全性的提高
  * 可以使用已有组件改进某一段代码
  * 附加功能
* 让最终用户作为测试人员

## 调试

* 编程语法，运行时以及逻辑错误
* 出错信息
* 错误级别
* 出发自定义错误
* 巧妙地处理错误

### 编程错误

错误类型：

1. 语法错误
2. 运行时错误
3. 逻辑错误

### 使用变量帮助调试

下面的程序将打印出页面包含的变量，有助于调试。

```php
<?php

//these lines format the output as HTML comments
//and call dump_array repeatedly
echo"\n<!--BEGIN VARIABLE DUMP-->\n\n";
echo"<!--BEGIN GET VARS-->\n";
echo"<!--".dump_array($_GET)."-->\n";
echo"<!--BEGIN POST VARS-->\n";
echo"<!--".dump_array($_POST)."-->\n";
echo"<!--BEGIN SESSION VARS-->\n";
echo"<!--".dump_array($_SESSION)."-->\n";
echo"<!--BEGIN COOKIE VARS-->\n";
echo"<!--".dump_array($_COOKIE)."-->\n";
echo"\n<!--END VARIABLE DUMP-->\n";

//dump_array() takes one array as a parameter
//It iterates through that array,creating a single
//line string to represent the array as a set
function dump_array($array){
	if(is_array($array)){
    $size=count($array);
		$string="";
    if($size){
      $count=0;
      $string.="{";

      //add each element's key and value to the string
      foreach($array as$var=>$value){
        $string.=$var."=".$value;
        if($count++<($size-1)){
          $string.=",";
        }
      }
      $string.="}";
    }
    return $string;
	}
  else{
	//if it is not an array,just return it
	return $array;
  }
}
?>
```

### 错误报告级别

设置错误报告显示级别：[error_reporting()](http://php.net/manual/zh/function.error-reporting.php)

### 改变错误报告设置

默认情况下，要改变所有脚本的错误报告，可以修改 php.ini 文件里面的下面 4 行。

```
error_reporting=E_ALL&～E_NOTICE ;报告处通知外的所有错误
display_errors=On ;将错误显示到屏幕
log_errors=Off ;不将错误写入日志
track_errors=Off ;不跟踪错误
```

### 触发自定义错误

使用函数：`trigger_error()`

### 巧妙地处理错误

错误处理函数：`set_error_handler()`

详细可见：[set_error_handler](http://php.net/manual/zh/function.set-error-handler.php)

示例程序在上面的链接中可见。

## 建立用户身份验证机制和个性化设置

* 用户登录和验证用户
* 管理密码
* 记录用户的个人喜好
* 个性化内容
* 基于已有的用户信息为用户推荐他们可能感兴趣的内容

### 解决方案的组成

需求：

* 识别每个用户
* 保存单个用户的书签
* 根据对用户的了解，向用户建议他们可能感兴趣的站点

#### 用户识别和个性化设置

将登录名和密码保存在一个 MySQL 数据库中。

用户以用户名和密码登录，需要如下组件：

* 注册用户名和密码，需要限制其长度
* 注册过程中，用户可见他们提供的详细信息
* 能够退出
* 网站能够检测用户是否登录
* 用户可以修改密码，且不需要开发者帮助

以上的这些函数大多是可以重用的，或者从其他的项目中拿过来，稍加修改就可以重用。

#### 保存书签

需要实现的功能：

* 用户能够取回，浏览书签
* 增加新书签，检查URL是否有效
* 删除书签

####  推荐书签

寻找相似用户，提供保存的书签

### 解决方案概述

在纸上绘制草图，提出系统流程图

![bookmark工作流程](001.png)

建立函数库，其作用如下：

* 用户身份验证
* 书签保存与检索
* 数据验证
* 数据库连接
* 输出到浏览器

### 具体实现

* 代码可以在[这里](https://github.com/thethomason/git-book/tree/master/build-website/php-mysql-tutorial/code/Chapter27/)找到

文件说明：

| 文件名                 | 描述                                         |
| ---------------------- | -------------------------------------------- |
| bookmarks.sql          | 创建数据库的SQL语句                          |
| login.php              | 包含系统登录表单的页面                       |
| register_form.php      | 系统中用户注册表单                           |
| register_new.php       | 处理新注册信息的脚本                         |
| forgot_form.php        | 用户忘记密码后需要填写的表单                 |
| forgot_passwd.php      | 重新设置遗忘密码的脚本                       |
| member.php             | 用户的主页面，包含该用户所有的当前书签       |
| add_bm_form.php        | 添加书签的表单                               |
| add_bms.php            | 将书签真正添加到数据库中的脚本               |
| delete_bms.php         | 从用户的书签列表中删除选定书签的脚本         |
| recommend.php          | 基于用户以前的操作，推荐用户可能感兴趣的书签 |
| change_passwd_form.php | 用户修改密码时要填的表单                     |
| change_passwd.php      | 修改数据库中用户密码的表单                   |
| logout.php             | 将用户注销的脚本                             |
| bookmark_fns.php       | 应用程序包含的文件集合                       |
| data_valid_fns.php     | 确认用户输入数据有效的函数                   |
| db_fns.php             | 连接数据库的函数                             |
| user_auth_fns.php      | 用户身份验证的函数                           |
| url_fns.php            | 增加和删除书签的函数                         |
| output_fns.php         | 以HTML形式格式化输出的函数                   |

## 创建一个购物车

功能：

* 在线出售商品的数据库
* 一个在线产品目录，按商品种类分类
* 一个能记录用户打算购买商品的购物车
* 结账脚本，处理付款和运送细节
* 一个管理界面

实例：在线书店

### 解决方案的组成

需求：

* 我们需要找到一种将数据库连接到用户的浏览器的方法。用户能够按目录浏览商品。
* 用户应该能够从商品目录中选取商品以便此后购买。我们也要能够记录他们选中的物品。
* 当用户完成购买，要合计他们的订单，获取运送商品细节，并处理付款。
* 我们还应该为Book-O-Rama网站创建一个管理界面，以便管理员在上面添加、编辑图书和目录。

#### 创建一个在线目录

需要注意：

* 完成订单时，需要使用事务
* 要使用事务，需要将表格转换为 InnoDB 存储引擎

####  在用户购买商品时记录购买行为

方法：

* 将用户的选择存入数据库
* 使用会话变量

使用会话的好处是不用频繁的查询数据库，而且也避免了在结束的时候留下许多垃圾数据，这适用于那些只是浏览或不停地改变主意的用户。

因此，我们需要设计一个或一组会话变量来保存用户的选择。当用户完成购买并付款之后，将此信息送到数据库作为一个事务处理的记录。

我们还可以使用该数据给出一个当前购物车的摘要描述，将其显示在页面的某个位置，以便用户在任何时候都知道花费是多少。

#### 实现一个付款系统

系统将数据发送给银行，并返回成功代码或者任何一个错误代码类型。

需要记录的信息：客户的信息 -> 商业账户信息 -> 交易总金额

可以通过一个用户的购物车会话变量计算出订单的总量。将订单的最终信息记录到数据库，并在此时销毁会话变量。

#### 创建一个管理界面

功能：添加、删除和编辑数据库中的图书及目录

需要保存商品购买时的价格，而不是当前价格。

### 解决方案概述

用户视图：

![用户视图](002.png)

管理员视图：

![管理员视图](003.png)

**提示**　该应用程序的代码量非常大。其中要实现的许多功能我们都已经见过（特别是在上一章中），例如，将数据保存到数据库，从数据库中取回数据，授予用户管理权限。在这方面的代码，我们只简要地看一下，而将大部分时间花在购物车函数上。

### 具体实现

* 代码可以在[这里](https://github.com/thethomason/git-book/tree/master/build-website/php-mysql-tutorial/code/Chapter28/)找到

文件说明：

| 名称                     | 模块   | 描述                                           |
| ------------------------ | ------ | ---------------------------------------------- |
| index.php                | 目录   | 网站首页，显示系统中的图书目录                 |
| show_cat.php             | 目录   | 显示特定目录包含的所有图书                     |
| show_book.php            | 目录   | 显示特定图书的详细信息                         |
| show_cart.php            | 购物车 | 显示用户购物车的内容，也用来向购物车中添加图书 |
| checkout.php             | 购物车 | 向用户显示所有的订单细节，获取运送细节         |
| purchase.php             | 购物车 | 从用户获取付款细节                             |
| process.php              | 购物车 | 处理付款细节，将订单添加到数据库               |
| login.php                | 管理   | 允许管理员登录进行修改                         |
| logout.php               | 管理   | 管理员退出                                     |
| admin.php                | 管理   | 主菜单菜单                                     |
| change_password_form.php | 管理   | 允许管理员修改密码的表单                       |
| change_password.php      | 管理   | 修改管理员密码                                 |
| insert_category_form.php | 管理   | 允许管理员向数据库中添加一个目录的表格         |
| insert_category.php      | 管理   | 向数据库中插入新目录                           |
| insert_book_form.php     | 管理   | 管理员添加新书到系统的表单                     |
| insert_book.php          | 管理   | 将新书插入到数据库                             |
| edit_category_form.php   | 管理   | 管理员编辑目录的表单                           |
| edit_category.php        | 管理   | 更新数据库中的目录                             |
| edit_book_form.php       | 管理   | 管理员编辑图书信息的表单                       |
| edit_book.php            | 管理   | 更新数据库中的图书信息                         |
| delete_category.php      | 管理   | 从数据库中删除一个目录                         |
| delete_book.php          | 管理   | 从数据库中删除一本书                           |
| book_ac_fns.php          | 函数   | 该应用程序的包含文件集合                       |
| admin_fns.php            | 函数   | 管理脚本使用的函数集合                         |
| book_fns.php             | 函数   | 用以保存和获取图书数据的函数集合               |
| order_fns.php            | 函数   | 用以保存和获取订单数据的函数集合               |
| output_fns.php           | 函数   | 输出HTML的函数集合                             |
| data_valid_fns.php       | 函数   | 验证用户输入数据的函数集合                     |
| db_fns.php               | 函数   | 连接book_ac数据库的函数集合                    |
| user_auth_fns.php        | 函数   | 授权管理员用户的函数集合                       |
| book_sc.sql              | SQL    | 创建book_ac数据库的SQL                         |
| populate.sql             | SQL    | 插入样本数据到book_ac数据库中的SQL             |

## 创建一个基于 Web 的电子邮件服务系统

在这个项目中，我们将建立一个电子邮件客户端，Warm Mail，它允许用户：

* 连接到 POP3 或 IMAP 邮件服务器上的账户
* 阅读邮件
* 发送邮件
* 恢复邮件信息
* 转发邮件消息
* 从用户账户中删除邮件

### 解决方案的组成

接收和处理邮件的协议：POP3 和 IMAP。

其中：（通常情况下）

* POP3 ：从服务器下载或删除邮件而短时间连接网络
* IMAP ：可以使用户与邮件进行交互，而且邮件可以永久保存在远程服务器上

发送邮件的的协议：SMTP

使用函数`mail()`

虽然PHP对IMAP和POP3有着不错的支持，但它都是通过IMAP函数库所提供的功能来实现的。为了使用本章所提供的代码，需要安装IMAP库。可以通过查看phpinfo()函数的输出来判断是否已经安装该库。

即将使用的 IMAP 函数：

* imap_open()
* imap_close()
* imap_headers()
* imap_header()
* imap_fetchheader()
* imap_body()
* imap_delete()
* imap_expunge()

### 解决方案概述

功能展示：

![功能展示](004.png)

### 具体实现

* 代码可以在[这里](https://github.com/thethomason/git-book/tree/master/build-website/php-mysql-tutorial/code/Chapter29/)找到

文件说明：

| 文件名              | 类型     | 描述                                   |
| ------------------- | -------- | -------------------------------------- |
| index.php           | 应用程序 | 运行整个应用程序的主要脚本             |
| include_fns.php     | 函数     | 该应用程序包含文件的集合               |
| data_valid_fns.php  | 函数     | 使输入数据生效的函数集合               |
| db_fns.php          | 函数     | 连接到mail数据库的函数集合             |
| mail_fns.php        | 函数     | 打开邮箱、阅读邮件与邮件相关的函数集合 |
| output_fns.php      | 函数     | 输出HTML函数的集合                     |
| user_auth_fns.php   | 函数     | 验证用户函数的集合                     |
| create_database.sql | SQL      | 用来建立book_sc数据库和建立用户的SQL   |

## 创建一个邮件列表管理器

项目源代码 [[link](https://github.com/thethomason/git-book/tree/master/build-website/php-mysql-tutorial/code/Chapter31)]

下载书籍 [[download](https://github.com/thethomason/git-book/raw/master/build-website/php-mysql-tutorial/php%E5%92%8Cmysql%20web%E5%BC%80%E5%8F%91%EF%BC%88%E4%B8%AD%E6%96%87%E7%AC%AC%E5%9B%9B%E7%89%88%EF%BC%89.epub)]查看本章完整讲解

## 创建一个 Web 论坛

项目源代码 [[link](https://github.com/thethomason/git-book/tree/master/build-website/php-mysql-tutorial/code/Chapter32)]

下载书籍 [[download](https://github.com/thethomason/git-book/raw/master/build-website/php-mysql-tutorial/php%E5%92%8Cmysql%20web%E5%BC%80%E5%8F%91%EF%BC%88%E4%B8%AD%E6%96%87%E7%AC%AC%E5%9B%9B%E7%89%88%EF%BC%89.epub)]查看本章完整讲解

## 生成 PDF 格式的个性化文档

下载书籍 [[download](https://github.com/thethomason/git-book/raw/master/build-website/php-mysql-tutorial/php%E5%92%8Cmysql%20web%E5%BC%80%E5%8F%91%EF%BC%88%E4%B8%AD%E6%96%87%E7%AC%AC%E5%9B%9B%E7%89%88%EF%BC%89.epub)]查看本章完整讲解

## 使用 XML 和 SOAP 来连接 Web 服务

* 理解 XML 和 Web 服务的基本知识
* 使用 XML 与 Amazon 进行交互
* 使用 PHP 的 SimpleXML 库解析 XML
* 缓存响应
* 使用 NuSOAP 与 Amazon 进行交互

### 项目概述：使用 XML 和 Web 服务

目标：

1. 理解什么是 XML 和 SOAP 并且掌握如何在 PHP 中使用它们
2. 使用这两种技术与外界进行通信

与其他站点进行交互的两种方式：

1. 使用基于 HTTP 的 XML，也就是表示状态转换（REST）
2. 使用 SOAP

#### 理解 XML

XML 和 HTML 的不同：

* 在 XML 中，所有开始的标记都必须有一个对应的结束标记。这条规则的例外是空元素。
* XML 可以在文档中设置自己的标记
* 可以通过编写一个 DTD（文档类型定义）或XML 模式来规范化 XML 文档结构。可以将 DTD 或模式看作是一个类声明，而 XML 文档则是类的实例。

#### 理解 Web 服务

Web 服务是通过 Internet 可供使用的应用程序接口。我们可以将 Web 服务看作是一个通过 Web 开放了其公有方法的类。

在这种远程函数调用方法中，还涉及了一些核心协议。最重要的两个协议是 SOAP 和 WSDL。

1. SOAP

SOAP 是一个以请求和响应为驱动的消息传递协议，它允许客户端调用 Web 服务，服务器对客户端的调用进行响应。

每一个 SOAP 消息，无论是请求的还是响应的，都是一个简单的 XML 文档。

2. WSDL

WSDL 是 Web 服务描述性语言的缩写（发音：wiz-dul）。这个协议是用来描述特定 Web 站点上可供使用的接口的。

### 解决方案的组成

实例要求：在自己的站点上显示 Amazon 的商品信息，然后让用户在本站下单，订单的处理由 Amazon 完成。

我门只需要提供一个基本的购物车，这样就可以记录客户想要购买哪些产品，并且在用户结账时将这些产品报告给 Amazon。

#### 使用 Amazon 的 Web 服务接口

参考文档：https://forums.aws.amazon.com/index.jspa

在注册开发人员令牌时，需要注意协议的几个条件：

* 作为客户端，每秒钟不能发出多个请求
* 必须缓存来自 Amazon 的数据
* 可以 24 小时缓存大多数数据，而一些稳定属性可以缓存至 3 个月
* 如果缓存价格或库存信息超过 1 个小时，必须提供一些声明
* 必须将本地所拥有的所有 Amazon 数据链接到 Amazon 站点的页面，严禁将从 Amazon 下载的文本或图形链接至其他商业网站

#### XML 的解析：REST 响应

Amazon为其Web服务提供的第一个最受欢迎的接口是通过REST实现的。这个接口可以接受一个普通的HTTP请求并且返回一个XML文档。要使用这个接口，需要解析Amazon返回给我们的XML响应。可以通过PHP的SimpleXML库来实现XML的解析。

#### 在 PHP 中使用 SOAP

另一种可以提供相同Web服务的接口是SOAP。要使用SOAP访问这些服务，我们需要使用许多不同的PHP SOAP库中的其中之一。PHP内置有SOAP库，但是由于该库并不是一直可用的，因此可以使用NuSOAP库。由于NuSOAP是用PHP编写的，它并不需要进行编译。它只是一个可以通过require_once()进行调用的文件。

下载 [NuSOAP](https://sourceforge.net/projects/nusoap/)

NuSOAP 的 [GitHub](https://github.com/econea/nusoap) 源代码

#### 缓存

正如我们前面提到的，亚马逊对开发人员提出的条件和约束之一就是必须缓存通过Web服务下载的数据。在我们的解决方案中，仍然需要找到一个保存和重复使用所下载数据的方法，当然必须在这些数据失效之前。

### 解决方案概述

本项目只是几个简单的购物车页面，所以没有结构图。

### 具体实现

* 代码可以在[这里](https://github.com/thethomason/git-book/tree/master/build-website/php-mysql-tutorial/code/Chapter33/)找到

文件说明：

| 文件名称                 | 类型     | 描述                                         |
| ------------------------ | -------- | -------------------------------------------- |
| index.php                | 应用程序 | 主要应用程序文件                             |
| about.php                | 应用程序 | 显示“关于”页面                               |
| constants.php            | 包含文件 | 设置一些全局变量                             |
| topbar.php               | 包含文件 | 生成每一个页面和CSS之间的信息栏              |
| bottom.php               | 包含文件 | 生成每一个页面的注脚                         |
| AmazonResultSet.php      | 类文件   | 包含保存每一个Amazon查询结果的PHP类          |
| Product.php              | 类文件   | 包含保存特定图书信息的PHP类                  |
| bookdisplayfunctions.php | 函数     | 包含用来显示图书信息和图书列表的函数         |
| cachefunctions.php       | 函数     | 包含执行Amazon所需的缓存操作相关的函数       |
| cartfunctions.php        | 函数     | 包含与购物车相关的函数                       |
| categoryfunctions.php    | 函数     | 包含用来检索和显示一个目录的函数             |
| utilityfunctions.php     | 函数     | 包含在整个应用程序中要使用到的工具函数的集合 |

### 安装项目代码

步骤：

- 创建一个缓存目录
- 设置这个缓存目录的读写权限，这样脚本就可以对其进行写操作
- 编辑constants.php代码，使其提供缓存的位置
- 注册一个Amazon开发人员令牌
- 编辑constants.php代码，使其包括开发人员令牌，此外，还可以选择是否包括会员ID
- 确认已经安装了NuSOAP。我们将其安装在Tahuayo目录下，但是也可以将其安装在不同位置，并对其进行修改
- 检查PHP5是否在带有XML支持的条件下进行编译的

### 扩展这个项目

参考Amazon的Web服务资源中心提供的应用。

### 进一步学习

- http://www.w3.org/XML/Core/
- web服务：http://www.w3.org/2002/ws/

## 使用 Ajax 构建 Web 2.0 应用

* 整合脚本和置标语言创建 Ajax 应用
* 一个 Ajax 应用的基本组成部分，包括发送请求以及解析来自服务器的响应
* 如何修改前面章节介绍应用的元素来创建支持 Ajax 的页面
* 代码库以及如何需求帮助信息

### Ajax 是什么

通常，Ajax 编程是将处理 XML 格式数据传输的客户端 JavaScript 编程与某种服务器端编程语言（eg：PHP）的结合。此外，XHTML 和 CSS 也被用来展示支持 Ajax 的元素。

典型的，Ajax 编程的结果是为一个交互式应用提供更加清晰和快捷的用户接口——例如，连接到 Facebook，Flicker 以及其他社交网站的接口。

* HTTP请求和响应

* DHTML 和 XHTML

  > DHTML 也叫 HTML。当使用 JavaScript 请求页面的时候，所有的数据都是从服务上获取的。如果使用 Ajax ，只有预留区域会从服务器中获取，而其他部分保持不变。
  >
  > XHTML ：可扩展的超文本置标语言。通过设备（Web 浏览器，手机等）来显示标记的内容，并且支持集成 CSS 来提供显示的额外控制。
  >
  > XHTML 和 HTML 的不同之处在于 XHTML 遵循 XML 的语法，以及除了标准的 Web 浏览工具外，XHTML 还可以被 XML 工具来解析。
  >
  > XHTML 的元素和属性都是小写字母，所有的元素必须显式封闭。

* CSS

* 客户端编程

  > 客户端编程是指从 Web 服务器中获取所有的程序函数，等待客户端的调用。
  >
  > 常用的客户端编程语言是 JavaScript，也就是 Ajax 中的字母 “J”

* 服务器端编程

  > 服务器端编程是指 Web 服务器给出响应之前做的处理脚本。
  >
  > 服务器端语言可以是：Perl，JSP，ASP，PHP

* XML 和 XSLT

  > XML 就是 Ajax 中的字母 “x”，它主要用于交换数据；XSLT 用来操作数据。数据本身将通过所创建的 Ajax 应用发送或获取。

### Ajax 基础

本节将使用 Ajax 的组成部分创建一个可用的示例程序。

> 请记住：使用 Ajax 的一个主要原因：创建一个能够相应用户动作的交互式网站，而这些响应并不需要刷新整个页面。
>

要实现此功能，Ajax 应用需要包括一个能够处理发生在所请求的 Web 页面与负责生成该页面的 Web 服务器之间额外层。这个额外层通常就是指 Ajax 框架（也就是 Ajax 引擎）。该框架用来处理终端用户和 Web 服务器之间的请求，它可以不需要额外的动作就交流请求和响应，例如重新刷新页面，或者中断用户正在执行的动作（例如，滚动、点击或阅读一段文本）。

#### XMLHTTPRequest对象

> 由于安全原因，该对象只能调用同一域的URL；不能直接调用远程服务器。

XMLHTTPRequest对象也被看作是Ajax应用的“通道（guts）”，因为它是客户端请求和服务器端响应的“通道”。虽然接下来将介绍创建和使用XMLHTTPRequest对象的基础知识，请参阅https://www.w3.org/TR/XMLHttpRequest/获取详细信息。

创建对象的函数

```php
function getXMLHTTPRequest() {
   var req =  false;
   try {
      /* for Firefox */
      req = new XMLHttpRequest(); 
   } catch (err) {
      try {
         /* for some versions of IE */
         req = new ActiveXObject("Msxml2.XMLHTTP");
      } catch (err) {
         try {
            /* for some other versions of IE */
            req = new ActiveXObject("Microsoft.XMLHTTP");
         } catch (err) {
            req = false;
         }
     }
   }
   
   return req;
}
```

#### 与服务器通信

创建一个向服务器发送请求的函数：

```php
function getServerTime() {
  var thePage = 'servertime.php';
  myRand = parseInt(Math.random()*999999999999999); # 创建随机数
  var theURL = thePage +"?rand="+myRand;
  myReq.open("GET", theURL, true);
  myReq.onreadystatechange = theHTTPResponse;
  myReq.send(null);
}

/* 处理服务器响应 */
function theHTTPResponse() {
  if (myReq.readyState == 4) {
    if(myReq.status == 200) {
       var timeString = myReq.responseXML.getElementsByTagName("timestring")[0];
       document.getElementById('showtime').innerHTML = timeString.childNodes[0].nodeValue;
    }
  } else {
    document.getElementById('showtime').innerHTML = '<img src="ajax-loader.gif"/>';
  }
}
```

页面：

```php
<?php
header('Content-Type: text/xml');
echo "<?xml version=\"1.0\" ?>
      <clock>
        <timestring>It is ".date('H:i:s')." on ".date('M d, Y').".</timestring>
      </clock>";
?>
```

#### 处理服务器响应

解释响应并向终端用户显示一个字符串

```php
function theHTTPResponse() {
  if (myReq.readyState == 4) {
    if(myReq.status == 200) {
       var timeString = myReq.responseXML.getElementsByTagName("timestring")[0];
       document.getElementById('showtime').innerHTML = timeString.childNodes[0].nodeValue;
    }
  } else {
    document.getElementById('showtime').innerHTML = '<img src="ajax-loader.gif"/>';
  }
}
```

上面的源代码可见[[link](https://github.com/thethomason/git-book/blob/master/build-website/php-mysql-tutorial/code/Chapter34/ajax_functions.js)]

#### 整合应用

[ajaxServerTime.html](https://github.com/thethomason/git-book/blob/master/build-website/php-mysql-tutorial/code/Chapter34/ajaxServerTime.html)：包含样式单以及能够调用远程PHP脚本并获取服务器响应的JavaScript脚本

### 在以前的项目中添加Ajax元素

项目源代码可见 [[link](https://github.com/thethomason/git-book/tree/master/build-website/php-mysql-tutorial/code/Chapter34)]

修改[27章源代码](https://github.com/thethomason/git-book/tree/master/build-website/php-mysql-tutorial/code/Chapter27)如下：

- output_fns.php 中的 do_html_header()函数指向新的样式单和JavaScript函数库的链接
- output_fns.php 中的 display_add_bm_form()函数也做了修改，添加标签后不用离开页面。添加了对 getXMLHTTPRequest()函数的调用
- addNewBookmark()函数：创建变量，向PHP脚本发送数据以及调用函数处理服务器端的响应。
- url_fns.php 中的 add_bm() 函数：关于错误信息的处理改成if语句

### 进一步学习

#### 进一步了解文档对象模型（DOM）

- W3C关于文档对象模型的技术报告：http://www.w3.org/DOM/DOMTR

- DOM脚本编程组织的主页：http://domscripting.webstandards.org/
- Mozilla项目关于DOM的开发人员文档：http://developer.mozilla.org/en/docs/DOM（以及关于JavaScript文档的链接：http://developer.mozilla.org/en/docs/JavaScript）

#### Ajax应用可用的JavaScript函数库

> 尽力减少重复性工作

- Prototype JavaScript框架可以简化DOM对象的操作。在创建复杂的Ajax应用时，可以使用XMLHTTPRequest对象。更多信息，请参阅：http://www.prototypejs.org/。

- Dojo是一个开放源代码的工具包，它包含了许多基本的JavaScript函数，一个创建框架以及有效的打包并向终端用户分发代码的机制。更多信息，请参阅：http://dojotoolkit.org/。

- MochiKit是一个轻量级的代码库，它包含了处理DOM以及格式化客户端输出的函数。MochiKit的口号有点“不友好”但是很真实：“MochiKit使得JavaScript不那么糟糕”。MochiKit提供的函数和解决方案，可供开发人员使用的文档以及使用MochiKit创建的示例项目都值得一看。更多信息，请参阅：http://mochikit.com/。

####  Ajax开发人员网站

- Ajaxian是一个开发人员门户网站，它为新的或者有经验的开发人员提供了新闻、文章、教程以及示例代码。更多信息，请参阅：http://ajaxian.com/。

- Ajax Matters包含一些深度介绍Ajax开发的文章。更多信息，请参阅：http://www.ajaxmatters.com/。

- Ajax Lines是另一个开发人员门户网站，它提供了关于Ajax所有内容的新闻和文章。更多信息，请参阅：http://www.ajaxlines.com/。