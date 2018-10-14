---
title: 网站建设之PHP实践
date: 2018-8-21 15:22:10
tags: [编程语言,网站建设]
---

下载书籍 [[download](https://pan.baidu.com/s/1MrBCS-fpLmSs57swjW3JGA) PDF]

## 快速入门

- 在 HTML 中嵌入 PHP
- 添加动态内容
- 访问表单变量
- 理解标识符
- 创建用户声明的变量
- 检查变量类型
- 给变量赋值
- 声明和使用变量
- 理解变量的作用域
- 理解操作符和优先级
- 表达式
- 使用可变函数
- 使用 if、else 和 switch 语句进行条件判断
- 使用 while、do 和 for 迭代语句

### PHP 标记

以`<?php`开始，以`?>`结束

另外还有其他的标记，此处不做说明，实际操作中，应用一种即可。

### PHP 语句

举个最简单的输出语句：`echo '<p>订单已经处理</p>'；`

在 PHP 中，分号是用来分隔语句的。

浏览器对该脚本语句进行解释时，输出的是 p 标签内部的内容，对于PHP 关键字不进行显示。

#### 空格

间隔字符，例如换行（回车）、空格和 Tab（制表符），都被认为是空格。这点和 HTML 一样。

#### 注释

行注释：`//`或者`#`

块注释： `/*    */`

### 添加动态内容

在纯 HTML 中嵌入 PHP 脚本语句，就可以实现动态输出。例如：

```php
<?php
	echo date('H:i,jS F Y');
?>
```

上面的时间函数`date()`会显示当前时间。每次刷新页面都会不一样。

### 调用函数

正如 1.3 中例子所示，给`date()`函数赋某值或赋空值，就是对函数的调用。

`date()`函数传递给它的变量是格式化字符串，这个字符串表示所需要的输出格式。

### 访问表单变量

使用订单的目的是为了收集客户订单。在PHP中，获得客户输入的具体数据是非常简单的，但是具体的方法还依赖于你所使用的PHP版本，以及php.ini文件的设置。

PHP 中的变量以 $ 开头

#### 表单变量的三种风格

说明：**variable** 是表单域名称，也就是`input`中的`name`属性值

- 简短风格，例如`$variable`，存在安全性问题
- 中等风格，例如`$_POST['variable']`,推荐使用
- 冗长风格，例如`$HTTP_POST_VARS['variable']`，可能会在将来的版本中舍弃，不推荐使用

#### 字符串的连接

变量名称和后续文本之间存在一个点号（.），例如：

```php
echo $variable.'个橘子'；
```

这个点号是字符串连接符，它可以将几段文本连接成一个字符串。使用连接符，可以避免使用多个 echo 命令。

对于任何简单类型的变量，都可以将变量写入到一个由双引号引起来的字符串中，数组变量稍复杂，另作讨论。

```php
echo "$variable 个橘子"；
```

这个语句和上面的那个是等价的。需要注意的是，单引号起不到这样的作用。

#### 变量和文本

为了做进一步的说明，还是用以上面的例子为证，单引号引起来的是文本，双引号引起来的可以是变量和文本的混合。

### 实例

**build-form.html**

```html
<form action="processorder.php"method="post">
	<table border="0">
		<input type="text"name="variable"size="3" maxlength="3"/>
		<button>submit</button>
	</table>
</form>
```

**processorder.php** 

```php
<?php
	echo '上一个页面的输入值为：'.$_POST['variable'];
?>
```

**属性说明**

- action：点击提交按钮时将要载入的 URL
- method：按照该方法将表单数据提交到 action 的 URL

### 理解标识符

标识符是变量的名称。使用规则如下：

- 标识符可以是任何长度，而且可以由任何字母、数字、下画线组成。
- 标识符不能以数字开始。
- 在PHP中，标识符是**区分大小**写的。`$tireqty`与`$TireQty`是不同的。交替地使用这些标识符是常见的编程错误。对于这个规则，函数名称是个例外——函数名称可以是**任意大小写**的。
- 一个变量名称可以与一个函数名称相同。这一点容易造成混淆，虽然是允许的，应该尽量避免。此外，不能创建一个具有与已有函数同名的函数。

### 检查变量的类型

变量类型是指能够保存在该变量中的数据类型。PHP提供了一个完整的数据类型集。

不同的数据可以保存在不同的数据类型中。

#### PHP 的数据类型

基本数据类型：

- Integer（整数）——用来表示整数
- Float（浮点数，也叫 Double，双精度值）——用来表示实数
- String（字符串）——用来表示字符串
- Boolean（布尔值）——true 或者 false
- Array（数组）——用来保存具有相同类型的多个数据项
- Object（对象）——用来保存类的实例

此外还有两个特殊的类型：NULL（空）和resource（资源）。没有被赋值、已经被重置或者被赋值为特殊值NULL的变量就是NULL类型的变量。特定的内置函数（例如数据库函数）将返回resource类型的变量。它们都代表外部资源（例如数据库连接）。

基本上不能直接操作一个**resource变量**，但是通常它们都将被函数返回，而且**必须作为参数传递给其他函数**。

#### 类型强度

在 PHP 中，变量的类型是由赋给变量的值确定的。例如：

```php
$totalqty = 0;
$totalamount = 0.00;
$totalstr = 'Hello';
```

`$totalqty`是整数类型的变量；`$toatalamount`是浮点类型的变量；`$totalstr`是字符串类型的变量。

#### 类型转换

例如，我们可以使用类型转换声明上一节中的两个变量。

```php
$totalqty=0;
$totalamount=(float)$totalqty;
```

`$totalamount`是浮点类型，而`$totalqty`始终是整数类型。

#### 可变变量

可变变量允许我们动态地改变一个变量的名称。**PHP 的特殊之处**

这个特性的工作原理是用一个变量的值作为另一个变量的名称。例如，我们可以设置：

```php
$varname='tireqty';
```

于是，我们就可以用$$varname取代$tireqty。例如，我们可以设置$tireqty的值：

```php
$$varname=5;
```

这个代码等价于：

```php
$tireqty=5;
```

### 声明和使用常量

一个常量可以保存一个值，例如一个变量值，但是常量值一旦被设定后，在脚本的其他地方就不能再更改。

在实际应用中，可以将要出售的商品单价作为常量保存起来。你可以使用define函数定义这些常量：

```php
define('TIREPRICE',100);
define('OILPRICE',10);
define('SPARKPRICE',4);
```

- 常量名称都是由大写字母组成的。

- 常量和变量之间的一个重要不同点在于引用一个常量的时候，它前面并没有$符号。

- 如果要使用一个常量的值，只需要使用其名称就可以了。例如，要使用一个以上已经创建的常量，可以输入：

  ```php
  echo TIREPRICE;
  ```

- 变量和常量的另一个差异在于常量只可以保存布尔值、整数、浮点数或字符串数据。这些类型都是标量数据。

- 想要了解其他 PHP 预定义常量，可以运行 `phpinfo()` 函数。

### 理解变量的作用域

PHP 具有 6 项基本的作用域规则

- 内置超级全局变量可以在脚本的任何地方使用和可见。
- 常量，一旦被声明，将可以在全局可见；也就是说，它们可以在函数内外使用。
- 在一个脚本中声明的全局变量在整个脚本中是可见的，但不是在函数内部。
- 函数内部使用的变量声明为全局变量时，其名称要与全局变量名称一致。
- 在函数内部创建并被声明为静态的变量无法在函数外部可见，但是可以在函数的多次执行过程中保持该值。
- 在函数内部创建的变量对函数来说是本地的，而当函数终止时，该变量也就不存在了。

超级全局变量一般是以 `$_` 开头，后面字母大写，除了 `$GLOBALS`。

### 使用操作符

- 算术操作符：加减乘除，取余

- 字符串操作符：双引号，点号

- 赋值操作符：=

- 复合赋值操作符：+=、-=、*=、/=、%=、.=

- 递加和递减：++、--

- 引用操作符：&

  - 通常，在将一个变量的值赋给另一个变量的时候，先产生原变量的一个副本，然后再将它保存在内存的其他地方。这样，一个变量改变时不会影响另一个变量
  - 为了避免产生这样的副本，可以使用引用操作符，使两个变量保持同步。

- 比较操作符：==、===、<、>、<=、>=

- 逻辑操作符：&&、||、！、and、or、nor

- 位操作符：&、|、-、^、<<、>>

- 其他操作符：，、new、->

- 三元操作符：？ ：

- 错误抑制操作符：@

- 执行操作符：``（一对反向单引号）

- 数组操作符：[]、=>

- 类型操作符：instanceof，例如：判断是否是某类的实例

  ```php
  class sampleClass{};
  $myObject=new sampleClass();
  if($myObject instanceof sampleClass)
  echo"myObject is an instance of sampleClass";
  ```

### 操作符的优先级和结合性

- 详情参考 [链接](http://www.php.net/manual/zh/language.operators.precedence.php)

### 使用可变函数

PHP有一个函数库，这个函数库允许我们使用不同的方法来操作和测试变量。

#### 测试和设置变量类型

通过 gettype() 函数，我们可以得到变量类型

通过 settype() 函数，我们可以设置变量类型

示例：

```php
<?php
	$a=56;
	echo gettype($a).'<br />';
	settype($a,'double');
	echo gettype($a).'<br />';
?>
```

PHP 还提供了一些特定类型的测试函数。每一个函数都使用一个变量作为其参数，并返回 true 或 false。如下：

- is_array()：检查变量是否是数组。
- is_double()、is_float()、is_real()（所有都是相同的函数）：检查变量是否是浮点数。
- is_long()、is_int()、is_integer()（所有都是相同的函数）：检查变量是否是整数。
- is_string()：检查变量是否是字符串。
- is_bool()：检查变量是否是布尔值。
- is_object()：检查变量是否是一个对象。
- is_resource()：检查变量是否是一个资源。
- is_null()：检查变量是否是为null。
- is_scalar()：检查该变量是否是标量，即，一个整数、布尔值、字符串或浮点数。
- is_numeric()：检查该变量是否是任何类型的数字或数字字符串。
- is_callable()：检查该变量是否是有效的函数名称。

#### 测试变量状态

一个变量是否存在和变量值是否为空，对于表单检查来说十分重要。因此有以下几个函数会使问题简单化。

- isset()：变量存在返回 true；否则为 false
- unset()：销毁传进来的变量
- empty()：变量不存在且值为空或0，返回 true；否则返回 false

#### 变量的重解释

转换变量的数据类型

```php
int intval(mixed var[,int base]);
float floatval(mixed var);
string strval(mixed var);
```

每个函数都需要接收一个变量作为其输入，然后再将变量值转换成适当类型返回。例如，intval 可以将十六进制的字符串转换成整数并返回。

### 根据条件进行决策

- if 语句的条件必须用圆括号“()”括起来。要声明一个代码块，可以使用花括号将它们括起来。
- 当switch语句中的特定case被匹配时，PHP将执行该case下的代码，直至遇到break语句。如果没有break语句，switch将执行这个case以下所有值为true的case中的代码。当遇到一个break语句时，才会执行switch后面的语句。

### 实例

**example-1-14.html**

```html
<form action="processorder.php" method="post">
<table>
<tr>
<td>How did you find Bob's?</td>
<td>
	<select name="find">
	<option value="a">I'm a regular customer</option>
	<option value="b">TV advertising</option>
	<option value="c">Phone directory</option>
	<option value="d">Word of mouth</option>
	</select>
	<button>submit</button>
</td>
</tr>
</table>
</form>
```

**processorder.php**

方法一：用 if 语句实现

```php
<?php
	$find=$_POST['find'];
	if($find=="a"){
	echo"<p>Regular customer.</p>";
	}elseif($find=="b"){
	echo"<p>Customer referred by TV advert.</p>";
	}elseif($find=="c"){
	echo"<p>Customer referred by phone directory.</p>";
	}elseif($find=="d"){
	echo"<p>Customer referred by word of mouth.</p>";
	}else{
	echo"<p>We do not know how this customer found us.</p>";
	}
?>
```

方法二：用 switch 实现

```php
<?php
	$find=$_POST['find'];
	switch($find){
	case"a":
	echo"<p>Regular customer.</p>";
	break;
	case"b":
	echo"<p>Customer referred by TV advert.</p>";
	break;
	case"c":
	echo"<p>Customer referred by phone directory.</p>";
	break;
	case"d":
	echo"<p>Customer referred by word of mouth.</p>";
	break;
	default:
	echo"<p>We do not know how this customer found us.</p>";
	break;
	}
?>
```

### 通过迭代实现重复动作

### 实例：循环表格数据

方法一：使用 while

```php
<html>
<body>
	<table border="0"cellpadding="3">
	<tr>
		<td bgcolor="#CCCCCC"align="center">Distance</td>
		<td bgcolor="#CCCCCC"align="center">Cost</td>
	</tr>
	<?php
		$distance=50;
		while($distance<=250){
            echo"<tr>
                <td align=\"right\">".$distance."</td>
                <td align=\"right\">".($distance/10)."</td>
            </tr>\n";
			$distance+=50;
		}
	?>
	</table>
</body>
</html>
```

方法二：使用 for

```php
<html>
<body>
	<table border="0"cellpadding="3">
	<tr>
		<td bgcolor="#CCCCCC"align="center">Distance</td>
		<td bgcolor="#CCCCCC"align="center">Cost</td>
	</tr>
	<?php
	for($distance=50;$distance<=250;$distance+=50){
		echo"<tr>
			<td align=\"right\">".$distance."</td>
			<td align=\"right\">".($distance/10)."</td>
		</tr>\n";}
	?>
	</table>
</body>
</html>
```

需要注意的一点是，我们可以将可变变量和for循环结合起来重复一系列的表单域。

例如，如果你具有名称为name1、name2、name3等的表单域，就可以像如下代码所示的这样进行处理：

```php
<?php
	for($i=1;$i<=$numnames;$i++){
		$temp="name$i";
		echo$$temp.'<br/>';//or whatever processing you want to do
	}
?>
```

通过动态地创建变量名称，可以依次访问每一个表单域。

除了for循环外，PHP还提供了foreach循环语句，它专门用于数组的使用。

### 从控制结构或脚本中跳出

终止一个循环：break

跳到下一次循环：continue

结束整个脚本的执行：exit

### 使用可替换的控制结构语法

将代码块开始的花括号（{）用冒号（：）代替

将代码块结束的花括号（}）用 endif、endswitch、endwhile、endfor 或 endforeach 代替

对于 do...while 循环，没有可替换的语法

### 使用 declare

PHP 的另一个控制结构是 declare 结构，它并没有像其他结构一样在日常编程中经常使用。这种控制结构的常见形式如下所示：

```php
declare(directive)
{
	//block
}
```

这种结构用来设置代码块的执行指令——也就是，关于后续代码如何运行的规则。

目前，只实现了一个执行指令，ticks。它可以通过插入指令ticks=n来设置。它允许在代码块内部每隔n行代码运行特定的函数，这对于性能测试和调试来说是非常有用的。

在这里，介绍declare控制结构只是为了完整性的考虑。

### 补充说明

- PHP的特性之一就是它不要求在使用变量之前声明变量，当第一次给一个变量赋值时，你才创建了这个变量。

## 数据的存储与检索

- 保存数据以便后期使用
- 打开文件
- 创建并写入文件
- 关闭文件
- 读文件
- 给文件加锁
- 删除文件
- 其他有用的文件操作函数
- 更好的方式：数据库管理系统

### 保存数据以便后期使用

存储数据有两种基本方法：保存到普通文件（flat file），或者保存到数据库中。

文件的读写操作与大多数编程语言的文件读写操作是类似的。

### 存储和检索订单

根据表单提交的 method 不同，我们可以通过`$_REQUEST['address']`或`$_POST['address']`或`$_GET['address']`访问这个变量。

### 文件处理

将数据写入一个文件，有以下3步操作。

1. 打开这个文件。如果文件不存在，需要先创建它。
2. 将数据写入这个文件。
3. 关闭这个文件。

同样，从一个文件中读出数据，也有以下3步操作。

1. 打开这个文件。如果这个文件不能打开（例如，文件不存在），就应该意识到这一点并且正确地退出。
2. 从文件中读出数据。
3. 关闭这个文件。

当希望从一个文件中读出数据时，可以选择一次从文件读取多少数据。

### 打开文件

```php
$DOCUMENT_ROOT=$_SERVER['DOCUMENT_ROOT'];
$fp=fopen("$DOCUMENT_ROOT/../orders/orders.txt",'w');
```

第一个参数：路径

$DOCUMENT_ROOT 是 PHP 内置变量，它指向 Web 服务器文档树的根。用“..”表示文档根目录的父目录。

在PHP代码中，只有少数人会使用反斜线，因为这意味着代码只能在Windows上运行。

如果使用了正斜线，代码不需要任何修改就可以在Windows和UNIX机器上运行。

第二个参数：文件模式

在这个例子中，我们将"w"传给了fopen()——这就意味着要以写的方式打开这个文件。

- [详细参考](http://php.net/manual/zh/function.fopen.php)

#### 通过 FTP 或 HTTP 打开文件

使用 fopen() 函数通过 FTP、HTTP 或其他协议来打开文件。

在 php.ini 文件中，可以通过关闭 allow_url_fopen 指令来禁用这个功能。如果在使用该函数打开一个远程文件时遇到问题，请检查php.ini文件。

注意，URL 中的域名不区分大小写，但是路径和文件名可能会区分大小写。

#### 打开文件时可能遇到的问题

- 权限不足：更改当前用户的权限

### 写文件

```php
fwrite($fp,$outputstring);
```

这个函数告诉 PHP 将保存在`$outputstring`中的字符串写入到`$fp`指向的文件中。

对于 `$outputstring` 来说，自行构造字符串，进行存储。例如，我们构造一个表示数据文件中一条记录的字符串。可以使用如下所示语句：

```php
$outputstring=$date."\t".$tireqty."tires\t".$oilqty."oil\t".$sparkqty."spark plugs\t\$".$totalamount."\t".$address."\n";
```

在这个简单的例子中，我们将每一个订单记录保存在文件的一行中。我们选择每行记录一个订单这种格式是因为这样可以使用换行字符作为简单的记录间隔符。由于换行字符并不是可见的，因此我们使用控制序列"\n"来表示。

分隔字符或定界字符**一定不能出现在输入**中，或者我们对输入进行处理，将分隔符删除或者进行转义处理。在第4章中详细介绍输入的处理。

- [详细参考](http://php.net/manual/zh/function.fwrite.php)

### 关闭文件

```php
fclose($fp);
```

如果该文件被成功地关闭，函数将返回一个true值。反之，该函数将返回false。

### 读文件

- 以只读方式打开文件 `fopen("path",'rb')`
- 知道何时读完文件 `feof($fp)`
- 每次读取一行数据 `fgets()`、`fgetss()`、`fgetcsv()`
- 读取整个文件 `readfile()`、`fpassthru()`、`file()`
- 读取一个字符 `fgetc()`
- 读取任意长度 `fread()`

### 实例

**vieworders.php**

```php
<?php
	//构建一个简短风格的变量
	$DOCUMENT_ROOT=$_SERVER['DOCUMENT_ROOT'];
?>
<html>
<head>
	<title>2.7# 实例</title>
</head>
<body>
	<h2>用户订单</h2>
	<?php
	@$fp=fopen("$DOCUMENT_ROOT/../orders/orders.txt",'rb');
	if(!$fp){
		echo"<p><strong>没有找到文件，请重试。</strong></p>";
		exit;
	}
	while(!feof($fp)){
		//循环读取每条记录，直到文件结束
		$order=fgets($fp,999); //从 $fp 指向的文件中读取一行
		echo$order."<br/>";
	}
	?>
</body>
```

### 使用其他有用的文件函数

- 查看文件是否存在 `file_exists()`
- 确定文件大小 `filesize()`
- 删除一个文件 `unlink()`
- 在文件中定位 `rewind()`、`fseek()`、`ftell()`

### 文件锁定

假设遇到这种情况，两个客户试图同时订购同一件商品（这种情况并不少见，尤其是当网站上遇到某种程度的网络堵塞的时候。）如果一个客户调用 fopen() 函数打开一个文件并且开始写这个文件，而此时其他客户也调用了 fopen() 函数打开这个文件并且要写这个文件，将会出现什么情况呢？文件的最终内容是什么？会是第一个订单后面就是第二个订单吗？还是恰好相反呢？订单是第一个客户的还是第二个客户的？或者将变成一些没用的东西，就像两个订单交错在一起？这些问题的答案取决于操作系统，但是，通常都是不可知的。

为了避免这样的问题，可以使用文件锁定的方法。在PHP中，文件锁定是通过flock()函数来实现的。当一个文件被打开并且在进行读写操作之前，应该调用这个函数。

flock()函数原型如下所示：

```php
bool flock(resource fp,int operation[,int＆wouldblock])
```

- [详细参考](http://php.net/manual/zh/function.flock.php)

### 更好的方式：数据库管理系统

使用普通文件处理数据时，有些列几个局限性：

- 当文件变大时，使用普通文件将会变得非常慢。
- 在一个普通文件中查找特定的一个或者一组记录将会非常困难。
- 处理并发访问可能会遇到问题。
- 文件读取都是从一开始读到结束，如果想插入或者删除中间记录会比较困难。
- 除了使用文件访问权限作为限制外，还没有一个简单的方法可以区分不同级别的数据访问。

关系型数据库管理系统（RDBMS）可以解决以上所有问题：

- RDBMS 提供了比普通文件更快的数据访问。
- RDBMS 可以很容易地查找并检索满足特定条件的数据集合。
- RDBMS 具有内置的处理并发访问的机制。
- RDBMS 可以随机访问数据。
- RDBMS 具有内置的权限系统。

### 进一步学习

- 参考：[文件系统](http://www.php.net/filesystem)

## 使用数组

- 数字索引数组
- 非数字索引数组
- 数组操作符
- 多维数组
- 数组排序
- 数组函数

### 什么是数组

一个数组就是一个用来存储一系列变量值的命名区域，因此，可以使用数组组织标量变量。

### 数字索引数组

在PHP中，数字索引的默认值是从0开始的，当然也可以改变它。

#### 数字索引数组的初始化

```php
$products=array('Tires','Oil','Spark Plugs'); //初始化数组
$numbers=range(1,10); //按照升序排列自动创建数组
$letters=range('a','z');
```

#### 访问数组的内容

```php
$products[0]; //查看元素的值
$products[3]='Fuses'; //修改元素的值
for($i=0;$i＜3;$i++){
    //循环访问数组的内容，也可以使用 foreach()
	echo $products[$i]."";
}
foreach($products as $current){
    //专门为数组设计的一个函数，功能和上面的 for 循环一样
	echo $current."";
}
```

### 使用不同索引的数组：关联数组

在 `$products` 数组中，允许 PHP 为每个元素指定一个默认的索引。这就意味着，所添加的第一个元素为元素 0，第二个为元素 1 等。PHP 还支持关联数组。在关联数组中，可以将每个变量值与任何关键字或索引关联起来。

```php
/* 创建数组 */
// 方法一：
$prices=array('Tires'=>100,'Oil'=>10,'Spark Plugs'=>4); //初始化关联数组：产品名称为关键字、价格为键值
// 方法二：
$prices['Tires']=100;
$prices['Oil']=10;
$prices['Spark Plugs']=4;

/* 访问数组元素 */
// 方法一：
$prices['Tires'];
$prices['Oil'];
$prices['Spark Plugs'];
// 方法二：
// 因为关联数组的索引不是数字，因此无法在for循环语句中使用一个简单的计数器对数组进行操作。但是可以使用foreach循环或list()和each()结构。如下所以两种方式：
foreach($prices as $key=>$value){
	echo$key."-".$value."<br/>";
}

while( $element = each($prices) ){
    echo $element['key'];
    echo "-";
    echo $element['value'];
    echo "<br/>";
}
```

### 数组操作符

- 详情参考**[链接](http://www.php.net/manual/zh/language.operators.array.php)**

### 多维数组

```php
$products=array(array('TIR','Tires',100),
array('OIL','Oil',10),
array('SPK','Spark Plugs',4));
```

- 和一维数组类似，可以使用关联数组创建数组（方便查找）

### 数组排序

一维数组

- 使用 `sort()` 函数，默认升序排列
- 使用 `asort()` 函数和 `ksort()`  函数对关联数组排序，默认升序
- 反向排序 `rsort()`、`arsort()`、`krsort()`，降序排列

多维数组

- 用户自定义排序规则，并借用内置函数 `usort()`、`uasort()`、`uksort()`

  ```php
  // 需要进行排序的数组
  $products=array(array('TIR','Tires',100),
  array('OIL','Oil',10),
  array('SPK','Spark Plugs',4));
  
  // 对第二列进行排序
  function compare($x,$y){
      if($x[1]==$y[1]){
      	return 0;
      }else if($x[1]<$y[1]){
      	return-1;
      }else{
          return 1;
      }
  }
  usort($products,'compare');
  ```

- 反向排序时，将上面的自定义排序函数，-1 改成 1，1 改成 -1。

### 对数组进行重新排序

- 将数组各元素进行随机排序 `shuffle()`
- 将原来的数组进行反向排序 `array_reverse()`

### 从文件载入数组

### 实例：读取订单内容

```php
<?php
	//使用简短风格的路径
	$DOCUMENT_ROOT=$_SERVER['DOCUMENT_ROOT'];
?>
<html>
<head>
	<title>3.8# 实例</title>
</head>
<body>
	<h2>用户订单：对格式已经进行了修改</h2>
	<?php
	//读取整个文件
	//每个订单都是一个数组元素（一条记录）
	$orders=file("$DOCUMENT_ROOT/../orders/orders.txt");
	//计算订单数量
	$number_of_orders=count($orders);
	if($number_of_orders==0){
		echo"<p><strong>没有订单，请联系客户</strong></p>";
	}
	echo"<table border=\"1\">\n";
	echo"<tr><th bgcolor=\"#CCCCFF\">Order Date</th>
	<th bgcolor=\"#CCCCFF\">Tires</th>
	<th bgcolor=\"#CCCCFF\">Oil</th>
	<th bgcolor=\"#CCCCFF\">Spark Plugs</th>
	<th bgcolor=\"#CCCCFF\">Total</th>
	<th bgcolor=\"#CCCCFF\">Address</th>
	<tr>";
	for($i=0;$i<$number_of_orders;$i++){
		//分隔字段，使用了内置函数 explode()
		$line=explode("\t",$orders[$i]);
		//仅记录每个订单的数字，舍弃字母和其他，使用了内置函数 intval()
		$line[1]=intval($line[1]);
		$line[2]=intval($line[2]);
		$line[3]=intval($line[3]);
		//输出订单
		echo"<tr>
		<td>".$line[0]."</td>
		<td align=\"right\">".$line[1]."</td>
		<td align=\"right\">".$line[2]."</td>
		<td align=\"right\">".$line[3]."</td>
		<td align=\"right\">".$line[4]."</td>
		<td>".$line[5]."</td>
		</tr>";
	}
	echo"</table>";
	?>
</body>
</html>
```

### 执行其他数组操作

- 获取当前元素值后，指针指向下一个元素 `each()`
- 获取当前指针的位置 `current($array_name)`
- 令指针指向下一个元素，并返回下一个元素值 `next()`
- 令指针指向上一个元素，并返回上一个元素值 `prev()`
- 令指针指向第一个元素 `reset()`
- 令指针指向最后一个元素 `end()`
- 对数组的每一个元素应用任意函数 `array_walk()`
- 统计数组元素个数 `count()`、`sizeof()`、`array_count_values()`
- 将数组转换成标量变量 `extract()`

### 进一步学习

- 参考链接：http://www.php.net/array

## 字符串操作与正则表达式

- 字符串的格式化
- 字符串的连接和分割
- 字符串的比较
- 使用字符串函数匹配和替换子字符串
- 使用正则表达式

### 实例：智能表单邮件

**processfeedback.php**

说明：未事先安装 mail 服务器和配置，邮件发不出去。解决方案可以参考 [这里](https://zhidao.baidu.com/question/400036788.html)

```php
<?php
	//使用简短风格的变量
	$name=$_POST['name'];
	$email=$_POST['email'];
	$feedback=$_POST['feedback'];
	//设置一些固定信息
	$toaddress="thethomason@foxmail.com"; //收件人地址
	$subject="Feedback from web site"; //标题
	$mailcontent="Customer name:".$name."\n".
	"Customer email:".$email."\n".
	"Customer comments:\n".$feedback."\n";
	$fromaddress="From:webserver@example.com";
	//使用php内置函数 mail() 发送邮件
	mail($toaddress,$subject,$mailcontent,$fromaddress);
?>
<html>
<head>
	<title>4.1# 实例</title>
</head>
<body>
    <h1>提交反馈</h1>
    <p>您的意见已经成功的送达</p>
</body>
</html>	
```

**feedback.html**

```html
<form action="processfeedback.php" method="post">
<table>
	<tr>
		<td>name:</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>email: </td>
		<td><input type="email" name="email"></td>
	</tr>
	<tr>
		<td>feedback:</td>
		<td><textarea name="feedback" id="" cols="30" rows="10"></textarea></td>
	</tr>
	<tr>
		<td><button>submit</button></td>
	</tr>
</table>
</form>
```

### 字符串的格式化

- 字符串的整理 `chop()`、`ltrim（）`、`trim()`
- 使用 HTML 格式化（主要变换换行） `nl2br()`
- 为打印输出而格式化字符串 `printf()`、`sprintf()`，这点和 C 语言一样
- 改变字符串中的字母大小写 `strtoupper()`、`strtolower()`、`ucfirst()`、`ucwords()`
- 格式化字符串以便存储到**数据库** `addslashes()`、`stripslashes()`

### 用字符串函数连接和分割字符串

- 分割字符串（分隔符是一个字符） `explode()`

  > 当域名是大写或者大小写混合，这个函数无法正常使用

- 分割字符串（分隔符是字符串【多个字符】） `strtok()`

- 拼接字符串 `implode()`、`join()`

- 从指定位置截取字符串 `substr()`

### 字符串的比较

- 字符串的排序 `strcmp()`、`strcasecmp()`、`strnatcmp()`、`strnatcasecmp()`
- 测试字符串的长度  `strlen()` 

### 匹配和替换子字符串

- 查找字符串 `strstr()`、`strchr()`、`strrchr()`、`stristr()`

  > ```php
  > // 智能表单应用程序中，可以根据出现的关键词决定邮件发送的目标邮件地址
  > $toaddress='feedback@example.com';//默认邮件地址
  > //根据关键字改变收件人
  > if(strstr($feedback,'shop'))
  > 	$toaddress='retail@example.com';
  > else if(strstr($feedback,'delivery'))
  > 	$toaddress='fulfillment@example.com';
  > else if(strstr($feedback,'bill'))
  > 	$toaddress='accounts@example.com';
  > ```

- 查找子字符串的位置 `strpos()`、`strrpos()`

  > 在运行速度上，`strpos()`比`strstr()`要快，因此在新版 PHP 中使用`strpos()`

- 替换子字符串 `str_replace()`、`substr_replace()`

### 正则表达式的介绍

到目前为止，我们进行的所有模式匹配都使用了字符串函数。我们只限于进行精确匹配，或精确的子字符串匹配。如果希望完成一些更复杂的模式匹配，应该用正则表达式。正则表达式在开始时候很难掌握，但却是非常有用的。

#### 基础知识

以某种特殊的规则进行模糊的匹配

#### 字符集和类

字符集可以用于匹配属于特定类型的任何字符；事实上它们是一种通配符。例如，正则表达式 

```php
.at
```

可以与"cat"、"sat"和"mat"等进行匹配，也可以匹配"#at"。通常，这种通配符匹配用于操作系统中的文件名匹配。

如果要限定它是a到z之间的字符，就可以像下面这样指明：

```
[a-z]at

```

任何包含在方括号（[]）中的内容都是一个字符类——一个被匹配字符所属的字符集合。请注意，方括号中的表达式只匹配一个字符。

此外，还可以用集合来指明字符不属于某个集。例如：

```
[^a-z]

```

可以用来匹配任何不在a和z之间的字符。当把脱字符号（^）包括在方括号里面时，表示否。当该符号用在方括号的外面，则表示另外一个意思。

**POSIX字符集** 

- [表格参考](https://blog.csdn.net/joeblackzqq/article/details/7216046)
- 详细参考：[正则表达式](http://php.net/manual/zh/book.pcre.php)

####  重复

通常，读者会希望指明某个字符串或字符类将不止一次地出现。可以在正则表达式中使用两个特殊字符代替。符号“*”表示这个模式可以被重复0次或更多次，符号“+”则表示这个模式可以被重复1次或更多次。这两个符号应该放在要作用的表达式的后面。例如：

```
[[:alnum:]]+

```

表示“至少有一个字母字符”。

#### 子表达式

通常，将一个表达式分隔为几个子表达式是非常有用的，例如，可以表示“至少这些字符串中的一个需要精确匹配”。可以使用圆括号来实现，与在数学表达式中的方法一样。例如：

```
(very)*large

```

可以匹配"large"、"very large"、"very very large"等。

#### 子表达式计数

可以用在花括号（{}）中的数字表达式来指定内容允许重复的次数。可以指定一个确切的重复次数（{3}表示重复3次），或者一个重复次数的范围（{2，4}表示重复2～4次），或是一个开底域的重复范围（{2，}表示至少要重复两次）。例如：

```
(very){1,3}

```

表示匹配"very"、"very very"和"very very very"。

#### 定位到字符串的开始或末尾

[a-z]模式将匹配任何包含了小写字母字符的字符串。无论该字符串只有一个字符，或者在整个更长的字符串中只包含一个匹配的字符，都没有关系。

也可以确定一个特定的子表达式是否出现在开始、末尾或在两个位置都出现。当要确定字符串中只有要找的单词而没有其他单词出现时，它将相当有用。

脱字符号（^）用于正则表达式的开始，表示子字符串必须出现在被搜索字符串的开始处，字符“$”用于正则表达式的末尾，表示子字符串必须出现在字符串的末尾。

例如，以下是在字符串开始处匹配bob：

```
^bob

```

以下将匹配com出现在字符串末尾处的字符串：

```
com$

```

最后，下面的模式将匹配只包含a到z之间一个字符的字符串：

```
^[a-z]$

```

#### 分支

可以使用正则表达式中的一条竖线来表示一个选择。例如，如果要匹配com、edu或net，就可以使用如下所示的表达式：

```
com|edu|net

```

#### 匹配特殊字符

如果要匹配本节前面提到过的特殊字符，例如，.、{或者$，就必须在它们前面加一个反斜杠（\）。如果要匹配一个反斜杠，则必须用两个反斜杠（\\）来表示。

在PHP中，**必须将正则表达式模式包括在一个单引号字符串中**。使用双引号引用的正则表达式将带来一些不必要的复杂性。PHP还使用反斜杠来转义特殊字符——例如反斜杠。

如果希望在模式中匹配一个反斜杠，必须使用两个反斜杠来表示它是一个反斜杠字符，而不是一个转义字符。

如果要匹配本节前面提到过的特殊字符，例如，.、{或者$，就必须在它们前面加一个反斜杠（\）。如果要匹配一个反斜杠，则必须用两个反斜杠（\\）来表示。

在PHP中，必须将正则表达式模式包括在一个单引号字符串中。使用双引号引用的正则表达式将带来一些不必要的复杂性。PHP还使用反斜杠来转义特殊字符——例如反斜杠。

如果希望在模式中匹配一个反斜杠，必须使用两个反斜杠来表示它是一个反斜杠字符，而不是一个转义字符。

####  特殊字符一览

[**在 POSIX 正则表达式中，用于方括号外面特殊字符的摘要**](http://blog.sina.com.cn/s/blog_4f925fc30100kn4k.html)

[**在 POSIX 正则表达式中，用于方括号里面特殊字符的摘要**](http://blog.sina.com.cn/s/blog_4f925fc30100kn4k.html)

#### 在智能表单中的应用

- 一次查找多个关键词，使用 `|` 字符

- 验证程序中的电子邮件地址 ，表达式格式为`^[a-zA-Z0-9_\-.]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+$`

  > 请注意，当在一个字符类的开始或末尾处使用点号时，点号将失去其特殊通配符的意义，只能成为一个点号字符。
  >
  > 字符组合“\.”匹配“.”字符。我们在字符类外部使用点号，因此必须对其转义，使其能够匹配一个点号字符。

### 用正则表达式查找子字符串

使用函数 `ereg()`和 `eregi()`

### 实例：使用正则表达式对智能表单的修改

```php
if(!eregi('^[a-zA-Z0-9_\-\.]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$',$email)){
    echo"<p>这不是一个正确的邮箱。</p>".
    "<p>未能送出，请检查收件人邮箱是否正确.</p>";
    exit;
}
	$toaddress="feedback@example.com";//默认收件人
if(eregi("shop|customer service|retail",$feedback))
	$toaddress="retail@example.com";
}else if(eregi("deliver|fulfill",$feedback)){
	$toaddress="fulfillment@example.com";
}else if(eregi("bill|account",$feedback)){
	$toaddress="accounts@example.com";
}
if(eregi("bigcustomer\.com",$email)){
	$toaddress="bob@example.com";
}
```

### 用正则表达式替换子字符串

使用函数 `ereg_replace()` 和 `eregi_replace()`

### 使用正则表达式分割字符串

使用函数 `split()`

### 进一步学习

- 参考链接：[正则表达式函数](http://php.net/manual/zh/ref.regex.php)

## 代码重用与函数编写

- 代码重用的好处
- 使用 require() 和 include() 函数
- 函数介绍
- 定义函数
- 使用函数
- 理解作用域
- 返回值
- 参数的引用调用和值调用
- 实现递归
- 使用命名空间

### 代码重用的好处

- 降低成本
- 提高可靠性
- 保持一致性

### 使用 require() 和 include() 函数

require()和include()几乎是相同的。二者唯一的区别在于函数失败后，require()函数将给出一个致命的错误。而include()只是给出一个警告。

require()和include()也有两个变体函数，分别是require_once()和include_once()。使用这两个函数可以防止错误的引入同样的函数库两次，从而出现重复定义的错误。

引用文件时，相当于把文件的内容复制到了引用该文件的地方。

#### 使用 require() 制作 Web 站点的模板

对整个页面的代码进行拆分，提取公共部分进行统一的编写代码。

原始页面：**home.html**

```html
<html>
<head>
  <title>TLA Consulting Pty Ltd</title>
  <style type="text/css">
    h1 {color:white; font-size:24pt; text-align:center;
        font-family:arial,sans-serif}
    .menu {color:white; font-size:12pt; text-align:center;
           font-family:arial,sans-serif; font-weight:bold}
    td {background:black}
    p {color:black; font-size:12pt; text-align:justify;
       font-family:arial,sans-serif}
    p.foot {color:white; font-size:9pt; text-align:center;
            font-family:arial,sans-serif; font-weight:bold}
    a:link,a:visited,a:active {color:white}
  </style>
</head>
<body>

  <!-- page header -->
  <table width="100%" cellpadding="12" cellspacing="0" border="0">
  <tr bgcolor="black">
    <td align="left"><img src="logo.gif" alt="TLA logo" height="70" width="70" /></td>
    <td>
        <h1>TLA Consulting</h1>
    </td>
    <td align="right"><img src="logo.gif" alt="TLA logo" height="70" width="70" /></td>
  </tr>
  </table>

  <!-- menu -->
  <table width="100%" bgcolor="white" cellpadding="4" cellspacing="4">
  <tr >
    <td width="25%">
      <img src="s-logo.gif" alt="" height="20" width="20" /> 
      <span class="menu">Home</span></td>
    <td width="25%">
      <img src="s-logo.gif" alt="" height="20" width="20" />  
      <span class="menu">Contact</span></td>
    <td width="25%">
      <img src="s-logo.gif" alt="" height="20" width="20" /> 
      <span class="menu">Services</span></td>
    <td width="25%">
      <img src="s-logo.gif" alt="" height="20" width="20" /> 
      <span class="menu">Site Map</span></td>
  </tr>
  </table>

  <!-- page content -->
  <p>Welcome to the home of TLA Consulting.
  Please take some time to get to know us.</p>
  <p>We specialize in serving your business needs
  and hope to hear from you soon.</p>

  <!-- page footer -->
  <table width="100%" bgcolor="black" cellpadding="12" border="0">
  <tr>
    <td>
      <p class="foot">&copy; TLA Consulting Pty Ltd.</p>
      <p class="foot">Please see our 
        <a href="legal.php">legal information page</a></p>
    </td>
  </tr>
  </table>
</body>
</html>
```

对原始页面进行拆分：**home.php**

```php
<?php
  require('header.php');
?>
  <!-- page content -->
  <p>Welcome to the home of TLA Consulting.
  Please take some time to get to know us.</p>
  <p>We specialize in serving your business needs
  and hope to hear from you soon.</p>
<?php
  require('footer.php');
?>
```

**header.php**

```php
<html>
<head>
  <title>TLA Consulting Pty Ltd</title>
  <style type="text/css">
    h1 {color:white; font-size:24pt; text-align:center;
        font-family:arial,sans-serif}
    .menu {color:white; font-size:12pt; text-align:center;
           font-family:arial,sans-serif; font-weight:bold}
    td {background:black}
    p {color:black; font-size:12pt; text-align:justify;
       font-family:arial,sans-serif}
    p.foot {color:white; font-size:9pt; text-align:center;
            font-family:arial,sans-serif; font-weight:bold}
    a:link,a:visited,a:active {color:white}
  </style>
</head>
<body>

  <!-- page header -->
  <table width="100%" cellpadding="12" cellspacing="0" border="0">
  <tr bgcolor="black">
    <td align="left"><img src="logo.gif" alt="TLA logo" height="70" width="70"></td>
    <td>
        <h1>TLA Consulting</h1>
    </td>
    <td align="right"><img src="logo.gif" alt="TLA logo" height="70" width="70" /></td>
  </tr>
  </table>

  <!-- menu -->
  <table width="100%" bgcolor="white" cellpadding="4" cellspacing="4">
  <tr >
    <td width="25%">
      <img src="s-logo.gif" alt="" height="20" width="20" />
      <span class="menu">Home</span></td>
    <td width="25%">
      <img src="s-logo.gif" alt="" height="20" width="20" />
      <span class="menu">Contact</span></td>
    <td width="25%">
      <img src="s-logo.gif" alt="" height="20" width="20" />
      <span class="menu">Services</span></td>
    <td width="25%">
      <img src="s-logo.gif" alt="" height="20" width="20" />
      <span class="menu">Site Map</span></td>
  </tr>
  </table>
```

**footer.php**

```php
<!-- page footer -->
  <table width="100%" bgcolor="black" cellpadding="12" border="0">
  <tr>
    <td>
      <p class="foot">&copy; TLA Consulting Pty Ltd.</p>
      <p class="foot">Please see our <a href="legal.php">
      legal information page</a></p>
    </td>
  </tr>
  </table>
</body>
</html>


```

#### 使用 atuo_prepend_file 和 auto_append_file

作用和 include() 函数一样

在 Windows 中，其设置如下：

```
auto_prepend_file="c:/Program Files/Apache Software
Froundation/Apache2.2//include/header.php"
auto_append_file="c:/Program Files/Apache Group/Apache2/include/footer.php"

```

在 UNIX 中，其设置如下：

```
auto_prepend_file="/home/username/include/header.php"
auto_append_file="/home/username/include/footer.php"

```

### 在 PHP 中使用函数

- 调用函数 `function_name('parameter')`
- 函数调用不区分大小写，但是建议都用小写字母，符合多数人的命名习惯（变量名称区分大小写）

### 函数的基本结构

```php
function my_function(){
    echo 'My function was called';
}

// 需要注意的是，下面的格式是合法的。中间可以插入 HTML
<?php
function my_function(){
?>
	My function was called
<?php
}
?>
```

函数的名称要精炼且有描述性，PHP 不支持重载。

### 作用域

- 在函数内部声明的变量作用域是从声明它们的那条语句开始到函数末尾。这叫做函数作用域。这些变量称为局部变量。
- 在函数外部声明的变量作用域是从声明它们的那条语句开始到文件末尾，而不是函数内部。这叫做全局作用域。这些变量称为全局变量。
- 特殊的超级全局变量在函数内部和外部都是可见的。
- 使用require()和include()并不影响作用域。如果这两个语句用于函数内部，函数作用域适用。如果它不在函数内部，全局作用域适用。
- 关键字"global"可以用来手动指定一个在函数中定义或使用的变量具有全局作用域。
- 通过调用unset($variable_name)可以手动删除变量。如果变量被删除，它就不在参数所指定的作用域中了。

### 参数的引用传递和值传递

- 引用传递 `&parameter`
- 值传递 `$parameter`

### 函数返回值

- 使用关键字 `return`
- `return` 关键字还可以使函数提前结束

### 实现递归

递归函数就是函数调用自己本身。

当递归方法的代码比循环方法的代码更简短、更美观的时候，我们可能会选择使用递归，但是在应用领域通常不会这样。

虽然递归看上去更美观，但程序员常会忘记给出递归的终止条件。这意味着函数会一直重复下去直到服务器内存耗尽，或者达到了最大调用次数。

### 命名空间

名称空间是一个抽象的容器，它可以包含一组标识符；在PHP中，名称空间可以包含你所定义的函数，常量以及类。从结构的角度看，为自定义函数和类定义名称空间的优点包括如下：

- 一个名称空间中的所有函数、类和常量都将自动冠以名称空间前缀。
- 非全路径的类、函数和常量名称将在运行时解析，在查看全局空间之前，将首先查看名称空间。
- 详细参考：[PHP手册](http://jp2.php.net/language.namespaces)

### 进一步学习

include()、require()、function和return的用法在联机手册中也有介绍，可以作为[参考](http://jp2.php.net/manual/zh/language.control-structures.php)。

## 面向对象的 PHP

- 面向对象的概念
- 类、属性和操作
- 类属性
- 类常量
- 类方法的调用
- 继承
- 访问修饰符
- 静态方法
- 类型提示
- 延迟静态绑定
- 对象克隆
- 抽象类
- 类设计
- 设计的实现
- 高级的面向对象功能

### 理解面向对象的概念

对现实中的实物可以进行分类，比如：水果，蔬菜等。同样，对软件可以进行类似的分类，这些类中的具体某个事物就是对象。我们不能从外部改变对象的属性，但是却可以从外部操作对象，我们实现操作也就是对象的接口，通过这种方式，我们可以间接的改变对象的属性。

- 多态性
- 继承

### 在 PHP 中创建类、属性和操作

1. **类的结构**

 `calss classname{ }`，在中可以指定属性值和定义函数

1. **构造函数**

创建一个对象时，它将调用构造函数，通常，这将执行一些有用的初始化任务，例如，设置属性的初始值或者创建该对象需要的其他对象。

构造函数的名称必须是 `__construct()`，注意是双下划线。支持函数重载。

1. **析构函数**

与构造函数相对的就是析构函数。析构函数允许在销毁一个类之前执行一些操作或完成一些功能，这些操作或功能通常在所有对该类的引用都被重置或超出作用域时自动发生。

与构造函数的名称类似，一个类的析构函数名称必须是`__destruct()`。析构函数不能带有任何参数。

### 类的实例化

```php
$var=new classname("paremeter");
```

### 使用类的属性

使用 `$this` 指针访问当前类的属性

```php
class classname
{
    public $attribute;
    function operation($param){
        $this -> attribute=$param
        echo $this -> attribute;
    }
}
```

这个例子没有对属性设置限制的访问，因此可以按照如下所示的方式从类外部访问属性：

```php
class classname{
	public $attribute;
}
$a = new classname();
$a -> attribute="value";
echo $a -> attribute;
```

通常，从类的外部直接访问类的属性是糟糕的想法。面向对象方法的一个优点就是鼓励使用封装。可以通过使用`__get()`和`__set()`函数来实现对属性的访问。如果不直接访问一个类的属性而是编写访问函数，那么可以通过一段代码执行所有访问。

### 使用 private 和 public 关键字控制访问

- 默认选项是public，这意味着如果没有为一个属性或方法指定访问修饰符，它将是public。公有的属性或方法可以在类的内部和外部进行访问。
- private访问修饰符意味着被标记的属性或方法只能在类的内部进行访问。如果没有使用`__get()`和`__set()`方法，你可能会对所有属性都使用这个关键字。也可以选择使得部分方法成为私有的，例如，如果某些方法只是在类内部使用的工具性函数。私有的属性和方法将不会被继承。
- protected访问修饰符意味着被标记的属性或方法只能在类内部进行访问。它也存在于任何子类，即可以被继承。

### 类操作的调用

创建一个名称为 `$a` 的对象

```php
$a=new classname();
```

通过该类的函数，操作 `$a` 对象的属性

```php
$x=$a->operation1();
$y=$a->operation2(12,"test");
```

### 在 PHP 中实现继承

如果类是另一个类的子类，可以用关键字“extends”来指明其继承关系。如下代码创建了一个名为B的类，它继承了在它前面定义的类A。

```php
class B extends A{
    
    public $attribute2;
    function operation2(){
        
    }
}
```

类 B 具有类 A 的 public 和 protect 属性或者函数，也可以声明自己的附加属性。

#### 重载

在子类中使用与父类**相同**的变量或者函数名称，但是却定义了不同的值或功能。

在子类中要调用父类的函数可以使用 `parent` 关键字，需要注意到，虽然调用了父类的操作，但是PHP将使用当前类的**属性值**。

#### 使用 final 关键字禁止继承和重载

#### 理解多重继承

PHP 不支持多多重继承，也就是一个子类最多只能有一个父类。

#### 实现接口

如果需要实现多重继承功能，在 PHP 中，可以通过接口。

这个功能类似于其他面向对象编程语言所支持的接口实现，包括 Java。

接口的思想是指定一个实现了该接口的类必须实现的一系列函数。例如：

```php
interface Displayable{
	function display();
}

class webPage implements Displayable{
	function display(){
    	//...
    }
}
```

以上代码示例说明了多重继承的一种解决办法，因为webPage类可以继承一个类，同时又可以实现一个或多个接口。

如果没有实现接口中指定的方法（在这个例子中是display()方法），将产生一个致命错误。

### 类的设计

如果准备创建一个Page类，其主要目的是减少创建一个新页面所需的HTML代码。这样在修改页面的时候只要修改页面不同的部分，而相同的部分会自动生成。该类应该为建立新页面提供灵活的框架，但不应该限制创作的自由。

由于我们是通过动态脚本语言而不是静态的HTML来创建页面的，所以可以在页面上增加许多巧妙的东西，其中包括如下所示的功能：

- 允许在需要修改某些页面元素的时候，只在一处进行修改。例如，如果要修改“注册商标”提示或增加一个按钮，只需在一个地方修改即可。
- 页面大部分区域都有默认内容，但能够在需要的地方修改每个元素，定制如标题或标签这类元素的值。
- 识别哪一个页面是当前浏览页，并相应改变导航条——例如，在首页中有一个指向首页的链接是没有意义的。
- 允许使用特定的页面代替标准页面。例如，如果需要在网站的不同地方使用不同的导航条，应该能够替换掉标准导航条。

### 实例：编写类代码

**说明**

- 被 `<?php ?>` 包含的是 PHP 代码，没被包含的是 HTML 代码。
- 因为没有图片，所以会有些不正常，但是不影响理解

**page.inc**：定义一个通用的页面格式

```php
<?php
class Page{
	// Page类的属性
	public $content;
	public $title="TLA Consulting Pty Ltd";
	public $keywords="TLA Consulting,Three Letter Abbreviation, 
		some of my best friends are search engines";
	public $buttons=array("Home"=>"home.php", //每个按钮指向不同的页面
		"Contact"=>"contact.php",
		"Services"=>"services.php",
		"Site Map"=>"map.php"
	);
	// 修改 Page 类的属性值
	public function __set($name,$value){
		$this->$name=$value;
}

// 整个html页面的整体布局
public function Display(){
	echo "<html>\n<head>\n";
	$this->DisplayTitle();
	$this->DisplayKeywords();
	$this->DisplayStyles();
	echo "</head>\n<body>\n";
	$this->DisplayHeader();
	$this->DisplayMenu($this->buttons);
	echo $this->content;
	$this->DisplayFooter();
	echo"</body>\n</html>\n";
}

//定义html标题格式
public function DisplayTitle(){
	echo "<title>".$this->title."</title>";
}
public function DisplayKeywords(){
	echo"<meta name=\"keywords\"
	content=\"".$this->keywords."\"/>";
}
public function DisplayStyles()
{
?>
	<style>
	h1{
		color:white;font-size:24pt;text-align:center;
		font-family:arial,sans-serif
	}
	.menu{
		color:white;font-size:12pt;text-align:center;
		font-family:arial,sans-serif;font-weight:bold
	}
	td{
		background:black
	}
	p{
		color:black;font-size:12pt;text-align:justify;
		font-family:arial,sans-serif
	}
	p.foot{
		color:white;font-size:9pt;text-align:center;
		font-family:arial,sans-serif;font-weight:bold
	}
	a:link,a:visited,a:active{
		color:white
	}
	</style>
<?php
}
public function DisplayHeader(){
?>
	<table width="100%"cellpadding="12"
	cellspacing="0"border="0">
	<tr bgcolor="black">
	<td align="left"><img src="logo.gif"/></td>
	<td>
	<h1>TLA Consulting Pty Ltd</h1>
	</td>
	<td align="right"><img src="logo.gif"/></td>
	</tr>
	</table>
<?php
}
public function DisplayMenu($buttons){
	echo"<table width=\"100%\"bgcolor=\"white\"
	cellpadding=\"4\"cellspacing=\"4\">\n";
	echo"<tr>\n";
	//计算按钮的大小
	$width=100/count($buttons);
	while(list($name,$url)=each($buttons)){
	$this->DisplayButton($width,$name,$url,
	!$this->IsURLCurrentPage($url));
	}
	echo"</tr>\n";
	echo"</table>\n";
}
// 判断按钮 URL 是否指向当前页
public function IsURLCurrentPage($url){
	if(strpos($_SERVER['PHP_SELF'],$url)==false){
		return false;
	}
	else{
		return true;
	}
}
public function	DisplayButton($width,$name,$url,$active=true){
	if($active){
		echo"<td width=\"".$width."%\">
		<a href=\"".$url."\">
		<img src=\"s-logo.gif\"alt=\"".$name."\"border=\"0\"/></a>
		<a href=\"".$url."\"><span class=\"menu\">".$name."</span></a>
		</td>";
	}
	else{
		echo"<td width=\"".$width."%\">
		<img src=\"side-logo.gif\">
		<span class=\"menu\">".$name."</span>
		</td>";
	}
}
public function DisplayFooter(){
?>
	<table width="100%"bgcolor="black"cellpadding="12"border="0">
	<tr>
	<td>
	<p class="foot">＆copy;TLA Consulting Pty Ltd.</p>
	<p class="foot">Please see our<a href="">legal
	information page</a></p>
	</td>
	</tr>
	</table>
<?php
}
}

// 生成一个Page类对象$page，并且调用$page的Display()方法
$page = new Page();
$page -> Display();
?>
```

**home.php** ：page 类页面的具体实现

```php
<?php
	require("page.inc");
	$homepage=new Page();
	$homepage->content="<p>Welcome to the home of TLA Consulting.
	Please take some time to get to know us.</p>
	<p>We specialize in serving your business needs
	and hope to hear from you soon.</p>";
	$homepage->Display();
?>
```

如果希望网站的一些地方使用不同的标准页，只要将page.inc复制到名为page2.inc的新文件里，并做一些改变就可以了。这意味着每一次更新或修改page.inc时，要记得对page2.inc进行同样的修改。

一个**更好的方法**是用继承来创建新类，新类从Page类里继承大多数功能，但是必须重载需要修改的部分。

### 理解 PHP 面向对象的高级功能

####  使用 Per-Class 常量

PHP提供了Per-Class常量的思想。这个常量可以在不需要初始化该类的情况下使用，如下所示：

```php
<?php
class Math{
    const pi=3.14159;
}
    echo"Math::pi=".Math::pi."\n";
?>
```

可以通过使用::操作符指定常量所属的类来访问Per-Class常量，如以上示例所示。

#### 实现静态方法

PHP允许使用static关键字。该关键字适用于允许在未初始化类的情况下就可以调用的方法。这种方法等价于Per-Class常量的思想。

```php
class Math{
    static function squared($input){
        return $input*$input;
	}
}
echo Math::squared(8);
```

请注意，在一个静态方法中，不能使用 this 关键字。因为可能会没有可以引用的对象实例。

#### 检查类的类型和类型提示

instanceof 关键字允许检查一个对象的类型。可以检查一个对象是否是特定类的实例，是否是从某个类继承过来或者是否实现了某个接口。instanceof 关键字是一个高效率的条件操作符。例如，在前面作为类A的子类而实现的类B例子中，如下语句：

{$b instanceof B}将返回true。

{$b instanceof A}将返回true。

{$b instanceof Displayable}将返回false。

以上这些语句都是假设类A、类B和接口Displayable都位于当前的作用域；否则将产生一个错误。

此外，PHP还提供了类的类型提示的思想。通常，当在PHP中向一个函数传递一个参数时，不能传递该参数的类型。使用类类型提示，可以指定必须传入的参数类类型，同时，如果传入的参数类类型不是指定的类型，将产生一个错误。类型检查等价于instanceof的作用。例如，分析如下所示的函数：

```php
function check_hint(B $someclass){
	//...
}
```

以上示例将要求$someclass必须是类B的实例。如果按如下方式传入了类A的一个实例：

`check_hint($a);`

将产生如下所示的致命错误：

`Fatal error:Argument 1 must be an instance of B`

请注意，如果指定的是类A而传入了类B的实例，将不会产生任何错误，因为类B继承了类A。

#### 延迟静态绑定

该特性允许在一个静态继承的上下文中对一个被调用类的引用。父类可以使用子类重载的静态方法。如下所示的是PHP手册提供的延迟静态绑定示例：

```php
<?php
class A {
    public static function who() {
        echo __CLASS__;
    }
    public static function test() {
        self::who();
    }
}

class B extends A {
    public static function who() {
        echo __CLASS__;
    }
}

B::test();
?> 
```

以上代码的输出是：A

- 详细参考：[后期静态绑定](http://php.net/manual/zh/language.oop5.late-static-bindings.php)

#### 克隆对象

使用关键字 `clone` ，举个例子：

```php
$c = clone $b;
```

将创建与对象$b具有相同类的副本，而且具有相同的属性值。

也可以改变这种行为。如果不需要克隆过来的默认行为，必须在基类中创建一个`__clone()`方法。这个方法类似于构造函数或析构函数，因为不会直接调用它。当以上例所示的方式使用`clone`关键字时，该方法将被调用。在`__clone()`方法中，可以定义所需要的确切复制行为。

####  使用抽象类

PHP还提供了抽象类。这些类不能被实例化，同样类方法也没有实现，只是提供类方法的声明，没有具体实现。如下例所示：

```php
abstract operationX($param1,$param2);
```

包含抽象方法的任何类自身必须是抽象的，如下例所示：

```php
abstract class A{
	abstract function operationX($param1,$param2);
}
```

抽象方法和抽象类主要用于复杂的类层次关系中，该层次关系需要确保每一个子类都包含并重载了某些特定的方法，这也可以通过接口来实现。

#### 使用 `__call()` 重载方法

```php
public function __call($method,$p){
    if($method=="display"){
        if(is_object($p[0])){
            $this-＞displayObject($p[0]);
        }
        else if(is_array($p[0])){
            $this-＞displayArray($p[0]);
        }
        else{
            $this-＞displayScalar($p[0]);
        }
	}
}
```

`__call()`方法必须带有两个参数。第一个包含了被调用的方法名称，而第二个参数包含了传递给该方法的参数数组。我们可以决定调用哪一个方法。在这种情况下，如果一个对象传递给display()方法，可以调用displayObject()方法；如果传递的是一个数组，可以调用displayArray()；如果传递的是其他内容，可以调用displayScalar()方法。

要调用以上这段代码，首先必须实例化包含这个__call()方法（命名为重载）的类，然后再调用display()方法，如下例所示：

```php
$ov=new overload;
$ov->display(array(1,2,3));
$ov->display('cat');
```

第一个display()方法的调用将调用displayArray()方法，而第二个将调用displayScalar()方法。

请注意，要使以上代码能够使用，不用实现任何display()方法。

#### 使用 `__autoload()` 方法

另一个特殊的函数是 `__autoload()`。它不是一个类方法，而是一个单独的函数；也就是说，可以在任何类声明之外声明这个函数。如果实现了这个函数，它将在实例化一个还没有被声明的类时自动调用。

`__autoload()`方法的主要用途是尝试包含或请求任何用来初始化所需类的文件。分析如下示例：

```php
function __autoload($name){
	include_once $name.".php";
}
```

该代码实现将包括一个具有与该类相同名称的文件。

#### 实现迭代器和迭代

PHP的面向对象引擎提供了一个非常聪明的特性，也就是，可以使用foreach()方法通过循环方式取出一个对象的所有属性，就像数组方式一样。如下例所示：

```php
class myClass{
    public $a="5";
    public $b="7";
    public $c="9";
}
$x=new myClass;
foreach($x as $attribute){
echo $attribute."＜br/＞";
}
```

如果需要一些更加复杂的行为，可以实现一个iterator（迭代器）。要实现一个迭代器，必须将要迭代的类实现 `IteratorAggregate` [接口](http://php.net/manual/zh/class.iteratoraggregate.php)，并且定义一个能够返回该迭代类实例的 `getIterator` 方法。这个类必须实现 `Iterator` [接口](http://php.net/manual/zh/class.iterator.php)，该接口提供了一系列必须实现的方法。

#### 实例

```php
<?php

class ObjectIterator implements Iterator{
	private $obj;
	private $count;
	private $currentIndex;
	function __construct($obj){
		//初始化对象，并记录数组元素的个数
		$this->obj=$obj;
		$this->count=count($this->obj->data);
	}
	function rewind(){
		//将对象的当前指针位置恢复成 0，即复位。
		$this->currentIndex=0;
	}
	function valid(){
		//如果当前指针的位置没有在序列的结尾，返回为 TRUE
		return $this->currentIndex<$this->count;
	}
	function key(){
		//返回当前指针的位置
		return $this->currentIndex;
	}
	function current(){
		//返回当前指针对应的值
		return $this->obj->data[$this->currentIndex];
	}
	function next(){
		//将指针往前移动一个单位
		$this->currentIndex++;
	}
}

class Object implements IteratorAggregate{
	public $data=array();
	function __construct($in){
		//初始化对象，赋初值 $in
		$this->data=$in;
	}
	function getIterator(){
		//获取迭代器对象
		return new ObjectIterator($this);
	}
}

$myObject=new Object(array(2,4,6,8,10)); //生成一个实例
$myIterator=$myObject->getIterator(); //初始化迭代器
for($myIterator->rewind();$myIterator->valid();$myIterator->next()){
	//如果指针没有在数组的结尾，就一直循环输出数组元素的值
	$key=$myIterator->key();
	$value=$myIterator->current();
	echo$key."=>".$value."<br/>";
}
?>
```

#### 实例：将类转换成字符串

```php
class Printable{
    public $testone;
    public $testtwo;
    public function __toString()    {
    	return(var _export($this,TRUE));
    }
}

$p=new Printable;
echo $p;
```

`__toString()`函数的所有返回内容都将被echo语句打印。（`var _export()`函数打印出了类中的所有属性值。）

#### 使用 `Reflection（反射）API`

反射是通过访问已有类和对象来找到类和对象的结构和内容的能力。当使用未知或文档不详的类时，这个功能就非常有用，例如使用经过编码的PHP脚本。

这个API非常复杂，但是可以通过一些简单的例子介绍其用途。例如，本章所定义的Page类。通过反射API，可以获得关于该类的详细信息：

```php
<?php
    require_once("page.inc");
    $class=new ReflectionClass("Page");
    echo "<pre>".$class."</pre>";
?>
```

## 错误和异常处理

- 异常处理的概念
- 异常控制结构：try...throw...catch
- Exception 类
- 用户自定义异常
- 应用程序的异常
- 异常和 PHP 的其他错误处理机制

### 异常处理的概念

异常处理的基本思想是代码在try代码块被调用执行。如下示例

```php
try{
    //code goes here
}
```

如果 try 代码块出现某些错误，我们可以执行一个抛出异常的操作。在某些编程语言中，例如 Java ，在特定情况下将自动抛出异常。在 PHP 中，异常必须手动抛出。可以使用如下方式抛出一个异常。

```php
throw new Exception('message',code);
```

throw 关键字将触发异常处理机制。它是一个语言结构，而不是一个函数，但是必须给它传递一个值。它要求接收一个对象。在最简单的情况下，可以实例化一个内置的 Exception 类，就像以上代码所示。

这个类的构造函数需要两个参数：一个消息和一个代码。它们分别表示一个错误消息和错误代码号。这两个参数都是可选的。

最后，在 try 代码块之后，必须至少给出一个 catch 代码块。catch 代码块可以如下所示：

```php
catch(type hint exception){
    //handle exception
}
```

可以将多个 catch 代码块与一个 try 代码块进行关联。如果每个 catch 代码块可以捕获一个不同类型的异常，那么使用多个 catch 代码块是有意义的。例如，如果希望捕获 Exception 类的异常，catch 代码块可以如下所示：

```php
catch(Exception $e){
    //handle exception
}
```

传递给catch代码块的对象（也是被catch代码块捕获的）就是导致异常并传递给throw语句的对象（被throw语句抛出）。该异常可以是任何类型的，但是使用Exception类的实例，或从Exception类继承过来并由用户定义的异常类实例，都是不错的选择。

当产生一个异常时，PHP将查询一个匹配的catch代码块。如果有多个catch代码块，传递给每一个catch代码块的对象必须具有不同的类型，这样PHP可以找到需要进入哪一个catch代码块。

需要注意的另外一点是，还可以在一个catch代码块产生新的异常。

示例：**basic_exception.php**

```php
<?php
    try{
        throw new Exception("A terrible error has occurred",42);
    }
    catch(Exception $e){
        echo "Exception".$e -> getCode().":".$e -> getMessage()."<br/>".
        "in".$e -> getFile()." on line".$e -> getLine()."<br/>";
    }
?>
```

### Exception 类

PHP 为异常处理提供的内置类——Exception。其构造函数需要两个参数：一个错误消息和一个错误代码。

该类提供了如下所示的内置方法：

- `getCode()` 返回传递给构造函数的代码
- `getMessage()` 返回传递给构造函数的消息
- `getFile()` 返回产生异常的代码文件的完整路径
- `getLine()` 返回代码文件中产生异常的代码行号
- `getTrace()` 返回一个包含了产生异常的代码回退路径的数组
- `getTraceAsString()` 返回与 `getTrace()` 方向相同的信息，该信息将被格式化成一个字符串。
- `_toString() ` 允许简单地显示一个 Exception 对象，并且给出以上所有方法可以提供的信息。

### 用户自定义异常

首先，看一下可能会被继承的 [Exception 类](http://us1.php.net/manual/zh/class.exception.php)：

```php
Exception {
    /* 属性 */
    protected string $message ;
    protected int $code ;
    protected string $file ;
    protected int $line ;
    /* 方法 */
    public __construct ([ string $message = "" [, int $code = 0 [, Throwable $previous = NULL ]]] )
    final public string getMessage ( void )
    final public Throwable getPrevious ( void )
    final public int getCode ( void )
    final public string getFile ( void )
    final public int getLine ( void )
    final public array getTrace ( void )
    final public string getTraceAsString ( void )
    public string __toString ( void ) //可以重载
    final private void __clone ( void )
}
```

需要注意到，该类大多数公有方法都是 final 的，这就意味着不能重载这些方法。我们可以创建自己的 Exception 子类，但是不能更改这些基本方法的行为。

示例：**user_defined_exception.php**

```php
<?php
    class myException extends Exception{
        function __toString(){
            return "<table boder=\"1\">
                <tr>
                <td><strong>Exception".$this->getCode()."
                </strong>:".$this->getMessage()."<br/>"."
                    in".$this->getFile()." on line".$this->getLine()."
                </td>
                </tr>
                </table><br />";
        }
	}

try{
	throw new myException("A terrible error has occured",42);
}
catch(myException $m){
	echo $m;
}
?>
```

### 应用程序的异常

下面是对打开文件，写文件，锁文件抛出的异常类：

```php
<?php

class fileOpenException extends Exception
{
  function __toString()
  {
       return "fileOpenException ". $this->getCode()
              . ": ". $this->getMessage()."<br />"." in "
              . $this->getFile(). " on line ". $this->getLine()
              . "<br />";
   }
}

class fileWriteException extends Exception
{
  function __toString()
  {
       return "fileWriteException ". $this->getCode()
              . ": ". $this->getMessage()."<br />"." in "
              . $this->getFile(). " on line ". $this->getLine()
              . "<br />";
   }
}

class fileLockException extends Exception
{
  function __toString()
  {
       return "fileLockException ". $this->getCode()
              . ": ". $this->getMessage()."<br />"." in "
              . $this->getFile(). " on line ". $this->getLine()
              . "<br />";
   }
}

?>

```

如果无法打开文件，将抛出一个fileOpenException异常；如果无法锁定该文件，将抛出一个fileLockException异常；而如果无法写这个文件，将抛出一个fileWriteException异常。

**一个重要警告**：如果异常没有匹配的catch语句块，PHP将报告一个致命错误。

### 异常和 PHP 的其他错误处理机制

除了本章所讨论的异常处理机制，PHP还提供了复杂的错误处理支持，这将在第26章详细介绍。请注意，产生和处理异常的过程并不会影响或禁止这种错误处理机制的运行。

请注意fopen()函数的调用仍然使用了@错误抑制操作符前缀。如果该函数调用失败，PHP将发出一个警告，根据php.ini中的错误报告设置不同，该警告可能会被报告或者记录。这些设置将在第26章详细介绍，但我们必须知道，无论是否产生一个异常，这个警告仍然会发出。

### 进一步学习

- 参考链接：[异常处理-英文](https://docs.oracle.com/javase/tutorial/essential/exceptions/handling.html)