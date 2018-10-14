---
title: 网站建设之PHP进阶
date: 2018-8-21 15:22:51
tags: [编程语言,网站建设]
---

下载书籍 [[download](https://pan.baidu.com/s/1MrBCS-fpLmSs57swjW3JGA) PDF]

## 与文件系统和服务器的交互

- 使用 PHP 上传文件
- 使用目录函数
- 与服务器上的文件进行交互
- 在服务器上运行程序
- 使用服务器环境变量

### 文件上传

举例之前，需要注意的是，php.ini 文件具有五个能够控制 PHP 如何[处理文件上传的指令](https://blog.csdn.net/sinat_36329815/article/details/78639994)。

#### 文件上传的 HTML 代码

```html
<html>
<head>
  <title>Administration - upload new files</title>
</head>
<body>
<h1>Upload new news files</h1>
<form enctype="multipart/form-data" action="upload.php" method=post>
  <input type="hidden" name="MAX_FILE_SIZE" value="1000000">
  Upload this file: <input name="userfile" type="file">
  <input type="submit" value="Send File">
</form>
</body>
</html>
```

这个表单的其他特性包括：

- 在＜form＞标记中，必须设置属性enctype="multipart/form-data"，这样，服务器就可以知道上传的文件带有常规的表单信息。

- 必须有一个可以设置上传文件最大长度的表单域。这是一个隐藏的域，如下所示：

  ```html
  <input type="hidden" name="MAX_FILE_SIZE" value="1000000">
  ```

  请注意，MAX_FILE_SIZE表单域是可选的，该值也可以在服务器端设置。然而，如果在这个表单中使用，表单域的名称必须是MAX_FILE_SIZE。其值是允许人们上传文件的最大长度值（按字节计算）。在这里，我们将其设置为1 000 000B（几乎就是1MB）。

- 你需要指定文件类型，如下所示：

  ```html
  <input name="userfile" type="file">
  ```

  可以为文件选择喜欢的任何名字，但必须记住，将在PHP接收脚本中使用这个名字来访问文件。

#### 编写处理文件的 PHP

在PHP脚本中，需要处理的数据保存在超级全局数组`$_FILES`中。如果开启了register_globals指令，也可以直接通过变量名称访问这些信息。但是，这可能就是关闭register_globals指令的原因，或者至少认为是关闭了该指令，并且使用超级全局数组而忽略全局变量。

实例：**upload.php** : 从HTML表单中获得文件的 PHP 脚本

```php
<html>
<head>
  <title>Uploading...</title>
</head>
<body>
<h1>Uploading file...</h1>
<?php

//Check to see if an error code was generated on the upload attempt
  if ($_FILES['userfile']['error'] > 0)
  {
    echo 'Problem: ';
    switch ($_FILES['userfile']['error'])
    {
      case 1:	echo 'File exceeded upload_max_filesize';
	  			break;
      case 2:	echo 'File exceeded max_file_size';
	  			break;
      case 3:	echo 'File only partially uploaded';
	  			break;
      case 4:	echo 'No file uploaded';
	  			break;
	  case 6:   echo 'Cannot upload file: No temp directory specified.';
	  			break;
	  case 7:   echo 'Upload failed: Cannot write to disk.';
	  			break;
    }
    exit;
  }

  // Does the file have the right MIME type?
  if ($_FILES['userfile']['type'] != 'text/plain')
  {
    echo 'Problem: file is not plain text';
    exit;
  }

  // put the file where we'd like it
  $upfile = '/uploads/'.$_FILES['userfile']['name'];

  if (is_uploaded_file($_FILES['userfile']['tmp_name'])) 
  {
     if (!move_uploaded_file($_FILES['userfile']['tmp_name'], $upfile))
     {
        echo 'Problem: Could not move file to destination directory';
        exit;
     }
  } 
  else 
  {
    echo 'Problem: Possible file upload attack. Filename: ';
    echo $_FILES['userfile']['name'];
    exit;
  }


  echo 'File uploaded successfully<br><br>'; 

  // reformat the file contents
  $fp = fopen($upfile, 'r');
  $contents = fread ($fp, filesize ($upfile));
  fclose ($fp);
 
  $contents = strip_tags($contents); //清除任何HTML标记或PHP标记
  $fp = fopen($upfile, 'w');
  fwrite($fp, $contents); //保存文件
  fclose($fp);

  // show what was uploaded
  echo 'Preview of uploaded file contents:<br><hr>';
  echo $contents;
  echo '<br><hr>';

?>
</body>
</html>
```

#### 避免常见的上传问题

- 进行身份验证，不应该允许任何人都可以上传文件到网站。
- 对于不信任的用户应严格控制文件内容，另外，将上传文件的进行重命名。
- 降低用户“浏览 Web 服务器目录”的风险，你可以使用 `basename()` 函数来修改所接收文件的名称。
- 如果使用的是基于Windows的机器，通常情况下，必须确保在文件路径中用“\\”或“/”替代“\”。
- 就像我们以上脚本所做的，使用用户提供的文件名称可能会导致一系列的问题。
- 如果文件上传脚本的运行出现问题，请检查PHP配置文件。

### 使用目录函数

#### 从目录读取

实例 **browsedir.php** 能够列出上传文件的目录

```php
<html>
<head>
  <title>Browse Directories</title>
</head>
<body>
<h1>Browsing</h1>
<?php
  $current_dir = '/uploads/';
  $dir = opendir($current_dir);

  echo "<p>Upload directory is $current_dir</p>";
  echo '<p>Directory Listing:</p><ul>';
  
  while(false !== ($file = readdir($dir)))
    //strip out the two entries of . and ..
  	if($file != "." && $file != "..")
  	{
    	  echo "<li>$file</li>";
  	}
  echo '</ul>';
  closedir($dir);
?>
</body>
</html>
```

在这里，一个相关的并且是非常实用的函数是rewinddir($dir)，此函数将所读的文件恢复到开始的目录。

除了这些函数外，还可以使用PHP提供的dir类，该类具有handle和path属性，以及read()、close()和rewind()方法，它们与以上所介绍的非类函数有着相同的作用。

下面使用 dir 类重新实现上面的效果

```php
<html>
<head>
  <title>Browse Directories</title>
</head>
<body>
<h1>Browsing</h1>
<?php
  $dir = dir("/uploads/");

  echo "<p>Handle is $dir->handle</p>";
  echo "<p>Upload directory is $dir->path</p>";
  echo '<p>Directory Listing:</p><ul>';
  
  while(false !== ($file = $dir->read()))
    //strip out the two entries of . and ..
  	if($file != "." && $file != "..")
  	{
		echo '<a href="filedetails.php?file='.$file.'">'.$file.'</a><br>';
  	}
  echo '</ul>';
  $dir->close();
?>
</body>
</html>
```

以上示例中的文件名称并没有以任何顺序保存，因此如果需要一个有序列表，你可以使用scandir()函数，该函数是在PHP 5中引入的。这个函数可以将文件名称保存在一个数组，并且以字母表的顺序排序，升序或降序。

```php
<html>
<head>
  <title>Browse Directories</title>
</head>
<body>
<h1>Browsing</h1>
<?php
$dir = '/uploads/';
$files1 = scandir($dir);
$files2 = scandir($dir, 1);

echo "<p>Upload directory is $dir</p>";
echo '<p>Directory Listing in alphabetical order, ascending:</p><ul>';


foreach($files1 as $file)
{
  	if($file != "." && $file != "..")
    echo "<li>$file</li>";
}

echo '</ul>';

echo "<p>Upload directory is $dir</p>";
echo '<p>Directory Listing in alphabetical, descending:</p><ul>';


foreach($files2 as $file)
{
  	if($file != "." && $file != "..")
    echo "<li>$file</li>";
}

echo '</ul>';

?>
</body>
</html>
```

#### 获得当前目录的信息

`dirname($path)`函数和`basename($path)`函数将分别返回路径的目录部分和路径的文件名称部分。

使用`disk_free_space($path)`函数，我们也可以在目录列表中增加一项说明，表示还有多少空间可以用来保存上传文件。

#### 创建和删除目录

- 创建目录

  ```php
  mkdir("/tmp/testing",0777); //两个参数分别是 路径和权限，可以用 umask() 函数进行检查
  ```

- 删除目录

  ```php
  rmdir("/tmp/testing");
  ```

  请注意，要删除的目录必须为空目录

### 与文件系统的交互

#### 获取文件信息

```php
<html>
<head>
  <title>File Details</title>
</head>
<body>
<?php
  $current_dir = '/uploads/';
  $file = basename($file);  // strip off directory information for security

  echo '<h1>Details of file: '.$file.'</h1>'; 
  $file = $current_dir.$file;

  echo '<h2>File data</h2>';
  echo 'File last accessed: '.date('j F Y H:i', fileatime($file)).'<br>';
  echo 'File last modified: '.date('j F Y H:i', filemtime($file)).'<br>';

  //$user = posix_getpwuid(fileowner($file));
  echo 'File owner: '.$user['name'].'<br>';

  //$group = posix_getgrgid(filegroup($file));  
  echo 'File group: '.$group['name'].'<br>';
  
  echo 'File permissions: '.decoct(fileperms($file)).'<br>';
  
  echo 'File type: '.filetype($file).'<br>';

  echo 'File size: '.filesize($file).' bytes<br>';

 
  echo '<h2>File tests</h2>';

  echo 'is_dir: '.(is_dir($file)? 'true' : 'false').'<br>';
  echo 'is_executable: '.(is_executable($file)? 'true' : 'false').'<br>';
  echo 'is_file: '.(is_file($file)? 'true' : 'false').'<br>';
  echo 'is_link: '.(is_link($file)? 'true' : 'false').'<br>';
  echo 'is_readable: '.(is_readable($file)? 'true' : 'false').'<br>';
  echo 'is_writable: '.(is_writable($file)? 'true' : 'false').'<br>';

?>
</body>
</html>
```

使用该脚本的警告：Windows下不支持或者不可靠地支持这里所使用的一些函数，包括posix_getpwuid()函数、fileowner()函数和filegroup()函数。

所有的文件状态函数的运行都很费时间。因此它们的结果将被缓存起来。如果要在变化之前或者变化之后检查文件信息，需要调用函数：

```php
clearstatcache();
```

来清除以前的缓存结果。如果希望在改变文件数据之前或者之后使用以前的脚本，应该先调用此函数来更新产生的数据。

#### 更改文件属性

函数chgrp(file,group)、chmod(file,permissions)、chown(file,user)的功能都类似于UNIX中的同名函数。它们都不能在基于Windows的系统中运行，尽管函数chown()也可以执行，但是它将总是返回true。

#### 创建、删除和移动文件

- 创建文件 `touch()`
- 删除文件 `unlink()`
- 复制文件 `copy()`
- 重命名文件 `rename()`
- 移动文件 `rename()`

### 使用程序执行函数

- exec()
- passthru()
- system()
- 反引号
- popen()
- proc_open()
- proc_close()

### 与环境变量交互

- 获得环境变量值 `getenv()`
- 设置环境变量值 `putenv()`

请注意，这里所说的环境变量是指运行PHP的服务器上的环境变量。

### 进一步学习

- [查看php手册](http://php.net/manual/zh/)

## 章 使用网络函数和协议函数

- 了解可供使用的协议
- 发送和读取电子邮件
- 使用其他 Web 站点的数据
- 使用网络查找函数
- 使用 FTP

### 了解可供使用的协议

协议是指在给定情况下的通信规则。协议可以在[这里](https://www.rfc-editor.org/)找到，当编程过程中出现问题，可以作为参考。

一些非常著名的RFC例子是RFC2616和RFC822，它们分别描述了HTTP/1.1协议和Internet电子邮件格式。

### 发送和读取电子邮件

发送邮件时使用简单的 mail() 函数。这个函数使用简单邮件传输协议（Simple Mail Transfer Protocol ，SMTP）。

可以使用许多免费的类为 mai() 函数添加新功能。

- 使用插件来发送带有 HTML 附件的邮件
- SMTP 只能用来发送邮件
- Internet 邮件访问协议（IMAP4）和邮政协议（POP3）可以用来读取特定邮件服务器上的邮件。这些协议不能用来发送邮件
- IMAP4 用于读取和操作存储服务器上的邮件，它比 POP3 更复杂
- 通常情况下，POP3 适用于将邮件下载到客户端，并从服务器上删除它们

### 使用其他 Web 站点的数据

通过网络能实现的最重要的一件事就是可以在用户自己的页面中使用、修改和嵌入已有服务和信息。通过一个 URL 指向源文件就可以实现。

下面看一段示例代码：从 NASDAQ 获得 Amazon 的股票价格。

```php
<html>
<head>
<title>Stock Quote From NASDAQ</title>
</head><body>
<?php
//choose stock to look at
$symbol='AMZN';
echo'<h1>Stock quote for'.$symbol.'</h1>';
$url='https://finance.yahoo.com/d/quotes.csv'.'?s='.$symbol.'&e=.csv&f=sl1d1t1c1ohgv';
if(!($contents=file_get_contents($url))){
	die('Failure to open'.$url);
}
//extract relavant data
list($symbol,$quote,$date,$time)=explode(',',$contents);
$date=trim($date,'"');$time=trim($time,'"');
echo '<p>'.$symbol.'was last sold at:'.$quote.'</p>';
echo '<p>Quote current as of'.$date.'at'.$time.'</p>';
//acknowledge source
echo '<p>This information retrieved from<br/>
<a href="'.$url.'">'.$url.'</a>.</p>';
?>
</body>
</html>
```

可以用上述方法实现各种目的。另一个很好的例子就是索取当地的天气信息并把它嵌入网页中。

如果要编写一个类似的脚本，可能还希望传输一些其他的数据。例如，如果要连接到一个外部URL，可能需要传输一些用户输入参数。如果打算这样做，使用函数urlencode()是一个好主意。此函数将接受一个字符串并将其转换为适合URL的格式。例如，将空格转换为“+”符号。可以按如下方式调用此函数：

```php
$encodedparameter=urlencode($parameter);
```

这种方法的问题是获得信息的源站点可能会改变其数据格式，这样就使脚本无法正常运行。

### 使用网络查找函数

实例：**directory_submit.html** 提交表单的HTML

```html
<html>
<head>
<title>Submit your site</title>
</head>
<body>
<h1>Submit site</h1>
<form method=post action="test.php">
    URL:<input type=text name="url" size=30 value="http://"><br/>
    Email contact:<input type=text name="email" size=23><br/>
    <input type="submit"name="Submit site">
</form>
</body>
</html>
```

当点击提交按钮时，我们首先要检查该URL是否对应一台真实的主机，其次，还要检查电子邮件地址的主机部分是否也对应真实的机器。我们已经编写了这些检查脚本:

**test.php** 用于检查 URL 和电子邮件地址是否合法

```php
<html>
<head>
<title>Site submission results</title>
</head>
<body>
<h1>Site submission results</h1>
<?php
//Extract form fields
$url=$_REQUEST['url'];
$email=$_REQUEST['email'];
//Check the URL
$url=parse_url($url);
$host=$url['host'];
if(!($ip=gethostbyname($host))){ //php网络集中的函数，如果存在主机，返回IP地址，否则返回false。如果使用 gethostbyaddr()，给定IP，返回主机名
	echo'Host for URL does not have valid IP';
	exit;
	}
	
echo "Host is at IP $ip<br>";

//Check the email address
$email=explode('@',$email); //分割成用户名和主机名部分
$emailhost=$email[1];

//note that the dns_get_mx()function is*not implemented*in
//Windows versions of PHP
if(!dns_get_mx($emailhost,$mxhostsarr)) //php网络集中的函数，检查是否存在主机，该函数返回邮件地址的一组邮件交换记录。也可以使用 checkdnsrr() 函数检查是否有 DNS 记录
{echo'Email address is not at valid host';
exit;
}
echo'Email is delivered via:';
foreach($mxhostsarr as $mx)
echo "$mx";
//If reached here,all ok
echo'<br>All submitted details are ok.<br>';
echo 'Thank you for submitting your site.<br>'.'It will be visited by one of our staff members soon.'
//In real case,add to db of waiting sites...

?>
</body>
</html>
```

### 备份或镜像一个文件

文件传输协议（FTP）是用来在网络主机之间传输文件的协议。就像使用HTTP连接一样，使用PHP，可以在FTP中使用fopen()函数和其他不同的文件函数来连接一个FTP服务器，并在客户端和FTP服务器之间传送文件。但是，标准的PHP安装也提供了一整套专门适用于FTP的函数。

在默认情况下，这些函数并没有内置在PHP的标准安装中。要在UNIX下使用这些函数，必须运行带有--enable-ftp命令选项的configure程序，然后再次运行make文件。如果使用标准的Windows安装，FTP函数将被自动启用。

#### 使用 FTP 备份或镜像一个文件

实例 **ftp_mirror.php** 一个从 FTP 服务器下载新版本文件的脚本

```php
<html>
<head>
<title>Mirror update</title>
</head><body>
<h1>Mirror update</h1>
<?php

//set up variables-change these to suit application
$host='ftp.cs.rmit.edu.au'; //即将连接的FTP服务器的名称
$user='anonymous'; //匿名登录，通常做法是把电子邮件作为密码
$password='me@example.com';
$remotefile='/pub/tsg/teraterm/ttssh14.zip'; //将要下载的文件的路径
$localfile='/tmp/writable/ttssh14.zip'; //下载文件存储在机器上的本地路径

//connect to host
$conn=ftp_connect($host);
if(!$conn){
	echo'Error:Could not connect to ftp server<br/>';
	exit;
}
echo"Connected to $host.<br/>";

//log in to host
$result=@ftp_login($conn,$user,$pass);
if(!$result){
	echo"Error:Could not log on as$user<br/>";
	ftp_quit($conn);
	exit;
}
echo"Logged in as$user<br/>";

//check file times to see if an update is required
echo'Checking file time...<br/>';
if(file_exists($localfile)){
	$localtime=filemtime($localfile);
	echo'Local file last updated';
	echo date('G:i j-M-Y',$localtime);
    echo'<br/>';
}
else
	$localtime=0; //if localfile is not exists, set the loacaltime=0
$remotetime=ftp_mdtm($conn,$remotefile); //acquire remote file's last update time
if(!($remotetime>=0)){
	
	//This doesn't mean the file's not there,server may not support modtime
	echo 'Can\'t access remote file time.<br/>';
	
    $remotetime=$localtime+1; //make sure of an update
}
else{
    echo 'Remote file last updated';
	echo date('G:i j-M-Y',$remotetime);
	echo '<br/>';
}
if(!($remotetime>$localtime)){
	echo 'Local copy is up to date.<br/>';
	exit;
}

//download file
echo'Getting file from server...<br/>';
$fp=fopen($localfile,'w');
if(!$success=ftp_fget($conn,$fp,$remotefile,FTP_BINARY)){
	echo'Error:Could not download file';
	ftp_quit($conn);
	exit;
}
fclose($fp);
echo'File downloaded successfully';

//close connection to host
ftp_quit($conn);
?>
</body>
</html>
```

该脚本的基本执行步骤与命令行中手动使用FTP传输文件一样：

1. 连接远程 FTP 服务器
2. 登录（通过用户名或匿名登录）
3. 检查远程文件是否已经更新
4. 如果更新过，下载此文件
5. 关闭 FTP 连接

#### 上传文件

与下载文件类似，上传文件需要用到两个函数：

- `ftp_fput()`
- `ftp_put()`

#### 避免超时

当通过 FTP 传输文件时，可能会遇到一个问题就是超过最大可执行时间。

解决方案是修改配置文件 php.ini 定义的最大可执行时间的默认值。默认值是 30 秒。

```php
set_time_limit(90); //通过调用函数来修改配置，单位是秒。
```

#### 使用其他的 FTP 函数

- 显示文件大小：`ftp_size()`
- [查看手册](http://php.net/manual/zh/book.ftp.php)

### 进一步学习

查看官方定制的协议

- [HTTP](https://www.w3.org/Protocols/)
- [RFC](https://www.rfc-editor.org/)

## 日期和时间管理

- 在 PHP 中获取日期和时间
- 在 PHP 日期格式和 MySQL 日期格式之间进行转换
- 计算日期
- 使用日历函数

### 在 PHP 中获取日期和时间

#### 使用 `date()` 函数

#### 使用 UNIX 时间戳

时间戳保存的是格林威治标准时间从 1970 年 1 月 1 日零点起到当前时刻的秒数，以 32 未整数表示，其中 1970 年 1 月 1 日零点也叫 UNIX 纪元。

- 将一个日期和时间转变成 UNIX 时间戳 `mktime()`
- `time()`
- `date()`

#### 使用 `getdate()` 函数

它以时间戳作为可选参数，返回一个相关数组，表示日期和时间的各个部分

#### 使用 `checkdate()` 函数检验日期有效性

#### 格式化时间戳

`strftime()`

### 在 PHP 日期格式和 MySQL 日期格式之间进行转换

在 MySQL 端进行转换

- DATE_FORMAT() 转换为易读的时间格式
- UNIX_TIMESTAMP() 转换为 UNIX 时间戳
- [详细参考](http://www.w3school.com.cn/sql/func_date_format.asp)

### 在 PHP 中计算日期

在 PHP 中，计算两个日期之间长度最简单的方法就是通过计算两个 UNIX 时间戳之差来获得。

### 在 MySQL 中计算日期

使用 MySQL 计算某人的年龄，已知生日。

使用函数：`datediff()`

### 使用微妙

使用函数：`microtime()`

### 使用日历函数

- `gregoriantojd()`
- `jdtojulian()`

要在UNIX下使用这些函数，必须已经在PHP中编译了日历扩展库，通过--enable-calendar选项实现。这些日历扩展库已经内置在Windows系统的安装中。

### 进一步学习

- [PHP 时间函数](http://php.net/manual/zh/ref.datetime.php)
- [PHP 日历函数](http://php.net/manual/zh/ref.calendar.php)
- [SQL 日期函数](https://www.w3cschool.cn/sql/82rg1ozi.html)

##  创建图像

- 在 PHP 中设定图像支持
- 理解图像格式
- 创建图像
- 在其他页面中使用自动生成的图像
- 用文本和字体创建图像
- 绘制图像与用图表描绘数据

需要用到的库：GD2【[参考](http://www.boutell.com/gd/)】【[官网](https://libgd.github.io/)】、ImageMagick【[下载](http://pecl.php.net/package/imagick)】【[官网](http://www.imagemagick.org)】

### 在 PHP 中设置图像支持

在 Windows 平台

- 注册 php_gd2.dll 扩展

  在安装目录（\ext 子目录）找到该文件并复制到系统目录（C:\Windows\System）。

- 在 php.ini 文件中取消一行注释

  ```
  extension=php_gd2.dll
  ```

如果使用UNIX而又希望使用PNG，必须安装libpng库和zlib库，可以从如下站点分别获得它们：

- http://www.libpng.org/pub/png/

- http://www.zlib.net/

- 使用如下命令行选项对 PHP 进行配置：

  ```
  --with-png-dir=/path/to/libpng
  --with-zlib-dir=/path/to/zlib
  ```

如果使用UNIX并且希望使用JPEG，必须下载jpeg-6b库，然后重新编译GD库，使其包括对JPEG的支持。可以从以下站点下载该库：ftp://ftp.uu.net/graphics/jpeg/

此外，还应该使用如下命令行选项重新配置和编译PHP：

```
--with-jpeg-dir=/path/to/jpeg-6b
```

如果希望在图像中使用TrueType字体，还需要FreeType库。这个函数库也是在从PHP 4版本开始捆绑的。当然，也可以从以下站点下载该库：https://www.freetype.org/

如果希望使用PostScript Type 1字体，必须下载t1lib库，可以从如下站点下载该库：ftp://sunsite.unc.edu/pub/Linux/libs/graphics/

需要使用如下所示的命令行选项运行PHP的配置程序：

```
--with-t1lib[=path/to/t1lib]
```

最后使用--with--gd配置PHP。

### 理解图像格式

GD 库支持 JPEG、PNG 和 WBMP 格式。但它不再支持 GIF 格式。

- [JPEG](https://jpeg.org/)：有损压缩
- [PNG](http://www.libpng.org/pub/png/)：无损压缩
- WBMP：专门为无线通信设备设计的文件格式，未得到广泛应用
- GIF：无损压缩

### 创建图像

基本步骤：

- 创建一个背景图像
- 在背景上绘制图形轮廓或输入文本
- 输出最终图形
- 清除所有资源

```php
<?php

//创建背景和初始化变量
$height=200;
$width=200;
$im=imagecreatetruecolor($width,$height); //创建图像背景，大小为 200*200
$white=imagecolorallocate($im,255,255,255); //设置文字（或者轮廓）的颜色，这里只是生成一个标识符，还没有实际用到
$blue=imagecolorallocate($im,0,0,64);

//绘制轮廓和输入文本
imagefill($im,0,0,$blue); //绘制一个黑色背景，图像填充为蓝色
imageline($im,0,0,$width,$height,$white); //从(0,0)到右下角画一条直线
imagestring($im,4,50,150,'Sales',$white); //将字符串‘Sales’画到背景上

//将上面的图像输出到显示器
Header('Content-type:image/png'); //发送标题数据
imagepng($im); //输出图像数据

//清理图像标识符所占用的资源
destroy($im);

?>
```

### 在其他页面中使用自动生成的图像

可以嵌入到 img 标签中：

```php
<img src="simplegraph.php'height="200"width="200"alt="Sales going down"/>
```

### 使用文本和字体创建图像

**make_button.html**

```html
<html>
<head>
  <title>Create buttons</title>
<head>
<body>
<h1>create button</h1>
<form method="post" action="test.php">
    input button text:<br />
    <input type="text" name="button_text"><br /><br />
    choose a color:<br />
    <input type="radio" name="color" value="red">red<br />
    <input type="radio" name="color" value="green">green<br />
    <input type="radio" name="color" value="blue">blue<br /><br />
    <input type="submit" value="create">
</form>
</body>
```

**test.php**

```php
<?php
//check we have the appropriate variable data
//variables are button-text and color
$button_text=$_REQUEST['button_text'];
$color=$_REQUEST['color'];
if(empty($button_text)||empty($color)){
	echo'Could not create image-form not filled out correctly';
	exit;
}

//create an image of the right background and check size
$im=imagecreatefrompng($color.'-button.png');
$width_image=imagesx($im);
$height_image=imagesy($im);

//Our images need an 18 pixel margin in from the edge of the image
$width_image_wo_margins=$width_image-(2*18);
$height_image_wo_margins=$height_image-(2*18);

//Work out if the font size will fit and make it smaller until it does
//Start out with the biggest size that will reasonably fit on our buttons
$font_size=33;

//you need to tell GD2 where your fonts reside
putenv('GDFONTPATH=C:\WINDOWS\Fonts');//设置环境变量
$fontname='arial';
do{
	$font_size--;
	
	//find out the size of the text at that font size
	$bbox=imagettfbbox($font_size,0,$fontname,$button_text);
	$right_text=$bbox[2];//right co-ordinate
	$left_text=$bbox[0];//left co-ordinate
	$width_text=$right_text-$left_text;//how wide is it?
	$height_text=abs($bbox[7]-$bbox[1]);//how tall is it?
}while($font_size>8 && ($height_text>$height_image_wo_margins||$width_text>$width_image_wo_margins));
if($height_text>$height_image_wo_margins||$width_text>$width_image_wo_margins){
	
	//no readable font size will fit on button
	echo'Text given will not fit on button.<br/>';
}
else{
	
	//We have found a font size that will fit
	//Now work out where to put it
	$text_x=$width_image/2.0-$width_text/2.0;
	$text_y=$height_image/2.0-$height_text/2.0;
	if($left_text<0)
		$text_x+=abs($left_text);//add factor for left overhang

	$above_line_text=abs($bbox[7]);//how far above the baseline?
	$text_y+=$above_line_text;//add baseline factor
	$text_y-=2;//adjustment factor for shape of our template
	$white=imagecolorallocate($im,255,255,255);
	imagettftext($im,$font_size,0,$text_x,$text_y,$white,$fontname,$button_text);
	Header('Content-type:image/png');
	imagepng($im);
}

imagedestroy($im);

?>
```

### 绘制图像与用图表描绘数据

实例：在网站中进行一次民意测验，让用户为虚构的选举进行投票。投票结果保存到 MySQL 数据库中，并用图像函数绘制出条形图，以表示投票结果。

步骤一：建立数据库

```sql
create database poll;
use poll;
create table poll_results(
	candidate varchar(30),
	num_votes int
);

insert into poll_results values
('John Smith',0),
('Mary Jones',0),
('Fred Bloggs',0);

grant all privileges
on poll.*
to poll@localhost
identified by 'poll';
```

步骤2：创建一个投票的页面

```html
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>polling</title>
</head>
<body>
	<h1>Pop Poll</h1>
	<p>Who will you vote for in the election?</p>
	<form method="post" action="show_poll.php">
		<input type="radio" name="vote" value="John Smith">John Smith<br/>
		<input type="radio" name="vote" value="Mary Jones">Mary Jones<br/>
		<input type="radio" name="vote" value="Fred Bloggs">Fred Bloggs<br/><br/>
		<input type="submit" value="show results">
	</form>
	
</body>
</html>
```

步骤3：完成脚本

```php
<?php
/********************************************************
          Database query to get poll info 
********************************************************/

//get vote 
$vote = $_REQUEST['vote'];

//login mysql
@ $db = new mysqli('127.0.0.1', 'root', '', 'poll');
if (mysqli_connect_errno()) {
  echo 'Could not connect to db <br />';
  exit;
}

if (!empty($vote)) {
  $vote = addslashes($vote);
  //update
  $query = 'update poll_results set num_votes = num_votes + 1 where candidate = \'' . $vote . '\'';
  $result = $db -> query($query);
  if (!$result) {
    echo 'Could not connect to db <br />';
    exit;
  } 

  //query
  $query = 'select * from poll_results';
  $result = $db -> query($query);
  if (!$result) {
    echo 'Could not connect to db <br />';
    exit;
  } 

  $num_candidates = $result -> num_rows;
  $total_votes = 0;
  while ($row = $result -> fetch_object()) {
    $total_votes += $row -> num_votes;
  }
  $result -> data_seek(0);

/********************************************************
          Initial calculations for graph 
********************************************************/
//使用字体必须告诉GD2字体的位置
// putenv('GDFONTPATH=C:/Windows/Fonts'); //在Windows中频繁报错
// $fontname = 'Arial';
$fontname = 'c:/windows/fonts/arial.ttf';
$width = 600;
$left_margin = 50;
$right_margin = 50;
$bar_height = 40;
$bar_spacing = $bar_height / 2;
$title_size = 16;
$main_size = 12;
$small_size = 12;
$text_indent = 10;

$x = $left_margin + 60;
$y = 50;
$bar_unit = ($width - ($x + $right_margin)) / 100;
$height = $num_candidates * ($bar_height + $bar_spacing) + 50;

/********************************************************
          Setup base image 
********************************************************/
$img = imagecreatetruecolor($width, $height);

$white = imagecolorallocate($img, 255, 255, 255);
$blue = imagecolorallocate($img, 0, 64, 128);
$black = imagecolorallocate($img, 0, 0, 0);
$pink = imagecolorallocate($img, 255, 78, 243);

$text_color = $black;
$percent_color = $black;
$line_color = $black;
$bg_color = $white;
$bar_color = $blue;
$number_color = $pink;

imagefilledrectangle($img, 0, 0, $width, $height, $white);
imagerectangle($img, 0, 0, $width - 1, $height - 1, $line_color);

//Add title
$title = 'Poll Result';
$title_dimensions = imagettfbbox($title_size, 0, $fontname, $title);
$title_length = $title_dimensions[2] - $title_dimensions[0];
$title_height = abs($title_dimensions[7] - $title_dimensions[1]);
$title_above_line = abs($title_dimensions[7]);
$title_x = ($width - $title_length) / 2;
$title_y = ($y - $title_height) / 2;
imagettftext($img, $title_size, 0, $title_x, $title_y, $text_color, $fontname, $title);
imageline($img, $x, $y - 5, $x, $height - 15, $line_color);

/********************************************************
          Draw data into gragh 
********************************************************/
while ($row = $result -> fetch_object()) {
  $percent = 0;
  if ($total_votes > 0) {
    $percent = intval($row -> num_votes / $total_votes * 100);
  }

  $percent_cahr = eurofix('%');
  $percent_dimension = imagettfbbox($main_size, 0, $fontname, $percent . $percent_cahr);
  $percent_lenght = $percent_dimension[2] - $percent_dimension[0];
  imagettftext($img, $main_size, 0, $width - $percent_lenght - $text_indent, $y + $bar_height / 2,
   $percent_color, $fontname, $percent . $percent_cahr);

$bar_lenght = $x + $percent * $bar_unit;
imagefilledrectangle($img, $x, $y - 2, $bar_lenght, $y + $bar_height, $bar_color);
imagettftext($img, $main_size, 0, $text_indent, $y + $bar_height / 2,
   $text_color, $fontname, $row -> candidate);
imagerectangle($img, $bar_lenght, $y - 2, $x + (100 * $bar_unit), $y + $bar_height, $line_color);
imagettftext($img, $small_size, 0, $x + (100 * $bar_unit) - 50, $y + $bar_height / 2,
   $number_color, $fontname, $row -> num_votes . '/' . $total_votes);

  $y = $y + $bar_height + $bar_spacing;

}


header('Content-type: image/png');
imagepng($img);
imagedestroy($img);

}

function eurofix($str) {
$euro=utf8_encode('&#8364;');
$str = preg_replace('/\x80/',$euro,$str);
return ($str);
}
?>
```

### 使用其他图像函数

除了本章中用到的图像函数之外，PHP还提供了许多[其他的图像函数](http://php.net/manual/zh/book.image.php)。通过编程来绘制图形将要花费很长时间，经过多次尝试和遇到很多错误。绘图的时候我们通常应该先绘制出其轮廓，然后查阅[联机手册](http://php.net/manual/zh/book.image.php)以寻找所需的函数。

### 进一步学习

查看 GD 库函数的[源代码](https://libgd.github.io/pages/docs.html)

## 在 PHP 中使用会话控制

- 什么是会话控制
- cookie 
- 创建一个会话的步骤
- 会话变量
- 会话和身份验证

### 什么是会话控制

会话控制的思想是指能够在网站中根据一个会话跟踪用户。如果我们能够做到这点，就可以很容易的做到对用户登录的支持，并根据其授权级别和个人喜好显示相应的内容。

### 理解基本的会话功能

PHP 的会话是通过唯一的会话 ID 来驱动的，会话 ID 是一个加密的随机数字。它由 PHP 生成，在会话的生命周期中都会保存在客户端。它可以保存在用户机器里的 cookie 中，或者通过 URL 在网络上传递。

cookie 是与会话不同的解决方法，它也解决了在多个事务之间保持状态的问题，同时，它还可以保持一个整洁的 URL。

#### 什么是 cookie

cookie 是一小段信息，可以由脚本在客户端机器保存。

#### 通过 PHP 设置 cookie

使用函数 `setcookie()`

#### 在会话中使用 cookie

使用cookie也存在一些问题：一些浏览器不接受cookie，一些用户可能将其浏览器的cookie功能关闭了。这也就是PHP会话控制使用cookie/URL双模式的原因之一。

可以使用函数 `session_get_cookie_params()` 来查看由会话控制设置的 cookie 内容。

#### 存储会话 ID

在默认情况下，PHP 将在会话中使用 cookie。

如果可能，可以设置一个 cookie 用来存会话 ID。

另一个使用会话的方法是将会话 ID 添加到 URL 中，使用此方法需要考虑安全性问题。

### 实现简单的会话

基本步骤：

1. 开始一个会话
2. 注册会话变量
3. 使用会话变量
4. 注销变量并销毁会话

请注意，这些步骤不一定都要发生在同一个脚本中，其中的一些步骤可以在多个脚本中发生。

#### 开始一个会话

方法一：

使用函数 `session_start()`，必须在脚本开始的部分调用函数，如果没有调用这个函数，所有保存在该会话的信息都无法在脚本中使用。

方法二：

将 PHP 设置成当有用户访问网站的时候就自动启动一个会话。

可以使用 php.ini 文件中的 session.auto_start 选项完成该设置。

使用该方法有一个很大的缺点：启用auto_start设置导致无法使用对象作为会话变量。这是因为该对象的类定义必须在创建该对象的会话开始之前载入。

#### 注册一个会话变量

使用超级全局数组：`$_SESSION`

要创建一个会话变量，只需在这些数组中设置一个元素，比如，`$_SESSION['myvar']=5`

要结束会话可以手动重置。

另外也可以设置它的声明周期，在 php.ini 中通过指令 gc_maxlifetime 设置。

#### 使用会话变量

接上，访问时可以通过数组的方式访问，`$_SESSION['myvar']`

检查是否设置了某个会话，可以使用 `isset()`或`empty()` 函数，例如， `if(isset($_SESSION['myvar']))...`

#### 注销变量与销毁会话

**注销变量**：使用函数 `unset($_SESSION['myvar'])`

我们不能销毁整个 `$_SESSION` 数组，因为这样将禁用会话功能。要一次销毁所有的会话变量，可以使用 `$_SESSION=array()`

**销毁会话**：`session_destroy()`，清除会话 ID。

### 创建一个简单会话的例子

**page1.php** 启动一个会话并注册一个变量

```php
<?php
session_start(); //创建一个会话
$_SESSION['sess_var'] = "hello world"; //注册一个会话变量
echo 'The content of $_SESSION[\'sess_var\'] is <i>'.$_SESSION['sess_var']. '</i><br/>' //使用一个会话
?>
<a href="page2.php">Next page</a>
```

**page2.php**

```php
<?php
session_start();
echo 'The content of $_SESSION[\'sess_var\'] is <i>'.$_SESSION['sess_var']. '</i><br/>';
unset($_SESSION['sess_var']); //清除一个会话变量
?>
<a href="page3.php">Next page</a>
```

**page3.php**

```php
<?php
session_start();
echo 'The content of $_SESSION[\'sess_var\'] is <i>'.$_SESSION['sess_var']. '</i><br/>';
session_destroy(); //销毁会话
?>
```

### 配置会话控制

在 php.ini 配置文件中有一组会话配置选项，可以对其进行设置。

- 详细参考 [点击这里](http://php.net/manual/zh/session.security.ini.php)

### 通过会话控制实现身份验证

实际应用：

**authmain.php** 登录页面

```php
<?php
session_start();
if(isset($_POST['userid'])&&isset($_POST['password'])){
	//if the user has just tried to log in
	$userid=$_POST['userid'];
	$password=$_POST['password'];
	$db_conn=new mysqli('localhost','webauth','webauth','auth');
	if(mysqli_connect_errno()){
		echo'Connection to database failed:'.mysqli_connect_error();
		exit();
	}
	$query='select * from authorized_users'."where name='$userid'"."and password=sha1('$password')";
	$result=$db_conn->query($query);if($result->num_rows){	
		//if they are in the database register the user id
		$_SESSION['valid_user']=$userid;
	}
	$db_conn->close();
}
?>
<html>
<body>

<h1>Home page</h1>
<?php
if(isset($_SESSION['valid_user'])){
	echo'You are logged in as:'.$_SESSION['valid_user'].'<br/>';
	echo'<a href="logout.php">Log out</a><br/>';
}
else{
	if(isset($userid)){
	//if they"ve tried and failed to log in
	echo'Could not log you in.<br/>';
	}
	else{
		//they have not tried to log in yet or have logged out
		echo'You are not logged in.<br/>';
	}

	//provide form to log in
	echo'<form method="post"action="authmain.php">';
	echo'<table>';
	echo'<tr><td>Userid:</td>';
	echo'<td><input type="text"name="userid"></td></tr>';
	echo'<tr><td>Password:</td>';
	echo'<td><input type="password"name="password"></td></tr>';
	echo'<tr><td colspan="2"align="center">';
	echo'<input type="submit"value="Log in"></td></tr>';
	echo'</table></form>';
}
?>
<br/>
<a href="members_only.php">Members section</a>
</body>
</html>
```

**members_only.php** 只有有效登录的用户才能看到本页面的实际内容

```php
<?php
session_start();
echo'<h1>Members only</h1>';
//check session variable
if(isset($_SESSION['valid_user'])){
	echo'<p>You are logged in as'.$_SESSION['valid_user'].'</p>';
	echo'<p>Members only content goes here</p>';
}
else{
	echo'<p>You are not logged in.</p>';
	echo'<p>Only logged in members may see this page.</p>';
}
echo'<a href="authmain.php">Back to main page</a>';
?>
```

**logout.php** 退出登录

```php
<?php
session_start();
//store to test if they*were*logged in
$old_user=$_SESSION['valid_user'];
unset($_SESSION['valid_user']);
session_destroy();
?>
<html>
<body>
<h1>Log out</h1>
<?php
if(!empty($old_user)){
	echo'Logged out.<br/>';
}
else{
	//if they weren't logged in but came to this page somehow
	echo'You were not logged in,and so have not been logged out.<br/>';
}
?>
<a href="authmain.php">Back to main page</a>
</body>
</html>
```

### 进一步学习

- [Mozilla Dev](https://developer.mozilla.org/zh-CN/search?q=cookie#)

## 其他有用的特性

其他零碎但是有用的 PHP 知识

- 使用 eval() 函数对字符串求值
- 中断执行：die 和 exit
- 序列化变量和对象
- 获取 PHP 环境信息
- 暂时改变运行时环境
- 加亮源代码
- 在命令行中使用 PHP

### 使用 `eval()` 函数对字符串求值

```php
eval("echo 'Hello World';");
//等价于
echo 'Hello World';
```

eval()函数可以在许多不同的情况下使用。例如，我们可以在数据库里存储一段代码，以便此后可以检索它们并求值。也可能在一个循环里生成代码，然后使用eval()来执行它。

eval()函数的最常见用法是**系统模板化**。我们可以从数据库中载入HTML、PHP和纯文本的混合。模板系统可以对这些内容格式化并且通过eval()函数来执行任何PHP代码。

可以使用eval()函数有效地更新和校正已有代码。如果我们知道一堆脚本需要在什么地方进行修改，那么可以写一段新的脚本代码，将老的脚本代码加载到一个字符串中（效率较低），运行regexp进行修改，然后用eval()执行修改过的脚本。

我们甚至可以想像，某人对系统非常信任时，可能会希望在浏览器端输入PHP代码，然后在服务器端执行。

### 终止执行：`die()`和`exit()`

die() 是 exit() 的别名函数

exit() 可以传递一个参数，可以在终止代码执行之前输出一个错误信息，或者执行特定的函数，例如：

```php
exit('Script ending now.');
```

更常见的是，这两个语句OR（与）一个可能失败的语句一起使用，主要用来实现推出错误。例如，打开一个文件或者连接数据库：

```php
mysql_query($query)or die('Could not execute query');

//或者可以调用函数
function err_msg(){
    return'MySQL error was:'.mysql_error();
}
mysql_query($query)or die(err_msg());
```

这样做可以使用户了解程序失败的原因或关闭HTML元素的方法，或在输出缓冲中清除一个已经完成部分的页面，这对用户来说是非常有帮助的。

或者，可以将错误信息以电子邮件的方式发送给自己，这样可以了解程序是否出现重要错误，还可以将错误信息添加到日志文件中。

### 序列化变量和对象

序列化是将可以保存在PHP变量或对象中的任何数据转换成字节流的处理过程，这个字节流可以存储在数据库中，或者通过URL在网页之间传递。如果不使用这个处理过程，很难存储和传递整个数组或对象的内容。

随着session（会话）控制的引入，序列化的作用有了一定的降低，数据的序列化现在可以使用会话控制来实现。事实上，为了将会话变量在HTTP请求之间存储，可以使用会话控制函数来序列化会话变量。

但是，我们可能还希望将PHP数组或对象保存到一个文件或数据库中。如果要这样做，就必须了解如何使用这两个函数：serialize()和unserialize()。

可以按如下方式调用serialize()函数：

```php
$serial_object = serialize($my_object);
```

如果希望知道序列化都完成了哪些操作，可以通过查看序列化后返回的结果来获知。显而易见，它可以将对象或数组的内容转换为字符串。

例如，我们可以查看对一个简单的employee对象上执行序列化操作的结果。该对象的定义和初始化如下：

```php
class employee{
    var $name;
    var $employee_id;
}
$this_emp = new employee;
$this_emp -> name = 'Fred';
$this_emp -> employee_id = 5324;
```

将结果输出到屏幕：

```php
$serial_object = serialize($this_emp);
echo $serial_object;
```

可以很容易看出原始对象数据和序列化后的数据之间的关系。由于序列化后的数据只有文本，你可以将它写到数据库或其他位置。请注意，与往常的操作一样，应该使用 `mysql_real_escape_string()` 函数对将要写入数据库的数据进行处理，这样可以转义任何特殊字符。

注意上述序列化字符串中的引号，我们就知道这是必要的。

要恢复原来的对象，可以调用`unserialize()`函数，如下所示：

```php
$new_object = unserialize($serial_object);
```

显然，如果在将对象保存到数据库之前调用`addslashes()`函数，那么也需要在反序列化字符串之前调用`stripslashes()`函数。

当序列化类或使用它们作为会话变量时需要注意一点：在PHP能够重新实例化一个类之前，它必须知道类的结构。因此，必须在调用`session_start()`或`unserialize()`函数之前包含该类的定义文件。

### 获取 PHP 环境信息

- 查找函数集合：`get_loaded_extensions()`
- 查找函数集合中的函数：`get_extension_funcs()`
- 检查某个函数是否存在：`function_exists("string function_name")`
- 识别脚本所有者：`get_current_user()`
- 确定脚本最近修改时间：`getlastmod()`

### 暂时改变运行时环境

可以通过在 php.ini 文件中查看指令集，或者也可以在一个脚本的运行周期中修改它们。

- 修改指令 `ini_set()`
- 访问指令`ini_get()`

每个指令的含义可以查看：[配置选项列表](http://php.net/manual/zh/ini.list.php)

允许设置的级别可以查看：[配置可被设定范围](http://php.net/manual/zh/configuration.changes.modes.php)

### 源代码加亮

源代码在浏览器中展示时加亮，以加强可读性。

- `show_source()`
- `highlight_file()`

两个函数时一样的功能，可以说`show_source()`是`highlight_file()`的别名函数。

可以在 php.ini 文件中设置加亮语法的颜色。相关部分在：

```
;Colors for Syntax Highlighting mode
```

### 在命令行中使用 PHP

在命令行下，有3种方法来执行PHP脚本：通过一个文件、管道或直接在命令行下。

通过文件：

```
php myscript.php
```

通过管道：

```
echo "<?php for($i=1;$i<10;$i++) echo $i;?>" | demo.php
```

在命令行直接运行：

```
php -r "for($i=1;$i<10;$i++) echo $i;"
```