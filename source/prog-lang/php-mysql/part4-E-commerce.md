---
title: 网站建设之电子商务
date: 2018-8-21 15:22:27
tags: [编程语言,网站建设]
---

下载书籍 [[download](https://pan.baidu.com/s/1MrBCS-fpLmSs57swjW3JGA) PDF]

## 运营一个电子商务网站

- 电子商务网站要实现什么目标
- 考虑电子商务网站的类型
- 理解风险和威胁
- 选择一个策略

### 要实现的目标

- 赚钱

### 考虑电子商务网站的类型

- 使用在线说明书公布信息
- 接收产品或服务的订单
- 提供服务和数字产品
- 为货物或服务的增值
- 减少成本

### 理解风险和威胁

- 网络黑客
- 不能够招揽足够的生意
- 计算机硬件故障
- 电力、通信、网络或运输故障
- 对派送服务的依赖
- 广泛的竞争
- 软件错误
- 不断变化的政府政策和税收
- 系统容量的限制

## 电子商务的安全问题

- 信息的重要程度
- 安全威胁
- 建议一套安全策略
- 易用性、性能、成本和安全性
- 身份验证原则
- 在站点应用身份验证
- 加密技术
- 私有密钥加密
- 公有密钥加密
- 数字签名
- 数字证书
- 安全的 Web 服务器
- 审计与日志记录
- 防火墙
- 备份数据
- 自然环境的安全性

### 安全威胁

- 机密数据的泄漏
- 数据丢失和数据损坏
- 数据修改
- 拒绝服务：某人的操作使得其他用户很难或者不可能访问一个服务，或者延迟对一个时间临界服务的访问
- 软件错误
- 否认

### 易用性、性能、成本和安全性

### 建立一套安全政策

安全政策是一个文档，它描述了：

- 公司的一般安全要求
- 安全保护对象——软件、硬件、数据
- 负责保护这些项目的人
- 安全标准及其度量标准

### 身份验证原则

身份验证技术包括密码、数字签名、生物鉴定措施（例如指纹扫描），以及涉及硬件（例如智能卡）的措施。在网络上，只有两种技术是经常使用的：密码和数字签名。

使用 MySQL 比PHP内置的身份验证速度更快。使用 PHP ，可以提供更灵活的身份验证，或者以更具有吸引力的方式呈现此要求。

### 加密技术基础

加密算法是将信息转变为一个看起来是任意数据串的数学过程。

目前，密文大多由加密引擎（计算机程序）产生。

有些加密方法是不可逆的。许多密码都是一种单方向的加密算法进行存储。

许多加密过程都是可逆的。

#### 私有密钥加密

私有密钥加密也称作保密密钥加密，它信赖于授权用户知道或者可以访问一个密钥。

著名的密钥系统：RC2、RC4、RC5、triple DES 和 IDEA。其中triple DES 非常安全。它使用与 DES 相同的算法，3 次分别应用 3 个不同的密钥。

提示：有趣的是，triple DES的安全性能只是DES的两倍。如果需要安全性能3倍于DES的加密算法，可以编写一个5倍于DES安全性能的算法。

显然，密钥加密的一个缺点是，要向某人发送一个机密的消息，需要通过秘密的方式把密钥告诉对方。如果可以通过秘密的方式来分发一个密码，为什么不通过这个秘密的方式来分发消息呢？

幸运的是，当Diffie和Hellman在1976年最初公布第一个公有密钥方案时，加密技术有了突破。

#### 公有密钥加密

公有密钥加密依赖于两个不同的密钥，一个公有密钥和一个私有密钥。公有密钥用于加密消息，私有密钥用于解密它们。

最常使用的公有密钥算法是 RSA

#### 数字签名

用来验证消息没有被篡改，用到了哈希函数

### 数字证书

如果给用户一个证书，他就拥有对方的公有密钥，如果该用户要发送一个加密消息的话，他还拥有对方的详细信息，并且知道这些消息没有改变。

这对于一个商业往来来讲，就有很好的法律意义。

能够为个人或组织授权的颁发数字证书的公司（CA 公司）：

- [VeriSign](http://www.verisign.com/) 著名
- [Thawte](https://www.thawte.com/)  著名
- [Network Solution](https://www.networksolutions.com/)
- [GoDaddy](https://sg.godaddy.com/zh/)

### 安全的 Web 服务器

- Apache **较可靠**
- Microsoft IIS
- 其他免费或商业 Web 服务器

### 审计与日志记录

如果黑客获得了 root 权限，就可以随意更改日志，掩饰自己的行踪。

### 防火墙

在网络中，设计防火墙的目的是将本地网络与外部网络相分离。

### 备份数据

- 备份常规文件：常用免费软件 AMANDA
- 备份与恢复 MySQL 数据库

## Web 应用的安全

- 处理安全性问题的策略
- 识别所面临的威胁
- 了解与我们“打交道”的用户
- 代码的安全性
- Web 服务器和 PHP 的安全性
- 数据库服务器的安全性
- 保护网络
- 计算机和操作系统的安全性
- 灾难计划

### 处理安全性问题的策略

- 以正确的心态为开始。在设计网站的时候就把安全性考虑进去。
- 安全性和可用性之间的平衡。
- 安全监视

### 识别所面临的威胁

- 访问或修改敏感数据
- 数据丢失或破坏
- 拒绝服务
- 恶意代码注入
- 服务器被攻破

### 了解与我们打交道的用户

- 破解人员
- 受影响机器的未知情用户
- 对公司不满的员工
- 硬件被盗
- 我们自身

###  代码的安全性

- 过滤用户输入
- 转义输入 `htmlspecialchars()` 和 `htmlentities()` 函数
- 代码组织 ：机密文件不要放在文档树的根目录
- 代码自身的问题 ：密码不要放在文档树的根目录
- 文件系统因素
- 代码稳定性和缺陷
- 执行引号和 exec ：`escapeshellcmd()` 函数限制其输入非法脚本

### Web 服务器和 PHP 的安全性

- 保持软件的更新
- 查看 php.ini 文件
- Web 服务器配置
- Web 应用的商业主机服务

### 数据库服务的安全性

- 用户和权限系统
- 发送数据至服务器
- 连接服务器
- 运行服务器

### 保护网络

- 安装防火墙
- 使用隔离区域（DMZ）
- 应对 DoS 和 DDoS 攻击

### 计算机和操作系统的安全性

- 保持操作系统的更新
- 只运行必需的软件
- 服务器的物理安全性

### 灾难计划

- 自然灾害

## 使用 PHP 和 MySQL 实现身份验证

- 识别访问者
- 实现访问控制
- 使用基本身份验证
- 在 PHP 中使用基本身份验证
- 在 Apache 的 .htaccess 文件中使用基本身份验证
- 使用 mod_auth_mysql 身份验证
- 创建自定义身份验证

### 识别访问者

可以通过识别机器来识别访问者。但是，通常，许多人可能会共享一台计算机，而且许多人可能使用多台计算机。

网站上用来识别身份的方法通常选择使用唯一的用户名和密码。

### 实现访问控制

示例代码：**secret.php** ：提供简单的身份验证机制的 PHP 和 HTML

```php
<?php
	//create short names for variables
    $name = $_POST['name'];
	$password = $_POST['password'];
	if( (!isset($name)) || (!isset($password)) ){
    // vistor nees to enter a name and password
?>
    <h1>Please Log In</h1>
    <p>This Page is secret.</p>
   	<form method="post" action="secret.php">
        <p>Username:<input type="text"name="name"></p>
        <p>Password:<input type="password"name="password"></p>
        <p><input type="submit"name="submit"value="Log In"></p>
    </form>
<?php
    }else if(($name=="user")＆＆($password=="pass")){
        //visitor's name and password combination are correct
        echo"<h1>Here it is!</h1>
        <p>I bet you are glad you can see this secret page.</p>";
        }else{
        //visitor's name and password combination are not correct
        echo"<h1>Go Away!</h1>
        <p>You are not authorized to use this resource.</p>";
    }
?>
```

该脚本提供了一个简单的身份验证机制，但是存在一些明显的问题：

- 只对一个用户名和密码进行了硬编码
- 将密码以普通文本的形式保存
- 只保护一个页面
- 以普通文本的形式传输密码

#### 保存密码

使用数据库保存用户名和密码

整体的流程是：连接数据库 》查询记录 》匹配成功，其中每个步骤出错都会有错误提示。

```php
<?php
	//create short names for variables
    $name = $_POST['name'];
	$password = $_POST['password'];
	if( (!isset($name)) || (!isset($password)) ){
    // vistor nees to enter a name and password
?>
    <h1>Please Log In</h1>
    <p>This Page is secret.</p>
   	<form method="post" action="secret.php">
        <p>Username:<input type="text"name="name"></p>
        <p>Password:<input type="password"name="password"></p>
        <p><input type="submit"name="submit"value="Log In"></p>
    </form>
<?php
    }else{
        //connect to mysql
        $mysql=mysqli_connect("localhost","webauth","webauth");
        if(!$mysql){
            echo"Cannot connect to database.";
            exit;
        }
        //select the appropriate database
        $selected=mysqli_select_db($mysql,"auth");
        if(!$selected){
            echo"Cannot select database.";
            exit;
        }
//query the database to see if there is a record which matches
$query="select count(*)from authorized_users where
name='".$name."'and
password='".$password."'";
$result=mysqli_query($mysql,$query);
if(!$result){
echo"Cannot run query.";
exit;
}
$row=mysqli_fetch_row($result);
$count=$row[0];
if($count>0){
//visitor's name and password combination are correct
echo"<h1>Here it is!</h1>
<p>I bet you are glad you can see this secret page.</p>";
}else{
//visitor's name and password combination are not correct
echo"<h1>Go Away!</h1>
<p>You are not authorized to use this resource.</p>";
}
}
?>
```

#### 密码的加密

只需要稍微做一点工作，就可以通过一种使用单向哈希的算法来提高密码的安全性。PHP 提供了许多单向的哈希函数，这里推荐使用 `sha1()`

例如：

```php
// 首先创建一个用户，他的密码是：password
// 字符串 password 的哈希值是 5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8，那么我们验证用户时可以不用原始的匹配，可以改为
if($name=='username')&&(sha1($password)=='5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8')){
    // OK passwords match
}
```

不但 PHP 具有哈希算法， MySQL 也提供了哈希函数，保存的时候就可以用，长度为 40 个字符。

#### 保护多个网页

- 使用 Web 服务器提供的访问控制机制

可以使用 auto_prepend_file() 和 auto_append_file() 函数，可以自动的在特定的目录下的每个文件预先计划并添加所需的代码。但是，使用这种方法，用户浏览每一页都会要求重新输入用户名和密码，显然，这是不可行的。

- 解决方法：
  - HTTP 基本身份验证
  - 会话控制技术

### 使用基本身份验证

HTTP 有内置的身份验证功能，脚本或 Web 服务器可以通过浏览器请求身份验证。

浏览器会帮助用户处理之前输入过的用户名和密码，将其发送给 Web 服务器，中间无需用户介入。

### 在 PHP 中使用基本的身份验证

一般地说，PHP脚本是跨平台的，但是基本身份验证的使用却依赖于服务器设置的环境变量。

示例：**http.php** PHP 可以出发 HTTP 基本身份验证

```php
<?php

// if we are using IIS, we need to set
// $_SERVER['PHP_AUTH_USER'] and
// $_SERVER['PHP_AUTH_PW']

if ((substr($_SERVER['SERVER_SOFTWARE'], 0, 9) == 'Microsoft') &&
    (!isset($_SERVER['PHP_AUTH_USER'])) &&
    (!isset($_SERVER['PHP_AUTH_PW'])) &&
    (substr($_SERVER['HTTP_AUTHORIZATION'], 0, 6) == 'Basic ')
   ) {

  list($_SERVER['PHP_AUTH_USER'], $_SERVER['PHP_AUTH_PW']) =
    explode(':', base64_decode(substr($_SERVER['HTTP_AUTHORIZATION'], 6)));
}

// Replace this if statement with a database query or similar
if (($_SERVER['PHP_AUTH_USER'] != 'user') ||
   ($_SERVER['PHP_AUTH_PW'] != 'pass')) {

   // visitor has not yet given details, or their
   // name and password combination are not correct

  header('WWW-Authenticate: Basic realm="Realm-Name"');

  if (substr($_SERVER['SERVER_SOFTWARE'], 0, 9) == 'Microsoft') {
    header('Status: 401 Unauthorized');
  } else {
    header('HTTP/1.0 401 Unauthorized');
  }

  echo "<h1>Go Away!</h1>
        <p>You are not authorized to view this resource.</p>";

} else {
  // visitor has provided correct details
  echo "<h1>Here it is!</h1>
        <p>I bet you are glad you can see this secret page.</p>";
}
?>
```

示例给出的代码可以实现与本章前面的程序清单给出的代码实现的类似方法。

如果用户尚未提供身份验证信息，代码就会要求用户输入这些信息。如果用户提供的信息不正确，代码就给用户发送一个拒绝消息。如果提供的用户名、密码都正确，该代码就会显示网页的内容。

在这个例子中，用户将看到与前一个程序清单所不同的界面。我们不再提供要求输入注册信息的HTML表单。用户的浏览器将显示一个对话框。

### 在 Apache 的 .htaccess 文件中使用基本身份验证

Apache Web服务器包含一些不同的身份验证模式，这些模式可以用于判断用户输入数据的有效性。最简单的是**使用mod_auth**，它将用户名-密码对与服务器中一个文本文件中的行进行比较。

这里需要设置两个页面，一个成功页面，一个失败页面。

.htaccess 文件修改如下：

```
ErrorDocument 401/chapter17/rejection.html #指向失败页面
AuthUserFile/home/book/.htpass #可以在这个路径下找到用户名和密码
AuthGroupFile/dev/null #不能在特定组中通过身份验证可以访问资源
AuthName"Realm-Name" #命名保护区域
AuthType Basic #使用基本的身份验证方法
require valid-user #任何用户都可以访问
```

### 使用 mod_auth_mysql 身份验证

在 Apache 上使用 mod_auth 易于安装并且效率很高。因为它将用户信息保存到一个文本文件中，因此对于拥有广泛用户群的繁忙网站， mod_auth d 使用是不实际的。

使用 mod_auth_mysql，将拥有使用 mod_auth 的易用性，同时又获得访问数据库的更快速度。

要使用 mod_auth_mysql ，需要在系统中编译和安装该模块，或者请系统管理员安装它。

#### 安装 mod_auth_mysql

1. [获取模块](https://sourceforge.net/projects/modauthmysql/)的存档文件

2. 解压缩源代码

3. 切换到 mod_auth_mysql 目录，分别运行 make 和 make install 命令

4. 在 httpd.conf 文件中添加如下所示行，以便动态地将模块加载到 Apache

   ```
   LoadModule Mysql_auth_module libexec/mod_auth_mysql.so
   ```

5. 创建数据库的和包含身份验证信息的 MySQL 表。

6. 在 httpd.conf 文件中添加 mod_auth_mysql 用来连接 MySQL 所需的参数，该命令如下所示：

   ```
   Auth_MySQL_Info hostname user password
   ```

7. 检查编译是否正常工作。启动具有 SSL 支持类型的 Apache：

   ```
   /usr/local/apache/bin/apachectl startssl
   ```

   如果没有启用 SSL 支持类型，可以输入如下命令：

   ```
   mod_auth_mysql was successfully added.
   ```

8. 如果启动后在 httpd.conf 文件中有 Auth_MySQL_Info 指令，mod_auth_mysql 模块就已经成功添加。

#### 使用 mod_auth_mysql

和使用 mod_auth_mysql 一样。

```
ErrorDocument 401/chapter17/rejection.html #指定失败页面
AuthName"Realm Name" #命名保护区域
AuthType Basic #使用基本身份验证
Auth_MySQL_DB auth #指定数据库名称
Auth_MySQL_Encryption_Types MySQL #指定要使用MySQL密码加密：也可选(Plaintext/Crypt_DES)
Auth_MySQL_Password_Table authorized_users #指定表名称
Auth_MySQL_Username_Field name #指定用户名字段
Auth_MySQL_Password_Field password #指定密码字段
require valid-user #验证有效用户
```

从用户观点来看，mod_auth_mysql示例的工作方式与mod_auth示例完全一样。当用户访问该网站时，都看到一个由用户浏览器给出的对话框。如果用户成功通过身份验证，浏览器将显示网页内容。如果验证失败，浏览器将显示一个出错页面。

### 创建自定义身份验证

在之后的章节中会介绍通过会话控制来进行编写自定义的身份验证。在第23章中，将开发一个简单的用户验证系统。在第27章中，将在实际应用中讨论建立一个精确的身份验证系统。

### 进一步学习

- 详细的 [HTTP身份验证信息](http://www.rfc-editor.org/rfc/rfc2617.txt)
- mod_auto [详细介绍](http://httpd.apache.org/docs/2.0/mod/mod_auth.html)
- mod_auth_mysql文档包含在下载文件中。它非常小，因此如果希望找到更多关于它的信息，可以下载该存档文件并查看readme文件。

## 使用 PHP 和 MySQL 实现安全事务

- 提供安全事务处理
- 使用 Secure Sockets Layer（SSL，加密套接字层）
- 提供安全存储
- 确定是否需要存储信用卡号码
- 在 PHP 中使用加密技术

### 提供安全的事务处理

- 使用更高级的加密技术
- 把需要保留的数据保存到服务器或者本地机

#### Internet

需要采取的保护措施：

- 无论如何都要传输信息，这些信息无法保密并且在传输过程可能会被修改
- 在传输前数字签名该信息，确保不会被修改
- 在传输前加密信息，确保其保密并且不会被修改
- 因为信息非常重要而不可冒险被人拦截，决定使用其他方式分发信息

保密与否认是事务处理过程中两个重要的问题，两种方式保护信息：

- SSL
- S-HTTP（Secure Hypertext Transfer Protocol，加密的超文本传输协议）

### 使用加密套接字层（SSL）

Secure Sockets Layer Protocol（SSL协议）由 Netscape 公司提出。

通常，实现SSL的网络协议和软件都是按照一种层次堆栈的形式来组织的。每一层能够将数据传输到上一层或下一层，并且能够向上一层和下一层发出服务请求。

从上到下的几层依次是：应用层、传输层、网络层、至网络层的主机

加上SSL层后，

从上到下的几层依次是：应用层、SSL层、传输层、网络层、至网络层的主机

当一个 Web 浏览器通过 HTTP 连接到一个安全的 Web 服务器时，两者需要通过一个握手协议来达成一些共识，例如，身份验证和加密。

握手序列包括下列步骤：

1. 浏览器连接到一个启用了SSL的服务器并要求服务器验证自己。

2. 服务器发送数字证书。

3. 服务器有时可能（这种情况很少出现）要求浏览器证明其自身。

4. 浏览器列出一组加密算法和它支持的哈希函数。服务器选择它所支持的功能最强大的加密算法。

5. 浏览器和服务器生成会话密钥：

   a)浏览器从数字证书上获得服务器的公有密钥，并使用该公有密钥加密一个随机生成的数字。

   b)服务器对以简单文本形式发送的随机数据做出响应（除非浏览器已经为服务器的验证请求提供了数字证书，在这种情况下，服务器将使用浏览器的公有密钥）。

   c)用于会话的加密密钥通过使用哈希函数从随机数中产生。

当数据通过SSL连接发送时，将遵循下列步骤：

1. 将数据分成易管理的数据包。
2. 压缩每个数据包（可选的）。
3. 每个数据包有一个信息验证码（MAC），信息验证码是通过哈希算法计算出来的。
4. 将MAC和压缩的数据包组合到一起并加密它们。
5. 加密后的数据与头信息组合在一起并被发送到网络中。

但是，当数据使用 SSL 加密后，对数据进行压缩就没有什么意义了，会增大信息通信的容量。

目前，TLS（Transport Layer Security，传输层加密）还只是1.1版本，它是直接基于SSL 3.0标准的，但是还包含了一些可以克服SSL 3.0缺陷的改进，同时还提供了进一步的灵活性。人们计划将TLS设计为真正的开放标准，而不是由某个组织定义然后推广到其他组织。

### 屏蔽用户的输入

建立一个安全应用网站的原则之一是绝不可相信用户的任何输入，将用户数据输入到文件或者数据库之前，要一直屏蔽此数据或者通过系统执行的命令传输它。

常用的技术：

- 必须使用函数addslashes()在用户数据进入数据库之前过滤该数据。这个函数过滤掉可能引起数据库问题的字符。可以使用函数stripslashes()将数据返回到它的原始形式。
- 可以在php.ini配置文件中开启magic_quotes_gpc和magic_quotes_runtime的指令。这些指令将自动地添加和过滤斜杠。magic_quotes_gpc指令用于格式化GET、POST和cookie变量，而magic_quote_runtime指令用于格式化进出数据库的数据。
- 当传递用户数据给system()或者exec()时，必须使用函数escapeshellcmd()。该函数可以避免任何怀有恶意的用户输入强迫系统运行某些特定命令的字符。
- 可以使用函数strip_tags()从一个字符串中去掉HTML和PHP标记。这样可以避免用户将恶意的脚本植入到用户的数据中（可能会将这些数据显示到浏览器上）。
- 可以使用函数htmlspecialchars()，该函数将字符转换成它们的HTML等价实体。例如，“＜”被将转换成"＆lt;"，该函数可以将任何脚本标记转换成无害的字符。

### 提供安全存储

通常，3种不同类型的存储数据（HTML或PHP文件、与脚本相关的数据和MySQL数据）存储在同一磁盘的不同地方。每一种存储类型的数据需要不同的预防措施，并且独立检查。

只有当解密数据的密钥和软件没有存储在服务器上，而存储在另一台机器上时，Web服务器上的加密数据才可能有价值。安全处理重要数据的一个方法是在服务器上加密数据，然后将它传输到另一台机器，可以通过E-mail形式传输。

### 存储信用卡号码

- 非必须情况，可以不存储号码
- 如果需要存储，不能将卡号存储在 Web 服务器上。

### 在 PHP 中使用加密技术

加密的一个简单但又实用的任务就是发送加密的电子邮件。它的加密标准是：PGP（Pretty Good Privacy）

可以从[官网](https://www.symantec.com/products)获取 PGP 的免费版本或者从 PGP 公司购买一个商业许可证。

作为 PGP 的替代，如今有一个开放源代码的类似产品可供使用。GPG（GNU Privacy Guard）。它不包含专利算法，能够无限制地应用于商业活动中。可以从[官网](https://www.gnupg.org/)获取。

使用 GPG 和使用 PGP 类似。当然也可以混用，用 GPG 加密，用 PGP 解密。

#### 安装 GPG

在 Windows 上安装较为简单，直接下载 Zip 文件，然后运行 gpg.exe 。

在 Linux 上安装过程如下：

- 从官网获取适当的存档文件，[二进制文件](https://www.gnupg.org/download/index.html#binary)或者[源代码](https://www.gnupg.org/download/index.html#sec-1-1)

- 使用 gunzip 和 tar 命令从存档文档中提取文件

- 编译和安装程序 `make`、`make install`

- configure（或者 ./configure，因操作系统不同）

  如果不是 root 用户，需要带 --prefix 选项的方式运行配置脚本

  ```
  ./configure --prefix=/path/to/your/directory
  ```

- 如果一切运行正常，GPG将被编译并复制到/usr/local/bin/gpg目录或者指定的路径。

请注意，应该在邮件客户端机器上生成密钥而不是在Web服务器上生成它，这是很重要的。同样，私有密钥也不应该存储在Web服务器上。

如果使用GPG的命令行版本生成密钥，输入如下命令：

```
gpg --gen-key
```

要从新的密钥对输出公有密钥，可以使用如下所示命令：

```
gpg --export>filename
```

这将给出一个二进制文件，该文件适合将GPG或PGP密钥环导入到其他机器上。如果要将该密钥环以电子邮件的形式发送给人们，以便他们可以进入密钥环，那么可以建立一个ASCII版本来代替，如下所示：

```
gpg --export-a>filename
```

在已经获得公有密钥后，就能够将文件上传到Web服务器上自己的目录下。可以用FTP完成文件上传。

下面的命令是假定在UNIX环境下运行的。对于Windows系统来说，步骤也是一样的，但目录名和系统命令有所区别。首先，使用账户登录到Web服务器并更改文件的访问权根，以便其他用户能够阅读该文件。使用如下命令：

```
chmod 644 filename
```

我们需要创建一个密钥环，以便执行PHP脚本的用户能够使用GPG。具体哪些用户取决于服务器的设置。通常，该用户是"nobody"，但也可能是其他用户。

要想成为Web服务器用户，需要有访问服务器的root权限才能实现。在许多系统中，Web服务器都是以"nobody"用户身份运行的。如下所示的例子也是这种情况（我们能够在系统上将其改变为适当的用户）。如果系统是这种情形，可以使用如下所示命令：

```
su root
su nobody
```

为"nobody"创建一个目录用来存储密钥环和GPG的其他配置信息。这需要在nobody用户的根目录下进行。

每个用户的根目录在/etc/passwd文件中指定。在许多Linux系统中，nobody用户的默认根目录为“/”，而nobody用户无权对该目录执行写操作。在许多BSD系统中，nobody用户的根目录默认为/nonexistent（不存在），也就是说该目录不存在，用户也就不能对其执行写操作。在我们的系统上，nobody用户根目录被指定为/tmp。需要确定Web服务器用户是否有一个他们可以写入的根目录。

使用如下所示命令：

```
cd～
mkdir.gnupg
```

nobody用户需要一个自己的签名密钥。要创建一个签名密钥，使用如下所示命令：

```
gpg --gen-key
```

由于nobody用户可能需要接收一些个人电子邮件，因此可以为他们创建一个签名密钥。这个密钥的唯一目的是让我们信任先前获得的公有密钥。

为了导入先前导出的公有密钥，可以使用如下所示的命令：

```
gpg --import filename
```

要告诉GPG我们希望信任这个密钥，需要使用如下所示命令编辑密钥的属性：

```
gpg --edit-key 'Luke Welling＜luke@tangledweb.com.au＞'
```

在以上代码中，引号内的文本是密钥的名称，显而易见，当生成它时，密钥的名称不是'luke Welling＜luke@tangledweb.com.au＞'，而是由名称、注释和所提供的E-mail地址组成的。

这个程序的命令选项还包括help，它描述了所有可供使用的命令，例如，trust、sign和save。

输入trust命令选项将告诉GPG应该完全信任自己的密钥。输入sign命令选项表示用nobody的私有密钥签名公有密钥，最后，输入save命令选项表示退出这个程序并保存更改。

####  测试 GPG

到这里，我们应该已经成功安装GPG并可以开始使用GPG了。创建一个包含一些普通文本的文件并以test.txt名字保存它，这样我们对其进行测试。

输入如下所示的命令（可以对该命令进行修改，用你的密钥名称来替换其中的密钥名称）：

```
gpg-a--recipient'Luke Welling＜luke@tangledweb.com.au＞'--encrypt test.txt
```

将给出如下所示的警告：

```
gpg:Warning:using insecure memory!
```

并且生成名为test.txt.asc的文件。如果打开文件test.txt.asc，将看到如下所示的加密信息：

```
-----BEGIN PGP MESSAGE-----
Version:GnuPG v1.0.3(GNU/Linux)
Comment:For info see http://www.gnupg.org
hQEOA0DU7hVGgdtnEAQAhr4HgR7xpIBsK9CiELQw85+k1QdQ+p/FzqL8tICrQ+B30GJTEehPUDErwqUw/uQLTds0r1oPSrIAZ7c6GVkh0YEVBj2MskT81IIBvdo95OyHK9PUCvg/rLxJ1kxe4Vp8QFET5E3FdII/ly8VP5gSTE7gAgm0SbFf3S91PqwMyTkD/2oJEvL6e3cP384s0i8lrBbDbOUAAhCjjXt2DX/uX9q6P18QW56UICUOn4DPaW1G/gnNZCkcVDgLcKfBjbkB/TCWWhpA7o7kX4CIcIh7KlIMHY4RKdnCWQf271oE+8i9cJRSCMsFIoI6MMNRCQHY6p9bfxL2uE39IRJrQbe6xoEe0nkB0uTYxiL0TG+FrNrEtvBVMS0nsHu7HJey+oY4Z833pk5+MeVwYumJwlvHjdZxZmV6wz46GO2XGT17b28VwSBnWOoBHSZsPvkQXHTOq65EixP8y+YJvBN3z4pzdH0Xa+NpqbH7q3+xXmd30hDR+u7t6MxTLDbgC
+NR
=gfQu
-----END PGP MESSAGE-----
```

可以将该文件发送给最初生成此密钥的系统，运行如下命令：

```
gpg test.txt.asc
```

这样，就能够再次看到原始文本。原始文本将被写入到一个具有相同文件名称的文件——在这个例子中，文件名称为test.txt。

要将此文本输出到显示器上，可以使用-d标记并按如下方式指定一个输出文件：

```
gpg-d test.txt.asc
```

要在选择的文件中保存文本（非默认的文件名），可以使用-o标记并且指定输出文件，如下所示：

```
gpg-do test.out test.txt.asc
```

请注意，先要给出输出文件的名称。

如果已经安装了GPG，运行PHP脚本的用户就能够通过命令行使用它，基本上我们也是以这种方式运行。如果它出现问题，请询问系统管理员或者查看GPG文档。

实例：**private_mail.php** 发送加密邮件的 HTML 表单

```php
<html>
<body>
<h1>Send Me Private Mail</h1>

<?php
// you might need to change this line, if you do not use
// the default ports, 80 for normal traffic and 443 for SSL
if($_SERVER['SERVER_PORT']!=443) {
  echo '<p style="color: red">WARNING: you have not
         connected to this page using SSL. Your message could
         be read by others.</p>';
}
?>

<form method="post" action="send_private_mail.php">

<p>Your email address:<br/>
<input type="text" name="from" size="40"></p>

<p>Subject:<br/>
<input type="text" name="title" size="40"></p>

<p>Your message:<br/>
<textarea name="body" cols="30" rows="10"></textarea></p>

<br/>
<input type="submit" name="submit" value="Send!">

</form>

</body>
</html>
```

**send_private_mail.php** 调用 GPG 和发送加密邮件的 PHP 脚本

```php
<?php
  //create short variable names
  $from = $_POST['from'];
  $title = $_POST['title'];
  $body = $_POST['body'];

  $to_email = 'luke@localhost';

  // Tell gpg where to find the key ring
  // On this system, user nobody's home directory is /tmp/
  putenv('GNUPGHOME=/tmp/.gnupg');

  //create a unique file name
  $infile = tempnam('', 'pgp');
  $outfile = $infile.'.asc';

  //write the user's text to the file
  $fp = fopen($infile, 'w');
  fwrite($fp, $body);
  fclose($fp);

  //set up our command
  $command =  "/usr/local/bin/gpg -a \\
               --recipient 'Luke Welling <luke@tangledweb.com.au>' \\
               --encrypt -o $outfile $infile";

  // execute our gpg command
  system($command, $result);

  //delete the unencrypted temp file
  unlink($infile);

  if($result==0) {
    $fp = fopen($outfile, 'r');
    if((!$fp) || (filesize($outfile)==0)) {
      $result = -1;
    } else {
      //read the encrypted file
      $contents = fread ($fp, filesize ($outfile));

      //delete the encrypted temp file
      unlink($outfile);

      mail($to_email, $title, $contents, "From: ".$from."\n");
      echo '<h1>Message Sent</h1>
            <p>Your message was encrypted and sent.</p>
            <p>Thank you.</p>';
    }
  }

  if($result!=0) {
    echo '<h1>Error:</h1>
          <p>Your message could not be encrypted.</p>
          <p>It has not been sent.</p>
          <p>Sorry.</p>';
  }
?>
```

为了使这些代码能够适用于你的情况，需要对它进行一些修改。电子邮件要发送到$to_email的地址中。

在上面的程序中，必须修改以下代码行：

```php
putenv('GNUPGHOME=/tmp/.gnupg');
```

从而指定GPG密钥环的地址。在我们的系统中，Web服务器是以nobody用户的名义运行的，而且拥有一个根目录/tmp/。

我们使用函数tempnam()创建一个唯一的临时文件名。可以指定目录名和文件名的前缀。我们只需要很短的时间就可以创建和删除这些文件，因此如何命名这些文件并不重要。我们指定了一个前缀'pgp'，但是让PHP使用系统的临时目录。

如下语句：

```
$command="/usr/local/bin/gpg-a\\
--recipient'Luke Welling＜luke@tangledweb.com.au＞'\\
--encrypt-o$outfile$infile";
```

用来设置调用gpg的命令和参数。要将该命令适用于你的情况，必须对其进行一些修改。

在命令行上使用它时，需要告诉GPG哪一个密钥是用于加密信息的。如下语句：

```
system($command,$result);

```

执行存储在`$command`中的命令，并将返回值存储于`$result`。我们可以忽略返回值，但是利用该值，我们可以使用一个if语句并且告诉用户某些语句出错。

当利用临时文件完成任务后，可以调用函数unlink()删除这些文件。这就意味着，未加密电子邮件在服务器上只存储了很短的时间。但是如果服务器在执行过程中失败了，文件保留在服务器上也是可能的。

当提到脚本的安全性时，对系统中的信息流进行考虑也是很重要的。

### 进一步学习

- [计算机网络](http://product.dangdang.com/1099117606.html)