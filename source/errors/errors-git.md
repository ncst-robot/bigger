# 解惑 Git

## Permission denied (publickey).

远程仓库并不认可你的身份，认为你没有权限**写**这个仓库。在本地主机和远程主机建立一个都认可的秘钥就可以了，也就是在本地生成一个公钥，然后在告诉远程仓库，我用的是这个公钥，这样问题就解决了。

生成一个公钥可以参考博客园博主王老头的[这篇文章](https://www.cnblogs.com/wmr95/p/7852832.html)

**重述**

1. 首先打开Terminal或者CMD，输入下面命令


```
ssh-keygen -t rsa -C "youremail@example.com" # 需要修改email为自己的

ssh -v git@github.com

ssh-agent -s

ssh-add ~/.ssh/id_rsa  # 若出现错误则执行 eval `ssh-agent -s` && ssh-add ~/.ssh/id_rsa

cat ~/.ssh/id_rsa.pub

```

2. 复制出现的内容，粘贴到github的SSH Key中，完事。

3. 检查是否成功 `ssh -T git@github.com`

4. 继续执行你没有运行的命令

## 切换本地凭据（Windows上登录的GitHub账号）

切换本地用户，可以向微软小娜搜索Windows凭据，这个步骤可以参考[这篇博客](https://blog.csdn.net/xudailong_blog/article/details/78798118) 的说明。

## 配置了SSH后还是每次都要求输入密码

保存凭证可以解决问题

```
git config --global credential.helper store
```

## The following untracked working tree files would be overwritten by merge

保留远程服务器中的内容，覆盖本地的内容

```
git clean -d -fx
git pull
```