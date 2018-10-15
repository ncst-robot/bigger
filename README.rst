==================================
华北理工大学认知机器人实验室
==================================

知识社区

共建知识文档
^^^^^^^^^^^^^^^^


第一步 配置环境
--------------------------------------------

1. 下载并安装 Python 3.7.0 `64位 <https://www.python.org/ftp/python/3.7.1/python-3.7.1rc2-amd64.exe>`_ | `32位 <https://www.python.org/ftp/python/3.7.1/python-3.7.1rc2.exe>`_ (Windows自带pip，注意安装的时候添加环境变量)
#. 下载并安装 `git <https://git-scm.com/downloads/>`_ ，一路Next。
#. 克隆仓库 ``git clone https://github.com/ncst-robot/bigger.git``
#. 将 ``configure.bat`` 用记事本打开，修改YourEmailAddress为你的github注册邮箱，然后，修改YourName为你的github用户名
#. 将 ``submit.bat`` 用记事本打开，修改YourName为你的github用户名
#. Win + R 输入 cmd ，然后 cd 到 bigger 目录
#. 配置环境：cmd中输入 ``configure`` 
#. 效果预览：cmd中输入 ``make html`` 回车，然后，打开 build 文件夹，找到 index.html，双击打开即可看到效果
#. 提交修改：cmd中输入 ``submit``
#. `在线查看效果 <https://bigger.readthedocs.io/en/latest/index.html>`_

第二步 熟悉reStructuredText书写语法
--------------------------------------------

1. `基本格式说明 <https://github.com/seayxu/CheatSheet/blob/master/files/reStructuredText-Quick-Syntax.md>`_
#. `格式说明（英文较全）`_
#. `在线编辑器`__

.. _`格式说明（英文较全）`: http://docutils.sourceforge.net/docs/user/rst/quickref.html
.. __: http://rst.ninjs.org/#

第三步 修改文档并提交
--------------------------------------------

1. 修改文件：打开 source 文件夹，修改你想要修改的文件
#. 需要注意在 index.rst 中添加你的修改路径
#. 提交修改：双击 submit.bat

>>> 前两步工作一旦完成，就不需要再次修改。之后只需要修改第三步。

>>> 警告: 除了 source 的文件可以修改外，其他位置的文件不要修改，否则可能会引起致命错误。