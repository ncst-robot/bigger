---
title: 网站建设之MySQL实践
date: 2018-8-25 22:29:12
tags: [编程语言,网站建设]
---

下载书籍 [[download](https://pan.baidu.com/s/1MrBCS-fpLmSs57swjW3JGA) PDF]

教程：[MySQL视频教程](https://www.bilibili.com/video/av14716238/?p=1)

## 设计 Web 数据库

数据库的优点：

- 关系数据库比普通文件的数据访问速度更快
- 关系数据库更容易查询并提取满足特定条件的数据
- 关系数据库具有专门的内置机制处理并发访问，因此作为程序员，不需要为此担心
- 关系数据库可以提供对数据的随机访问。
- 关系数据库具有内置的权限系统

章节介绍：

- 关系数据库的概念和术语
- Web 数据库的设计
- Web 数据库的架构

### 关系数据库的概念

- 表格：
  - 列/域/属性
  - 行/记录
  - 值
  - 标志列/键/主键
  - 外键
- 模式：数据库整套表格的完整设计称为数据库的模式。在一个模式中，带有下画线的元素表示该元素是所在关系的主键。斜体元素表示该元素是其所在关系的外键。
- 外键表示两个表格数据的关系。
  - 一对一
  - 一对多
  - 多对多

### 设计 Web 数据库

- 首先根据实际生活需要产生一个需求，然后根据需求设计表格。
- 需要注意的是要避免数据的冗余，即避免多次保存一样的数据。
- 每行的属性最好只有一个值
- 选择有意义的键，对于现实生活中，存在能够保证其唯一性的可以不用加键，例如书籍的 ISBN
- 考虑需要询问数据库的问题。比如书店的哪些图书卖的最好？回答此类问题，应该确认数据库中已经包含所有需要的数据，并且在表之间要有适当的关联
- 避免多个空属性的设计

### Web 数据库架构

Web 数据库系统由两个对象组成：一个 Web 浏览器和一个 Web 服务器。他们之间需要通信连接。

常用的模型为：

Web浏览器 -> Web服务器 -> PHP引擎 -> MySQL服务器 -> PHP引擎 -> Web服务器 -> Web浏览器

这是用户从请求页面并得到回复的全部过程。

这个过程基本上与脚本引擎和数据库服务器无关。通常，Web服务器软件，PHP引擎和数据库服务器都在同一台机器上运行。但是，数据库服务器在另外一台机器上运行也是非常常见的。这样做是出于保密、提高性能以及负载平衡的原因而考虑的。从开发的角度来看，要做的事情基本上是一样的，但是它能够明显提高性能。

### 进一步学习

- 参考图书：[数据库系统导论](https://book.douban.com/subject/2179813/)

## 创建 Web 数据库

- 创建一个数据库
- 设置用户权限
- 权限系统的介绍
- 创建数据库表
- 创建索引
- 选择 MySQL 中的列类型

以在线书店应用程序为例。一下给出了应用程序的数据库模式：

> Customers(<u>CustomerID</u>,Name,Address,City)
> Orders(<u>OrderID</u>,*CustomerID*,Amount,Date)
> Books(<u>ISBN</u>,Author,Title,Price)
> Order_Items(*OrderID*,*ISBN*,Quantity)
> Book_Reviews(*ISBN*,Reviews)

请记住，带下画线的是主键而斜体的是外键。

**预备工作**：（完成基本的安装）

- 安装文件
- 为 MySQL 创建一个用户，并且以该用户身份运行所创建的数据库
- 添加环境变量
- 如果需要，运行 mysql_install_db
- 设置 root 密码
- 删除匿名用户和供测试使用的数据库
- 启动 MySQL 服务器并将其设置为自动运行

### 使用 MySQL 监视程序

- 注意：MySQL 语句不区分大小写，但是数据库和表的名称则区分大小写

### 登陆到 MySQL

在 cmd 中启动 MySQL 服务：

`mysql -h localhost -u root -p -P 3306`

### 创建数据库和用户

```sql
create database dbname;
```

### 设置用户与权限

### MySQL 权限系统介绍

- 最少权限原则：提高计算机系统的安全性

- 创建用户：`GRANT` 命令

  GRANT 和 REVOKE 命令分别用来授予和取消 MySQL 用户的权限。权限分为四个级别，分别是：全局、数据库、表、列。

  ```sql
  GRANT privileges[columns]
  ON item
  TO user_name[IDENTIFIED BY 'password']
  [REQUIRE ssl_options]
  [WITH [GRANT OPTION|limit_options]]
  ```

  权限存储在名为mysql的数据库中的5个系统表中。这些表分别是mysql.user、mysql.db、mysql.host、mysql.tables_priv和mysql.columns_priv。作为GRANT命令的替代，可以直接修改这些表。

  详细参考：[GRANT](https://dev.mysql.com/doc/refman/8.0/en/grant.html)

- 权限的类型和级别：适用于赋予一般用户的权限、适用于赋予管理员的权限和几个特定的权限，三种

- 收回用户权限：`REVOKE` 命令，语法如下：

  ```sql
  REVOKE privileges[(columns)]
  ON item
  FROM user_name
  ```

  如果已经给出了WITH GRANT OPTION子句，可以按如下方式撤销它（以及所有其他权限）：

  ```sql
  REVOKE All PRIVILEGES,GRANT
  FROM user_name
  ```

### 实例

```sql
# 创建一个管理员用户:fred
GRANT all;
ON *; # 拥有使用所有数据库的所有权限
TO fred IDENTIFIED BY 'mnb123'; # 用户名为Fred，密码为mnb123
WITH GRANT OPTION; #允许向其他人授予这些权限
```

如果不希望用户在系统中存在，可以用如下方式**撤销**：

```sql
REVOKE ALL PRIVILEGES, GRANT;
FROM fred;
```

如下，可以**创建**一个没有任何权限的普通用户：sally

```sql
GRANT USAGE;
ON books.*;
TO sally IDENTIFIED BY 'magic123';
```

可以用如下方式对 Sally **授予**一定的权限：

```sql
GRANT SELECT, INSERT, UPDATE, DELETE, INDEX, ALTER, CREATE, DROP;
ON books.*;
TO sally; # 这里并不需要指定 Sally 的密码
```

如果认为 Sally 权限过高，可以按如下方式**减少**她的权限：

```sql
REVOKE ALTER, CREATE, DROP;
ON books.*;
FROM sally;
```

当 Sally 不再需要使用数据库时，可以按如下方式**撤销**所有的权限：

```sql
REVOKE ALL;
ON books.*;
FROM sally;
```

### 创建一个 Web 用户

如 9-5 实例所示，可以用创建普通用户的方式创建一个 Web 用户。

可以输入quit命令退出MySQL监视程序。最好应该再以Web用户的身份登录，测试每件事情是否工作正常。如果所运行的GRANT语句已经执行了，但是尝试登录时，又被拒绝了，**这通常是因为安装过程中还没有删除匿名账户**。以root重新登录并且删除匿名账户。删除匿名账户后，应该能够以Web用户身份重新登录了。

### 使用正确的数据库

```sql
USE dbname;
```

### 创建数据库表

```sql
CREATE TABLE tablename(columns);
```

提示　你可能会注意到，MySQL提供了多个表类型和存储引擎，其中包括一些事务安全的类型。目前，books数据库中所有表都使用了默认存储引擎，MyISAM。

应该用要创建的表名代替tablename占位符，用逗号分开的列名称列表代替columns占位符。每一列应该有一个名字，该名字后面紧跟其数据类型。

- 从文件中载入一个文件，可以输入以下语句：

  ```sql
  mysql -h localhost -u root -p -P 3306＜test_name.sql
  ```

### 查看数据库和数据表

查看数据**表**：`show tables`

查看数据**库**：`show databases`

查看数据**表**的详细信息：`describe tables`

### 创建索引

由于设计主键将在这些列上创建索引，所以我们已经简单介绍过索引。

要开始创建索引，可以使用自动创建的索引。如果发现需要对一个不是主键的列运行许多查询，我们可能希望在该列上添加索引来改善性能。可以使用CREATE INDEX语句来实现。该语句的常见形式如下所示：

```sql
CREATE [UNIQUE | FULLTEXT] INDEX index_name;
ON table_name(index_column_name[(length)][ASC|DESC],...)
```

FULLTEXT索引用来索引文本字段。

可选的length字段允许指定只有该字段前length个字符将被索引。也可以指定一个索引的排序为升序或降序；默认值是升序。

### 理解 MySQL 的标识符

在 MySQL 中，提供了 5 种类型的标识符：

- DATABASE
- TABLE
- COLUMN
- INDEX
- ALIAS

这些标识符在不同的操作系统中对于大小写的区分是不同的。

### 选择列数据类型

MySQL 中有几种基本的列数据类型：数字、日期和时间、字符串。而每种类型又包含了许多种类型，详细参考[单击这里](http://www.runoob.com/mysql/mysql-data-types.html)。

### 进一步学习

- 详细参考：[MySQL](https://www.mysql.com/)

## 使用 MySQL 数据库

- SQL 是什么
- 在数据库中插入数据
- 从数据库中取出数据
- 表的连接
- 使用子查询
- 更新数据库中的记录
- 创建后修改表
- 删除数据库中的记录
- 删除表

### SQL 是什么

SQL的全称是Structured Query Language。它是访问关系数据库管理系统（RDBMS）的标准语言。

SQL可以用来将数据保存到数据库中，以及从数据库中取回数据。

SQL 包含两个基础部分，一个是用于定义数据库的数据定义语言（Data Definition Language，DDL），另一个是用于查询数据库的数据操作语言（Data Manipulation Language，DML）。

最初建立数据库的时候，用的是 DDL，之后将要学习的保存和获得数据时，用的时DML。

### 在数据库中插入数据

```sql
INSERT [INTO] table_names [(column1,column2,column3,...)] VALUES 
(value1,value2,value3,...);
```

例如要向customers表中插入一个记录，可以输入:

```sql
INSERT INTO customers VALUES (NULL, 'Julie Smith', '20 New Street', 'Airpot West');
```

注意，MySQL 中的字符串应该包含在一对单引号或双引号中。数字和日期不需要引号。

如果不指定插入的字段（columns），默认按照表格字段的顺序全部插入。

向指定列（字段）插入数据，有两种方式：

No1：

```sql
INSERT INTO customers (name, city) VALUES ('Melissa Jones', 'Nar Nar Goon North');
```

一行记录应该在一个括号里

No2：

```sql
INSERT INTO customers
SET name = 'Michael',
address = '12 Adderley Avenue',
city = 'Leeton';
```

### 从数据库中获取数据

```sql
SELECT [options] items # 需要提取的列的名称，*代表所有的列
[INTO file_details]
FROM tables # 从tables中获取数据
[WHERE conditions] # 按照条件筛选结果
[GROUP BY group_type] # 详细的见下方 where 子句链接
[HAVING where_definition]
[ORDER BY order_type]
[LIMIT limit_criteria]
[PROCEDURE proc_name(arguments)]
[lock_options];
```

- where 子句：[WHERE](https://www.w3cschool.cn/mysql/mysql-where-clause.html) | [CSDN](https://blog.csdn.net/haibo0668/article/details/52539880)

#### 从多表中查询数据

1. 简单的双表关联

   例如要查询 Julie Smith 的订单信息，可以使用：

   ```sql
   SELECT orders.orderid, orders.amount, orders.date
   FROM customers, orders
   WHERE customers.name = 'Julie Smith'
   AND customers.customerid = orders.customerid;
   ```

   显示结果如下所示：

   > `+---------+--------+------------+`
   >
   > `|orderid|amount|date|`
   >
   > `+---------+--------+------------+`
   >
   > `|1|69.98|2007-04-02|`
   >
   > `|4|24.99|2007-05-01|`
   >
   > `+---------+--------+------------+`

   查询语句中的 FROM 后的两个表名称之间的逗号等价于输入 INSERT JOIN 或 CROSS JOIN。这是一种类型的关联，有时也称为完全关联或表的笛卡尔乘积。

   以上代码告诉 MySQL，如果 customers 表中的 customerid 与 orders 表中的 customerid 相匹配，那么就将行显示在结果中。

2. 关联多个表

   关联多于两个表的情况并不比两个表的关联更复杂。

   举例说明：从多个表中查找购买 Java 图书的客户

   ```sql
   SELECT customers.name
   FROM customers, orders, order_items, books
   WHERE customers.customerid = orders.customersid
   AND orders.orderid = order_items.orderid
   AND order_item.isbn = books.isbn
   AND books.title LIKE '%Java%'
   ```

3. 查找不匹配行

   在 MySQL 中，实现此类查询最简单的方法就是使用[左关联](https://blog.csdn.net/hj7jay/article/details/51749863)。

   用例子来理解一下：

   ```sql
   SELECT customers.customerid, customers.name, orders.orderid
   FROM customers LEFT JOIN orders
   ON customers.customerid = orders.customerid; # 该句也可以用 USING 来替换，当使用 USING 时，两个表中的列名称需要同时有 customerid
   ```

   本例子将 FROM 后面的逗号换了一个关键词：LEFT JOIN。

   该输出只显示为orderid为非空的客户（**NULL也是非空**）

4. 使用表的别名：Aliases

   通常，用表的别名来指定表时很方便的，偶尔也是很必要的。

   例如：对 2 中的代码进行改写

   ```sql
   SELECT c.name
   FROM customers AS c, orders AS o, order_items AS oi, books AS b
   WHERE c.customerid = o.customerid
   AND o.orderid = oi.orderid
   AND oi.isbn = b.isbn
   AND b.title LIKE '%Java%'
   ```

   当要关联到一个**表**到**表本身**的时候就必须使用表别名。有点不好理解。举个例子，如果要查找同一个表中值相同的行，它就很有意义。如果要查找住在同一城市的顾客（可能要建立一个阅读小组），可以给同一个表（customers）起两个不同的别名：

   ```sql
   SELECT c1.name, c2.name, c1.city
   FROM customers AS c1, customers AS c2
   WHERE c1.city = c2.city
   AND c1.name != c2.name;
   ```

5. 关联的总结

   - [MySQL 中的关联类型](https://www.cnblogs.com/qiuqiuqiu/p/6442791.html)

#### 以特定的顺序获取数据

如果要通过查询以某一特定顺序显示查询行，可以利用SELECT语句中的ORDER BY子句。

ORDER BY子句可以根据出现在SELECT子句中的一列或多列对数据行进行排序。例如：

```sql
SELECT name, address
FROM customers
ORDER BY name;
```

上面的查询将以名称的**升序**（a-z）返回顾客的名称和地址。如果使用了 ASC 关键词，也可以指定它：

```sql
SELECT name, address
FROM customers
ORDER BY name ASC;
```

还可以使用**降序**关键词（DESC）指定它：

```sql
SELECT name, address
FROM customers
ORDER BY name DESC;
```

#### 分组与合计数据

MySQL 中的**聚合**函数一共有五个：

- 平均值：`AVG()`
- 计数：`COUNT()`
- 最大值：`MAX()`
- 最小值：`MIN()`
- 求和：`SUM()`

使用聚合函数：

```sql
# 计算订单总额的平均值
SELECT AVG(amount)
FROM orders;
```

**分组**的关键词为：GROUP BY

举例说明具体用法：

```sql
SELECT customeid, AVG(amount)
FROM orders
GROUP BY customerid;
```

在使用分组和合计函数的时候，需要注意的是：在ANSI SQL中，如果使用了一个合计函数或GROUP BY子句，出现在SELECT子句中的必须是合计函数名称和GROUP BY子句的列名称。

除了分组与合计数据，我们实际上还可以使用 HAVING 子句**测试一个合计的结果**。它可以直接放在 GROUP BY子 句后，有些类似于只用于分组与合计的 WHERE 子句。例如，提取平均值大于50的：

```sql
SELECT customeid, AVG(amount)
FROM orders
GROUP BY customerid
HAVING AVG(amount)>50;
```

#### 选择要返回的行

SELECT 语句中的一个可能在 Web 应用中特别实用的子句是 LIMIT 子句。它可以用来指定输出中哪些行应该返回。它带两个参数：起始行号与返回行数。举例说明：

```sql
SELECT name
FROM customers
LIMIT 2, 3;
```

该查询意思是：“从customers表中选择name列，返回3行，从返回结果的第2行开始。”请注意，行号是以0开始索引的；也就是说，结果的第1行其行号为0。

这个关键字和其他的大多数 RDBMS 不兼容。

#### 使用子查询

子查询是一个嵌套在另一个查询内部的查询。子查询相对比来说更容易阅读。

1. **基本的子查询**

子查询的最常见用法是用一个查询的结果作为另一个查询的比较条件。例如，如果希望找到一个金额最大的订单，可以使用如下所示的查询：

```sql
SELECT customerid, amount
FROM orders
WHERE amount = (SELECT MAX(amount) FROM orders);
```

为了实现相同的功能可以使用**效率更高**的关联查询：

```sql
SELECT customerid, amount
FROM orders
ORDER BY amount DESC
LIMIT 1;
```

1. **子查询和操作符**

特殊的子查询操作符共有5个。其中有4个可以在常规子查询中使用，而另一个（EXISTS）通常只在相关联的子查询中使用，相关联的子查询将在下一节介绍。详情[点击这里](http://www.cnblogs.com/zywf/p/4963245.html)。

这些操作符都只可以出现在比较操作符之后，除了IN，它相当于隐藏了比较操作符（=）。

1. **关联子查询**

在关联子查询中，情况变得更加复杂。在关联子查询中，可以在内部查询中使用外部查询的结果。举例说明：

```sql
SELECT isbn, title
FROM books
WHERE NOT EXISTS
(SELECT * FROM order_items WHERE order_items.isbn = books.isbn);
```

这个查询说明了关联子查询和最后一个特殊子查询操作符（EXISTS）的使用。它将检索任何还没有被订购的图书（这与使用左关联所检索到的信息相同）。

**请注意**，内部查询只能包括 FROM 列表中的 order_items 表，但是还是引用了 books.isbn。换句话说，内部查询将引用外部查询的数据。这是**关联子查询的定义**：查询匹配（或者，在这个例子中，是不匹配）外部行的内部行。

如果子查询中存在任何匹配行，EXISTS 操作符将返回 true。相反，如果子查询中没有任何匹配行，NOT EXISTS 将返回 true。

1. **行子查询**

行子查询将返回整行，它可以与外部查询的整行进行比较。通常，这种方法用来在一个表中查找存在于另一个表的行。该语法的常规例子如下所示：

```sql
SELECT c1, c2, c3
FROM t1
WHERE (c1, c2, c3) IN (SELECT c1, c2, c3 FROM t2);
```

1. **使用子查询作为临时表**

可以在一个外部查询的 FROM 子句中使用子查询。这种方法允许有效地查询子查询的输出，并将其当作一个临时表。举例说明临时表的使用：

```sql
SELECT * 
FROM (SELECT customerid, name FROM customers WHERE city = 'BOX HILL')
AS box_hill_customers;
```

请注意，我们将子查询放在了FROM子句中。在子查询后面就是结束的括号，必须为子查询的结果定义一个别名。我们可以将其当作外部查询的任何表。

### 更新数据库记录

通常，除了从数据库中获得数据，我们还希望**修改**这些数据。

UPDATE 语句的常用格式：

```sql
UPDATE [LOW_PRIORITY][IGNORE] tablename
SET column1 = expression1, column2 = expression2, ...
[WHERE condition]
[ORDER BY order_criteria]
[LIMIT number]
```

其基本思想是更新名为 tablename 的表，设置每列的名称为适当的表达式。可以通过 WHERE 子句限制 UPDATE 到特定的行，也可以使用 LIMIT 子句限制受影响的总行数。ORDER BY 通常只在 LIMIT 子句的连接中使用；例如，如果只更新前 10 行，可以将它们放置在前面的位置。如果指定了 LOW_PRIORITY 和 IGNORE 关键字，就会像在 INSERT 语句中一样工作。

举个例子：将图书的价格提高 10%

```sql
UPDATE books
SET price = price*1.1; # 修改价格
```

修改**某一行**：

```sql
UPDATE customers
SET address = '250 Olsens Road' #修改地址
WHERE customerid = 4;
```

### 创建后修改表

除了可以更新行，可能还需要改变数据库中表的结构。要实现这个目的，可以利用灵活的 ALTER TABLE 语句。其基本格式如下：

```sql
ALTER TABLE[IGNORE]tablename alteration[,alteration...]
```

请注意，在ANSI SQL中，每个ALTER TABLE语句只可实现一次修改，但是在MySQL中允许实现多次修改。每个修改子句可用于修改表的不同部分。

如果指定了 IGNORE 子句并且尝试的修改可能会产生重复的主键，第一个重复的主键将进入修改后的表，而其他重复的主键将被删除。如果没有指定（默认情况），该修改将失败并且被回滚。

- 详情见链接：[ALTER TABLE 语句可能完成的修改](https://dev.mysql.com/doc/refman/5.6/en/alter-table.html)

下面介绍几种常见的修改：

- 修改某列的数据类型

```sql
ALTER TABLE customers
MODIFY name CHAR(70) NOT NULL;
```

- 增加一列

```sql
ALTER TABLE orders
ADD tax FLOAT(6,2) AFTER amount;
```

- 删除一列

```sql
ALTER TABLE orders
DROP tax；
```

### 删除数据库中的记录

可以使用 DELETE 语句完成。其常见格式如下所示：

```sql
DELETE[LOW_PRIORITY][QUICK][IGNORE]FROM table
[WHERE condition]
[ORDER BY order_cols]
[LIMIT number]
```

如果执行命令：

```sql
DELETE FROM talbe;
```

所有表中的行丢将被删除，因此要非常***小心***。通常，如果希望删除特定的行，可以使用WHERE子句指定要删除的行。

```sql
DELETE FROM customers
WHERE customerid = 5;
```

LIMIT子句可用于限制实际删除的最大行数。ORDER BY通常与LIMIT结合使用。

LOW_PRIORITY和IGNORE的用途与前面介绍的相同。QUICK可以使得对MyISAM表的操作执行得更快。

### 表的删除

删除整个表。使用 `DROP TABLE` 语句。

```sql
DROP TABLE table;
```

这将删除表中所有行以及表本身，因此使用的时候要非常小心。

### 删除整个数据库

```sql
DROP DATABASE database;
```

### 进一步学习

- [官网](https://www.mysql.com)
- [ANSI SQL 标准](https://www.ansi.org/)

## 使用 PHP 从 Web 访问 MySQL 数据库

- Web 数据库架构的工作原理
- 通过 Web 查询数据库的基本步骤
- 建立数据库连接
- 获取关于可用数据库的信息
- 选择要使用的数据库
- 查询数据库
- 检索查询结果
- 与数据库断开连接
- 在数据库中插入新信息
- 使用 prepared 语句
- 使用 PHP 与数据库交互的其他接口
- 使用常规的数据库接口：PEAR MDB2

### Web 数据库架构的工作原理

- [8-3 web 数据库架构](#8-3-web-数据库架构)

具体步骤是：

1. 用户发出 HTTP 请求，请求特定的 Web 页面“result.php”
2. Web 服务器接收到请求后，检索“result.php”，将其传递给 PHP 引擎处理
3. PHP 引擎解析脚本，发起对 MySQL 数据库的请求。
4. MySQL 服务器接收到请求后处理这个查询操作，并将结果返回给 PHP 引擎。
5. PHP 完成解析，将结果 HTML 返回给 Web 服务器。
6. Web 服务器将 HTML 返回给客户端，用户看到查询结果。

下面介绍代码的实现：**search.html**

```html
<html>
<head>
  <title>Book-O-Rama Catalog Search</title>
</head>

<body>
  <h1>Book-O-Rama Catalog Search</h1>

  <form action="results.php" method="post">
    Choose Search Type:<br />
    <select name="searchtype">
      <option value="author">Author
      <option value="title">Title
      <option value="isbn">ISBN
    </select>
    <br />
    Enter Search Term:<br />
    <input name="searchterm" type="text" size="40">
    <br />
    <input type="submit" name="submit" value="Search">
  </form>

</body>
</html>
```

**results.php**

```php
<html>
<head>
  <title>Book-O-Rama Search Results</title>
</head>
<body>
<h1>Book-O-Rama Search Results</h1>
<?php
  /*定义简短名称变量
    检查与过滤用户数据:过滤用户输入搜索信息时，
    在两端输入的空白字符。
    过滤操作通过 trim() 函数实现。*/
  $searchtype=$_POST['searchtype'];
  $searchterm=trim($_POST['searchterm']);

  /*验证用户已经输入搜索条件并选择了搜索类型
    这个步骤在过滤之后，否则会出现搜索条件不为空，
    但是搜索结果为空的错误*/
  if (!$searchtype || !$searchterm) {
     echo 'You have not entered search details.  Please go back and try again.';
     exit;
  }

  /*当将用户输入数据提交到一个数据库时，必须转义数据。
  	利用前面讲到的 addslashes()、stripslashes()和
  	get_magic_quotes_gpc()函数。
    在这里，get_magic_quotes_gpc()函数检查是否进行了
    自动完成引号，如果还没有，可以使用 addslashes()函数
    来过滤数据*/
  if (!get_magic_quotes_gpc()){
    $searchtype = addslashes($searchtype);
    $searchterm = addslashes($searchterm);
  }

  /*建立一个连接：此处使用面向对象的方法
  	如果要使用面向过程的方法：将new mysqli改成mysqli_connect
  	mysqli：i表示改进
  	连接到主机localhost，用户名bookorama,
  	密码bookorama123,使用数据库books*/
  @ $db = new mysqli('localhost', 'bookorama', 'bookorama123', 'books');

  /*检查数据库的连接
  	连接错误时，返回一个错误号，如果成功，返回0*/
  if (mysqli_connect_errno()) {
     echo 'Error: Could not connect to database.  Please try again later.';
     exit;
  }

  /*查询数据库
  	这里用了相似逻辑匹配而不是相等逻辑
  	如果希望使用面向过程版本的函数，
  	可以使用 $result=mysqli_query($db,$query);
  	提示　
  	请记住，发送给MySQL的查询不需要在后面加一个分号，
  	这与在MySQL监视程序输入查询有所不同*/
  $query = "select * from books where ".$searchtype." like '%".$searchterm."%'";
  $result = $db->query($query);

  /*检索查询结果
  	返回记录行的行数，$result 是一个对象，返回的行数结果保存在结果对象的 num_rows 成员变量中，
  	当使用一个过程方法时，函数mysqli_num_rows()给出了查询返回的行数。你应该把它传给结果标识符：$num_results=mysqli_num_rows($result)*/
  $num_results = $result->num_rows;

  echo "<p>Number of books found: ".$num_results."</p>";

 /*将返回记录行的详细信息打印出来
 	使用对象的 fetch_assoc()函数
 	stripslashes()函数用来整理显示的值*/
  for ($i=0; $i <$num_results; $i++) {
     $row = $result->fetch_assoc(); //给定数组
     echo "<p><strong>".($i+1).". Title: ";
     echo htmlspecialchars(stripslashes($row['title']));
     echo "</strong><br />Author: ";
     echo stripslashes($row['author']);
     echo "<br />ISBN: ";
     echo stripslashes($row['isbn']);
     echo "<br />Price: ";
     echo stripslashes($row['price']);
     echo "</p>";
  }

  $result->free();
  $db->close();

?>
</body>
</html>
```

### 从 Web 查询数据库的基本步骤

1. 检查并过滤来自用户的数据
2. 建立一个适当的数据库连接
3. 查询数据库
4. 获取查询结果
5. 将结果显示给用户

以上的操作步骤在上面的代码中实现了，每段代码都做了注释。

注意事项：

- 对于步骤 2，MySQL对同时连接数据库的连接数量有一定的限制。MySQL参数max_connections决定了同时连接的个数，该参数和相关的Apache参数MaxClients的作用是，告诉服务器拒绝新的连接请求，从而确保系统资源不会在系统忙碌的时候，或软件瘫痪的时候被请求和使用。

  可以通过修改配置文件来改变这两个参数的默认值。要设置Apache中的MaxClients参数，可以编辑系统中的httpd.conf文件。要为MySQL设置max_connections参数，可以编辑文件my.conf。

#### 选择使用的数据库

在PHP中，可以调用mysqli_select_db()函数来实现：

```php
$db->select_db(dbname)
```

或

```php
mysqli_select_db(db_resource,db_name)
```

这里，可以看到以上代码与我们前面介绍的函数类似：过程版本的函数名称以mysqli_开始，需要额外的数据库句柄参数。

#### 查询数据库

`select`

#### 检索查询结果

`mysqli_fetch_assoc()`

#### 从数据库断开连接

释放结果集：

```php
$result -> free();
# 或者 面向过程的方法如下
mysqli_free_result($result);
```

关闭数据库

```php
$db -> close();
# 或者 面向过程的方法如下
mysqli_close($db);
```

严格地说，这并不是必要的，因为脚本执行完毕的时候它们将被自动关闭。

### 将新信息放入数据库

显然，将新数据插入到数据库与从数据库中取回数据是相似的。我们可以遵循同样的基本步骤——建立一个连接、发送查询，最后检查结果。在这种情况中，发送的查询是 INSERT 而不是 SELECT。

这里用代码来实现一下：

**new_book.html**

```html
<html>
<head>
  <title>Book-O-Rama - New Book Entry</title>
</head>

<body>
  <h1>Book-O-Rama - New Book Entry</h1>

  <form action="insert_book.php" method="post">
    <table border="0">
      <tr>
        <td>ISBN</td>
         <td><input type="text" name="isbn" maxlength="13" size="13"></td>
      </tr>
      <tr>
        <td>Author</td>
        <td> <input type="text" name="author" maxlength="30" size="30"></td>
      </tr>
      <tr>
        <td>Title</td>
        <td> <input type="text" name="title" maxlength="60" size="30"></td>
      </tr>
      <tr>
        <td>Price $</td>
        <td><input type="text" name="price" maxlength="7" size="7"></td>
      </tr>
      <tr>
        <td colspan="2"><input type="submit" value="Register"></td>
      </tr>
    </table>
  </form>
</body>
</html>
```

**insert_book.php**

```php
<html>
<head>
  <title>Book-O-Rama Book Entry Results</title>
</head>
<body>
<h1>Book-O-Rama Book Entry Results</h1>
<?php
  // create short variable names
  $isbn=$_POST['isbn'];
  $author=$_POST['author'];
  $title=$_POST['title'];
  $price=$_POST['price'];

  if (!$isbn || !$author || !$title || !$price) {
     echo "You have not entered all the required details.<br />"
          ."Please go back and try again.";
     exit;
  }

  if (!get_magic_quotes_gpc()) {
    $isbn = addslashes($isbn);
    $author = addslashes($author);
    $title = addslashes($title);
    $price = doubleval($price); //对数字字段进行过滤
  }

  @ $db = new mysqli('localhost', 'bookorama', 'bookorama123', 'books');

  if (mysqli_connect_errno()) {
     echo "Error: Could not connect to database.  Please try again later.";
     exit;
  }

  $query = "insert into books values
            ('".$isbn."', '".$author."', '".$title."', '".$price."')";
  $result = $db->query($query);

  if ($result) {
      echo  $db->affected_rows." book inserted into database.";
  } else {
  	  echo "An error has occurred.  The item was not added.";
  }

  $db->close();
?>
</body>
</html>

```

**提示**	当编写一个修改数据库的查询时，例如INSERT、DELETE和UPDATE，应该使用mysqli_affected_rows()函数。

### 使用 Prepared 语句

mysqli 函数库支持 prepared 语句的使用。它们对于在执行大量具有不同数据的相同查询时，可以提高执行速度。它们也可以免受 SQL 注射风格（injection-style）的攻击。

Prepared语句的基本思想是可以向MySQL发送一个需要执行的查询模板，然后再单独发送数据。我们可以向相同的Prepared语句发送大量的相同数据；这个特性对批处理的插入操作来说是非常有用的。

在insert_book.php脚本中，可以使用prepared语句，如下所示：

```php
$query="insert into books values(?,?,?,?)";
$stmt=$db->prepare($query); // 构建一个语句对象$stmt
$stmt->bind_param("sssd",$isbn,$author,$title,$price); // 语句对象的bind_param()方法，详细介绍见下方
$stmt->execute(); // 真正的运行这个查询
echo $stmt->affected_rows.'book inserted into database.';
$stmt->close();
```

- bind_param()方法：

该方法方法告诉PHP哪些变量应该被问号所替换，第一个参数是格式化字符串，与printf使用的格式化字符串不同。在这里，所传递的值意味着4个参数分别是字符串、字符串、字符串和双精度。格式化字符串中的其他可能字符还有：i表示整数，b表示blob。在这个参数之后，必须列出与语句中的问号数量相同的变量。它们将依次被替换。

- 那么Prepared语句的作用如何呢？

这里，一个优点是可以改变这4个绑定变量的值，并且在不用准备的情况下重新执行这个语句。这个功能对于循环执行批量插入操作来说是非常有用的。

与绑定参数一样，也可以绑定结果。对于SELECT类型查询，可以使用$stmt-＞bind_result()函数（或mysqli_stmt_bind_result()函数）提供希望填充结果列的变量列表。

每次调用$stmt-＞fetch()函数（或者mysqli_stmt_fetch()函数）时，结果集下一行的列值将被填充到这些绑定变量中。例如，在前面介绍的图书搜索脚本中，可以使用：

```php
$stmt->bind_result($isbn,$author,$title,$price);
```

将这4个变量绑定到将通过查询返回的4列。在调用如下语句后：

```php
$stmt->execute();
```

可以在循环中调用：

```php
$stmt->fetch();
```

每当该语句被调用时，它将获得下一个结果行，并填充到4个绑定变量中。

也可以在相同的脚本中使用mysqli_stmt_bind_param()函数和mysqli_stmt_bind_result()函数。

### 使用 PHP 与数据库交互的其他接口

PHP支持连接到许多不同数据库的函数，包括Oracle、Microsoft SQL Server和PostgreSQL。

通常，连接和查询这些数据库的基本原理是相同的。个别函数名称可能会有所不同，而且不同的数据库具有不同的功能，但是如果可以连接到MySQL，就应该能够很容易应用MySQL中的知识连接到其他数据库。

如果希望使用PHP还没有提供支持的特殊数据库，可以使用常规的ODBC函数。ODBC表示开放的数据库连接，它是连接数据库的标准。由于各种明显的原因，ODBC只具有任何函数集的有限功能。如果要求必须兼容所有数据库，就不能使用任何数据库的特殊功能。

除了PHP附带的函数库以外，一些可供使用的数据库抽象类，例如MDB2，允许为不同的数据库类型使用相同的函数名称。

使用常规的数据库接口：PEAR MDB2

接下来，我们将简要地介绍使用PEAR MDB2抽象层的例子。这是PEAR所有组件中使用最为广泛的组件之一。关于MDB2抽象层的安装，请参阅 [PEAR的安装](https://www.cnblogs.com/yangf2016/p/6141298.html) 。

为了便于比较，我们将介绍如何使用MDB2来编写搜索结果的脚本：

从MySQL数据库检索结果并且格式化以供显示

```php
<html>
<head>
  <title>Book-O-Rama Search Results</title>
</head>
<body>
<h1>Book-O-Rama Search Results</h1>
<?php
  // create short variable names
  $searchtype=$_POST['searchtype'];
  $searchterm=trim($_POST['searchterm']);

  if (!$searchtype || !$searchterm) {
     echo "You have not entered search details.  Please go back and try again.";
     exit;
  }

  if (!get_magic_quotes_gpc()) {
    $searchtype = addslashes($searchtype);
    $searchterm = addslashes($searchterm);
  }

  // set up for using PEAR MDB2
  require_once('MDB2.php');
  $user = 'bookorama';
  $pass = 'bookorama123';
  $host = 'localhost';
  $db_name = 'books';

  // set up universal connection string or DSN
  $dsn = "mysqli://".$user.":".$pass."@".$host."/".$db_name;

  // connect to database
  $db = &MDB2::connect($dsn);

  // check if connection worked
  if (MDB2::isError($db)) {
    echo $db->getMessage();
    exit;
  }

  // perform query
  $query = "select * from books where ".$searchtype." like '%".$searchterm."%'";

  $result = $db->query($query);

  // check that result was ok
  if (MDB2::isError($result))  {
    echo $db->getMessage();
    exit;
  }

  // get number of returned rows
  $num_results = $result->numRows();

  // display each returned row
  for ($i=0; $i <$num_results; $i++) {
     $row = $result->fetchRow(MDB2_FETCHMODE_ASSOC);
     echo "<p><strong>".($i+1).". Title: ";
     echo htmlspecialchars(stripslashes($row['title']));
     echo "</strong><br />Author: ";
     echo stripslashes($row['author']);
     echo "<br />ISBN: ";
     echo stripslashes($row['isbn']);
     echo "<br />Price: ";
     echo stripslashes($row['price']);
     echo "</p>";
  }

  // disconnect from database
  $db->disconnect();
?>
</body>
</html>
```

使用MDB2的优点是只要记住一种数据库函数集，如果要改变数据库软件，只要对代码进行少量的修改就可以了。

### 进一步学习

- 参阅 [PHP手册](http://www.php.net/manual/zh/) 和 [MySQL手册](https://dev.mysql.com/doc/)
- [ODBC](https://www.webopedia.com/TERM/O/ODBC.html)

## MySQL 高级管理

- 深入理解权限系统
- 提高数据库的安全性
- 获取关于数据库的更多信息
- 使用索引提高查询速度
- 优化数据库
- 备份和恢复
- 实现复制

### 深入理解权限系统

当执行一条 GRANT 语句时，它会影响一个名为 mysql  的特殊数据库。权限信息就是保存在数据库的 6 个表中。

当执行 `use mysql;` 和 `show tables;` 命令后，会显示存储关于系统信息的表。保存权限信息的 6 个表分别是：user、host、db、tables_priv 和 columns_priv 以及 procs_priv。有时，这些表也称为授权表（GRANT tables）。

这些表的具体用途各不相同，但它们的基本用途都是相同的，都可以用来确定用户身份以及是否允许执行特定操作。这些表都包含两种类型的字段：范围字段，它可以指定用户、主机和数据库的一部分；权限字段，它可以指定该用户在该范围内可以执行哪些操作。

- user表和host表用于确定一个用户是否可以连接MySQL服务器，以及该用户是否具有任何管理员权限。
- db表和host表确定用户可以访问哪些数据库。
- tables_priv表确定用户可以使用数据库中哪些表。
- columns_priv表确定用户可以访问表中的哪些列。
- procs_priv表确定用户可以执行哪些过程。

#### user 表

用 `desc user` 查看表结构

表中的每一行对应于一组用户权限，该用户来自一个主机并用密码 Password 登录。

这些都是该表的范围字段（scope field），因为它们可以描述其他字段的范围，其他字段则称为权限字段（privilege field）。

该表（以及其他接下来的表）中列出的权限对应于我们在第9章中用GRANT语句授予的权限。例如，Select_priv对应于运行SELECT命令的权限。

如果一个用户具有特定的权限，该列中的值就应该是Y。相反，如果用户没有被授予该权限，其值就应该是N。

user表中列出的所有权限都是全局的，也就是说，它们适用于系统中（包括mysql数据库）所有数据库。因此，在这里，管理员的一些权限为Y，但是大部分用户应该全部为N。普通用户应该有一些访问适当数据库但不是所有表的权限。

#### db 表和 host 表

普通用户的权限大多数都保存在db表和host表中。

db表可以确定哪些用户可以访问哪些主机和哪些数据库。此表中给出的权限应用于在一个特定行中指定的任意数据库。

host表是db表的补充。如果一个用户从多个主机连接到数据库，在db表中将不会列出该用户的主机名。而与此项对应，该用户将在host表中获得一组记录，每个记录都指定了每个用户-主机对的权限。

#### tables_priv 表，columns_priv 表和 procs_priv 表

这三个表分别用于存储表级别的权限和列级别以及针对存储过程的权限。这与db表类似，但是它们分别为指定数据库中的表授予权限和为指定表中的列授予权限。

这些表的结构与user、db和host表结构有所不同。可以用 desc 命令查看。

tables_priv表的Grantor列用来存储被授予权限的用户。两个表中的Timestamp列用来存储授权日期与时间。

#### 访问控制：MySQL 如何使用 grant 表

MySQL使用grant表通过两个步骤来确定允许用户做什么：

1)连接验证。在这里，MySQL基于如上所示的user表中的信息检查用户是否有权连接数据库。这是基于用户名、主机名和密码进行的验证。如果用户名为空，它将匹配所有用户。主机名可以用通配符%指定。通配符%可以用作整个主机名（也就是说，“%”符号匹配所有的主机），或者用作主机名的一部分，例如，%.tangledweb.com.au匹配所有以.tangledweb.com.au结尾的主机。如果密码字段为空，则不要求密码。在主机名称中避免使用通配符，避免使用没有密码的用户名，避免空用户名，这样做会更安全。如果主机名为空，MySQL将引用host表，找到匹配的user和host对。

2)请求验证。当建立一个连接之后，对于所发送的每一个请求，MySQL都会检查是否有执行该请求的权限级别。系统首先将检查全局权限（在user表中），如果这些还不够，系统将再检查db表和host表。如果仍然没有足够的权限，MySQL将检查tables_priv表，如果权限还不够，最后将检查columns_priv表。

#### 更新权限：修改什么时候生效

MySQL服务器启动的时候以及使用GRANT和REVOKE语句的时候，服务器会自动读取grant表。但是，既然我们知道这些权限保存在什么地方以及它们是如何保存的，就可以手动修改它们。当手动更新它们的时候，MySQL服务器将不会注意到它们已经被修改了。

我们必须向服务器指出已经对权限进行了修改，有3种方法可以实现了这个任务。可以在MySQL提示符下（必须以管理员的身份登录进入）输入：

```sql
FLUSH PRIVILEGES;
```

这是更新权限最常使用的方法。或者还可以在操作系统中运行：

```sql
myslqadmin FLUSH-PRIVILEGES;
```

或者：

```sql
mysqladmin RELOAD;
```

此后，当用户下次再连接的时候，系统将检查全局级别权限；当下一个命令被执行时，将检查数据库级别的权限；而表级别和列级别权限将在用户下次请求的时候被检查。

### 提高 MySQL 数据库的安全性

- **从操作系统的角度来保护 MySQL**

1. 创建专门的用户来管理数据库。在服务器上，一般来说 userid=mysql 的用户时管理者
2. 将MySQL服务器建立于防火墙后。端口可以随时关闭。

- **密码**

1. 密码尽量复杂，定期修改密码
2. 将用户名和密码保存在一个脚本中，这个脚本要保存在Web文档树之外
3. 不要以纯文本的形式保存于数据库中，可以使用MySQL的SHA1()函数将密码加密后进行单向保存。

- **用户权限**

1. 非必须情况下不要将 PROCESS、FILE、SHUTDOWN 和 RELOAD 等权限授予非管理员用户。PROCESS 权限可以观察其他用户正在做什么，输入了什么，包括他们的密码。FILE 权限可以用来读写操作系统中的文件（例如，包括UNIX系统中的 /etc/password）。
2. 确认在建立用户时，只授予他们从当前连接的主机访问数据库的权限。
3. 通过在 host 表中使用 IP 地址而不是域名来域名来提高安全性能。
4. 防止非管理员用户访问 Web 服务器中的 mysqladmin 程序

- **Web 问题**

1. 建立一个专门用于网络连接的用户。如在类型表中只授予 SELECT 权限，在订单表中只授予 INSERT 权限。
2. 经常检查来自用户的所有数据。
3. 检查用户输入的数据类型，及时清理不合法数据。addslashes() 函数的使用。
4. 使用 SSL 保存用户输入的密码或者机密数据。

### 获取更多关于数据库的信息

#### 使用 SHOW 获取信息

- 显示数据库 `SHOW databases;`
- 查看一个数据库中的表 `SHOW tables FROM books;`
- 获取数据表的所有列 `SHOW COLUMNS FROM orders FROM books;` 或者 `SHOW COLUMNS FROM books.orders;`
- 查看用户所拥有的权限 `SHOW GRANTS FOR bookorama;`
- 其他用法，见 [传送门](https://dev.mysql.com/doc/refman/8.0/en/show.html)

#### 使用 DESCRIBE 获取关于列的信息

基本语法：`DESCRIBE table[column];`

这将给出表中所有列的信息，或者如果指定了列，将给出该列的信息。也可以在列名中使用通配符。

#### 使用 EXPLAIN 理解查询操作的工作流程

两种方式调用 EXPLAIN 语句。

方式一：`EXPLAIN table;`，该方式类似于 `DESCRIBE table`

方式二：在 SELECT 语句前面加上 EXPLAIN ，查看是 MySQL 是如何解释并执行 SELECT 查询的。

当试图使一个复杂的查询能够正常工作起来而查询语句写得不是很正确的时候，或者当一个查询的执行时间大大超出它应该需要的时间时，可以使用EXPLAIN语句。如果编写一个复杂的查询，可以在实际运行查询之前执行EXPLAIN命令以提前检查它，根据该语句的结果，如果有必要的话，可以修改SQL语句，从而对其进行优化。它也是方便的学习工具。

使用实例：

```sql
explain
select customers.name
from customers,orders,order_items,books
where customers.customerid=orders.customerid
and orders.orderid=order_items.orderid
and order_items.isbn=books.isbn
and books.title like'%Java%';
```

输出解释：

id，给出的是该行所引用的查询SELECT语句的ID号。

select_type列，解释了所使用的查询类型。

table列只是列出了用来完成查询所需的表。

type列解释了表在查询的关联中是如何使用的。

rows列列出（粗略地）执行连接所必须扫描的每个表的行数。

possible_keys列列出MySQL可能用来连接表的关键字。

key列，或者是MySQL实际使用的表中的关键字，或者为NULL，如果没有使用关键字的话。

key_len列给出了所用关键字的长度。

ref列显示的是用来从表中选择列而必须与关键字一起使用的列。

extra列告诉我们关于连接是如何执行的，以及其他所有信息。

- **解决在 EXPLAIN 的结果中出现的问题**

**首先**，可以检查列类型并且确认它们相同。这特别适用于列宽度。如果它们的列宽度不同，索引不能用于匹配这些列。

可以通过修改列类型以使其匹配，或者在设计的开始就建立类型匹配的列，从而解决这个问题。

**其次**，可以让关联优化器来检查关键字的分布，因此使用myisamchk或ANALYZE TABLE语句对关联进行优化，使得它效率更高。可以使用如下命令调用它：

```sql
myisamchk --analyze pathtomysqldatabase/table
```

可以通过在命令行上列出所有连接，对多个表进行检查，或者使用：

```sql
myisamchk--analyze pathtomysqldatabase/*.MYI
```

可以运行下列命令检查所有数据库的所有表：

```sql
myisamchk--analyze pathtomysqldatadirectory/*/*.MYI
```

或者，可以在MySQL监视程序中运行ANALYZE TABLE语句来列出所有表：

```sql
analyze table customers,orders,order_items,books;
```

**除此之外**，可能还要考虑对该表添加一个新索引。如果该查询是a）慢和b）一般，就应该认真考虑这个问题。如果它是一个使用一次就不再使用的查询，例如请求一次的模糊报告，它将不值得这样的努力，因为它将使其他东西慢下来。

如果EXPLAIN结果**possible_keys列包含一些NULL值**，可能需要对正在被讨论的表添加一个索引来提高查询性能。如果在WHERE子句中使用的列适合作为索引，可以使用ALTER TABLE语句为它创建一个新索引，例如：

```sql
ALTER TABLE tablename ADD INDEX (columnname);
```

### 数据库的优化

除了上述的优化技巧，通常，还有许多技巧可以用来提高对 MySQL 数据库的性能。

#### 设计优化

一般来说，我们可能会希望数据库中每一个数据越小越好。因此，可以使用最小化冗余的设计思想来实现此目的。当然，也可以通过使用最小的列数据类型来实现它。也应该尽可能使NULL最少，使主键尽可能短。

如果可能，尽量避免使用可变长度列（像VARCHAR、TEXT和BLOB）。如果字段长度固定，它们用起来将更快，但是要占用多一点的空间。

#### 权限

除了使用前面所述的关于EXPLAIN的建议，还可以通过简化权限来提高查询速度。前面，我们讨论了在查询执行之前通过权限系统检查该查询的过程，该过程越简单，查询速度越快。

#### 表的优化

如果一个表已经用了一段时间，随着更新和删除操作的发生，数据将会变得支离破碎。这样同样会增加在该表中查询所花的时间。可以使用如下语句修复它：

```sql
OPTIMIZE TABLE tablename
```

或在命令提示符下键入：

```sql
myisamchk-r table
```

也可以使用myisamchk工具根据索引对该表索引和数据进行排序，如下所示：

```sql
myisamchk--sort-index--sort-records=1 pathtomysqldatadirectory/*/*.MYI
```

#### 使用索引

可以在需要提高查询速度的地方使用索引。简化索引，不要创建查询不使用的索引。运行前面所介绍的EXPLAIN命令可以检查该索引是否正在使用中。

#### 使用默认值

在尽可能的地方使用列的默认值，只在与默认值不同的时候才插入数据。这样可以减少执行INSERT语句所花的时间。

#### 其他技巧

- [官网](https://www.mysql.com)

### 备份 MySQL 数据库

三种方法备份数据库：

1. 复制数据文件时**使用 LOCK TABLE 命令**锁定表

```sql
LOCK TABLES tablename lock_type [, tablename lock_type ...] #lock_tpye可以时 READ 或 WRITE
```

对于备份来说，只需要READ锁。在执行备份之前，必须执行FLUSH TABLES；命令来确保对索引所做的任何修改将写入到磁盘。

在执行备份时，用户和脚本还可以运行只读查询。如果有大量可以修改数据库的查询，例如客户订单，这种解决方案并不实际。

1. **使用mysql_dump命令**，该命令是在操作系统的命令行下使用的，该命令的典型用法如下所示：**此方法较好**

`mysqldump--opt--all-databases＞all.sql`

上述命令将所有用来重新构建一个SQL数据库所需的内容都导出到一个名为all.sql的文件中。

稍后，可以停止mysqld进程，并且通过--log-bin[=logfile]命令选项重新启动它。保存在日志文件中的更新将给出上次备份后数据库发生的变化。（很明显，在任何常规文件的备份中，还应该备份所有日志文件。）

1. **使用mysqlhotcopy脚本**。可以使用如下命令调用：

`mysqlhotcopy database/path/for/backup`

然后，必须遵照前面介绍的启动和停止数据库的操作。

备份（故障转移）的最后一个方法是维护数据库的一个副本。数据库的复制将在本章稍后内容介绍。

### 恢复 MySQL 数据库

如果需要恢复MySQL数据库，也有许多方法可以实现。如果出现了一个破坏了的表，可以运行带有-r（修复）选项的myisamchk命令。

如果使用了第一种方法执行备份，可以将数据文件重新复制到安装MySQL的相同位置。

如果使用了第二种方法执行备份，数据库的恢复就需要执行一些操作。首先，必须在导出文件中运行查询。这可以将数据库重新构建至导出该文件时的状态。接着，还应该将数据库更新至保存在二进制日志文件中的状态。可以运行如下所示的命令：

`mysqlbinlog hostname-bin.[0-9]*|mysql`

可以在MySQL站点找到关于MySQL备份和恢复的更多信息：https://www.mysql.com

### 实现复制

复制是一个允许提供相同数据库的多个数据库服务器的技术。这样，可以载入共享并提高系统可靠性；如果有一个服务器停止运行，其他服务器还能继续工作。复制一旦设置成功。它也可以用作备份。

其基本思想就是拥有一个主服务器，并且为其添加几个从服务器。每一个从服务器都镜像了主服务器。当最初设置了从服务器后，可以在任何时候在主服务器上复制所有数据的快照。这样，从服务器将请求来自主服务器的更新。主服务器将传输通过其二进制日志而执行的查询细节，而从服务器可以重新将这些查询应用于它们的数据。

使用这种设置的常规方法是在主服务器应用写查询，而对从服务器应用读查询。这是通过应用程序逻辑来实现的。更复杂的架构也是可能的，例如具有多个主服务器，但是我们只介绍典型示例的设置。

我们必须意识到，通常从服务器的数据都没有主服务器的数据新。这发生在任何分布式数据库中。

要开始设置主服务器和从服务器架构，必须确认主服务器上启用了[二进制日志记录](https://blog.csdn.net/risen16/article/details/53414081)。

必须在主服务器和从服务器上编辑my.ini或my.cnf文件。在主服务器上，需要如下所示的设置：

```
[mysqld]
log-bin
server-id=1

```

首要的操作就是开启二进制日志记录（这样就已经启动了二进制日志；如果没有，现在添加该语句）。第二个设置是为主服务器分配一个唯一的ID。每一个从服务器都需要一个ID，因此必须在每一个从服务器的my.ini/my.cnf文件中添加类似行。请确认，ID号是唯一的。例如，第一个从服务器可以设置为server-id=2；而下一个可以为server-id=3；等。

#### 设置主服务器

在主服务器上，必须为从服务器创建一个用来连接主服务器的用户。从服务器的这个特殊的权限级别称作复制从服务器。根据如何策划实现初始数据传输的不同，可以临时授予某些额外的权限。

在大多数情况下，可以使用数据库快照来传输数据，而在这个例子中，只需要特殊的复制从服务器器权限。如果决定使用LOAD DATA FROM MASTER命令来传输数据（在下一节学习此内容），该用户还需要RELOAD、SUPER和SELECT权限，但是只用作初始的设置。根据第9章介绍的最少权限原则，在系统设置成功并运行起来后，必须撤销额外的权限。

在主服务器上创建一个用户。我们可以定义任意的用户名并且给定任意的密码，但是必须记住所选择的用户名和密码。在我们的例子中，用户名为rep_slave：

```sql
grant replication slave
on*.*
to'rep_slave'@'%'identified by'password';
```

很明显，我们必须修改该密码。

####  执行初始的数据传输

将数据从主服务器传输到从服务器有几种方法。最简单的方法是设置从服务器（将在下一节介绍），然后运行LOAD DATA FROM MASTER语句。这种方法的问题是在数据传输过程中，它将锁定主服务器上的表，而且这种传输需要一定的时间，因此我们并不建议使用这种方法（只有使用MyISAM表时，可以使用这个选项）。

通常，在当前时间获得数据库的一个快照是一个更好的办法。可以使用本章其他地方介绍的备份过程来获得快照。必须首先使用如下语句来清空表：

```sql
flush tables with read lock;
```

使用读锁定的原因是必须在获得快照时记录服务器在二进制日志中的位置。可以通过执行如下所示的语句来实现：

```sql
show master status;
```

输出结果不在这里打印了。

请注意，File和Position的值；需要这些信息来设置从服务器。

现在，使用如下所示的语句获得快照并去除表的读锁定：

```sql
unlock tables;
```

如果所使用的是InnoDB表，最简单的方法是使用InnoDB Hot Backup工具，可以在https://www.innodb.com获得该工具。这并不是一个免费软件，因此需要一定的许可费用。

或者，可以使用这里所介绍的步骤，在去除表锁定之前，关闭MySQL服务器，并且在重新启动服务器和去除表锁定之前，复制所希望复制的数据库整个目录。

#### 设置一个/多个从服务器

设置一个/多个从服务器有两个选项。如果获得数据库的快照，可以在从服务器上安装它。

接下来，在从服务器上运行如下所示查询：

```sql
change master to
master-host='server',
master-user='user',
master-password='password',
master-log-file='logfile',
master-log-pos=logpos;
start slave;
```

必须填充以斜体字显示的数据。server是主服务器的名称。user和password来自在主服务器运行的GRANT语句。logfile和logpos来自在主服务器上运行的SHOW MASTER STATUS语句的输出。

现在，你应该已经设置并运行了从服务器。

如果没有获得快照，可以执行如下所示的语句在运行了以上查询后载入数据：

```sql
load data from master;
```

### 进一步学习

- [官网](https://www.mysql.com)

## MySQL 高级编程

- LOAD DATA INFILE 语句
- 存储引擎
- 事务
- 外键
- 存储过程

### LOAD DATA INFILE 语句

可以使用这个语句从一个文件载入表数据，执行速度非常快。

常见用法：

```sql
LOAD DATA INFILE "newbooks.txt" INTO TABLE books;
```

该命令行从newbooks.txt文件将原始数据读入到表books。在默认情况下，文件中的数据字段必须通过Tab键进行间隔，而且必须包括在单引号内，同时每一行都必须由换行（\n）符进行间隔。特殊字符必须用“\”进行转义。所有这些特性都可以通过LOAD语句的不同选项进行配置；参阅MySQL手册，获得更详细信息。

要使用LOAD DATA INFILE语句，用户必须具有FILE权限。

### 存储引擎

MySQL 支持许多不同的存储引擎，有时候也称作表格类型。

数据库每个表可以使用不同的存储引擎，而且可以轻松地对它们进行转换。

创建表时，可以选择存储引擎（表格类型）：

```sql
CREATE TABLE tablename TYPE = type ...
```

常见的可用表格类型包括：

- MyISAM：默认

具有检查和修复表格的大多数工具。可以被压缩，支持全文搜索。不是事务安全的，不支持外键。当对一个表格使用大量的SELECT或INSERT语句（或者二者的结合）时，应该使用MyISAM表格，因为在执行这两种命令时，MyISAM是最快的。

- MEMORY

该类型的表存储在内存中，表的索引是哈希分布的。运行速度非常快，如若发生崩溃，数据将丢失。适合保存临时数据或者派生的数据。应该在CREATE TABLE语句中指定MAX_ROWS，否则这些表可能会吞噬所有内存。同样，它们也不能具有BLOB、TEXT或AUTO INCREMENT列。

- MERGE

这些表允许你为了查询的目的，把MyISAM表的集合作为一个单个表。因此，你可在某些操作系统中避开最大文件大小限制。

- ARCHIVE

这些表保存了大量数据，但是只有少量的脚注（footprint）。这种类型的表只支持INSERT和SELECT查询，不支持DELETE、UPDATE和REPLACE。此外，也不使用索引。

- CSV

这些表保存在服务器的单个文件中，它包含了用逗号间隔的数据。这种标类型的优点在于在需要查看的时候，否则，完全可以使用一种外部的表格应用程序来存储数据，例如Microsoft的Excel。

- InnoDB

这种类型的表是事务安全的；也就是说，它们提供了COMMIT和ROLLBACK功能。InnoDB表还支持外键。虽然比MyISAM表要慢，但是如果应用程序需要一个事务安全的存储引擎，我们**建议使用**它。

在大多数的 Web 应用程序中，通常会使用 MyISAM 或 InnoDB 表格或者二者的结合。

创建表格后修改表格类型：

```sql
ALTER TABLE orders ENGINE = InnoDB；
ALTER TABLE order_items ENGINE = InnoDB;
```

### 事务

事务是确保数据库一致的机制，尤其是在发生错误或服务器崩溃情况下确保数据库一致的机制。

接下来，将学习如何使用 InnoDB 实现事务。

#### 理解事务的定义

事务是一个或一系列的查询，这些查询可以保证能够在数据库中作为一个整体全部执行或者全部不执行。这样，数据库才能在无论事务是否完成的情况下保持一致状态。

描述事务安全性的 4 个需求：（ACID 原则）

1. Atomicity（原子性）
2. Consistency（一致性）
3. Isolation（孤立性）
4. Durability（持续性）

一个事务被永久地写入到数据库中称作该事务被提交了。一个没有写入到数据库中的事务（需要重置初始状态）称作事务被回滚了。

#### 通过 InnoDB 使用事务

在默认的情况下，MySQL是以自动提交（autocommit）模式运行的。这就意味着所执行的每一个语句都将立即写入到数据库（提交）中。如果我们使用事务安全的表格类型，很可能不希望这种行为。

要在当前的会话中关闭自动提交，输入如下所示的命令：

```sql
SET AUTOCOMMIT = 0;
```

如果自动提交被打开了，必须使用如下所示语句开始一个事务：

```sql
START TRANSACTION;
```

如果自动提交是关闭的，不需要使用以上命令，因为当输入一个SQL语句时，一个事务将自动启动。

在完成了组成事务的语句输入后，可以使用如下所示语句将其提交给数据库：

```sql
COMMIT;
```

如果改变主意，可以使用如下所示语句回到数据库以前的状态：

```sql
ROLLBACK;
```

只有提交了一个事务，该事务才能在其他会话中被其他用户所见。

举个例子：

```sql
# 切换表格类型（存储引擎）
ALTER TABLE orders ENGINE = InnoDB;
ALTER TABLE order_items ENGINE = InnoDB;

# 连接books数据库后插入数据（新的订单记录）
INSERT INTO orders VALUES(5, 2, 69.98, '2018-07-18');
INSERT INTO order_items VALUES(5, '0-672-31697-8', 1);

# 查询新订单
SELECT * FROM orders WHERE orderid = 5；

/* 保持该连接的打开状态，进入到另一个连接，运行上面的 SELECT 查询，
将无法看到该订单记录，如果可以看到该订单记录，很可能时没有关闭自动提交*/

# 现在回到第一个连接并且提交该事务
COMMIT;

# 现在可以在另一个连接中查询新的订单记录
```

### 外键

InnoDB也支持外键。回忆一下，在第8章中，我们已经介绍了外键的概念。当使用MyISAM表格时，无法强制使用外键。

设置外键：

方式一：使用 DDL 语句定义新表格

```sql
CREATE TABLE order_item(
	orderid INT UNSIGNED NOT NULL REFERENCES orders(orderid), # 添加外键，orders表格中的orderid列
    isbn CHAR(13) NOT NULL,
    quantity TINYINT UNSIGNED,
    PRIMARY KEY (orderid, isbn)
)ENGINE = InnoDB; # 声明表格类型，这是外键所要求的
```

方式二：使用 ALTER TABLE 语句修改已有表格

```sql
ALTER TABLE order_items ENGINE = InnoDB;
ALTER TABLE order_items
ADD FOREIGN KEY (orderid) REFERENCES orders(orderid);
```

### 存储过程

一个存储过程是一个可编程的函数，它在MySQL中创建并保存。它可以由SQL语句和一些特殊的控制结构组成。当希望在不同的应用程序或平台上执行相同的函数，或者封装特定功能时，存储过程是非常有用的。数据库中的存储过程可以看作是对编程中面向对象方法的模拟。它们允许控制数据的访问方式。

#### 实例

存储过程的声明：**basic_stored_procedure.sql**

```sql
# Basic stored procedure example
delimiter//
create procedure total_orders(out tatal float) # 存储过程的名称叫total_orders,返回值是total
BEGIN # 相当于PHP中的｛
select sum(amount) into total from orders; # into total表示对total的赋值
END #相当于PHP中的｝
//
delimiter;
```

第一行语句 `delimiter//` 将语句末尾的分隔符从当前值（这个分隔符通常是分号，除非以前改变了分隔符）改为双斜杠字符。这样做的目的是可以在存储过程中使用分号分隔符，这样MySQL就会将分号当作是存储过程的代码，不会执行这些代码。

最后一行 `delimiter;`，将分隔符重新设置为分号

调用该过程：

```sql
CALL total_orders(@t);
```

这个语句将调用total_orders过程并且传入一个用来保存结果的变量。要查看该结果，需要查看改变量，如下语句所示：

```sql
SELECT @t;
```

与创建过程的方法类似，可以创建一个函数。函数接收输入参数并且返回一个唯一值。创建函数的基本语法几乎相同。

示例：创建简单函数

```sql
#Basic syntax to create a function
delimiter//
create function add_tax(price float) returns float
return price*1.1;
//
delimiter;
```

提示	参数不必通过IN或OUT来指定，因为所有参数都是IN，或输入参数。在参数列表之后是returns float子句，它指定了返回值的类型。需要再次提到的是，该值可以是任何有效的MySQL类型。	

请注意，这个示例并没有使用BEGIN和END语句。可以使用它们，但是它们并不是必需的。就像在PHP中，如果一个语句块只包含了一个语句，就不需要标注该语句块的开始和结束。

调用函数：

```sql
SELECT add_tax(100);
```

查看过程或函数的代码：

```sql
SHOW CREATE PROCEDURE total_orders;
SHOW CREATE FUNCTION add_tax;
```

删除过程或函数

```sql
DROP PROCEDURE total_orders;
DROP FUNCTION add_tax;
```

#### 局部变量

```sql
#Basic syntax to create a function
delimiter//
create function add_tax(price float)returns float
begin
declare tax float default 0.10; #declare声明关键字
return price*(1+tax);
end
//
delimiter;
```

#### 游标和控制结构

```sql
/*寻找订单金额最大的客户，可以使用max函数，但是为了说明过程，自己编写了*/
delimiter//
create procedure largest_order(out largest_id int)
begin
declare this_id int; #保存当前行的 orderid
declare this_amount float; #保存当前行的 amount
declare l_amount float default 0.0; #保存最大的订单金额
declare l_id int; #保存最大订单金额的id
declare done int default 0; #循环标记，初始值为false，遍历所有的行后，值变成1

/*下面是一个声明句柄。类似于存储过程中的一个异常。在continue句柄和exit句柄中，也可以使用它。就像以上代码所显示的，continue句柄执行了指定的动作，并且继续存储过程的执行。exit句柄将从最近的begin...end代码块中退出。
声明句柄的下一个部分指定了句柄被调用的时间。在这个例子中，该句柄将在sqlstate'02000'语句被执行时调用。你可能会奇怪，这是什么意思，因为该语句非常神秘。这意味着，该句柄将在无法再找到记录行后被调用。我们将逐行处理一个结果集，而且当遍历了所有需要处理的记录行时，这个句柄将被调用。也可以指定等价的FOR NOT FOUND语句。其他选项还包括SQLWARNING和SQLEXCEPTION。*/
declare continue handler for sqlstate'02000'set done=1; 

declare c1 cursor for select orderid,amount from orders; #定义一个游标，该游标保存查询数组的结果集。一次保存一行，这里只是定义，不会执行
open c1; #运行这个查询需要一个fetch语句
repeat
fetch c1 into this_id,this_amount;
if not done then
if this_amount＞l_amount then
set l_amount=this_amount;
set l_id=this_id;
end if;
end if;
until done end repeat;
close c1; #循环结束，执行清除操作
set largest_id=l_id;
end
//
delimiter;
```

上面的控制结构也可以选择用 while 和 loop 或者 case 语句。

需要注意的是，**不支持 for 循环**

### 进一步学习

- [An Introduction to Database System](https://www.amazon.com/Introduction-Database-Systems-8th/dp/0321197844)
- https://www.mysql.com/