---
title: Linux 参考
date: 2018-9-6 23:24:14
tags: [Linux,重要参考]
---

## 目录结构

|目录|说明|
|----------|--------------|
|/ |根目录|
|/bin| 工具目录|
|/lib |库目录|
|/usr |用户目录|
|/home |家目录，保存用户配置|
|/dev |设备目录|
|/usr/includes| 头文件|

##文件权限

-rw-r--r-- '文件所有者' '用户组' '其他用户'

第一位：表示文件类型，d文件夹，-普通文件

后九位：表示权限，r可读，w可写，x可执行



## Linux 命令大全

### 文件管理

| **文件管理**                                                 |                                                              |                                                              |                                                              |
| :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| [cat](http://www.runoob.com/linux/linux-comm-cat.html) <br/> 查看文本内容，通过重定向可以合并文本     | [chattr](http://www.runoob.com/linux/linux-comm-chattr.html) | [chgrp](http://www.runoob.com/linux/linux-comm-chgrp.html)<br/>改变文件所属用户组  | [chmod](http://www.runoob.com/linux/linux-comm-chmod.html) <br />修改文件权限(u+w给用户写权限，g-w给用户组去掉写权限，o=rwx其他用户有读写执行权限) |
| [chown](http://www.runoob.com/linux/linux-comm-chown.html)<br/>改变文件所有者   | [cksum](http://www.runoob.com/linux/linux-comm-cksum.html)   | [cmp](http://www.runoob.com/linux/linux-comm-cmp.html)       | [diff](http://www.runoob.com/linux/linux-comm-diff.html)     |
| [diffstat](http://www.runoob.com/linux/linux-comm-diffstat.html) | [file](http://www.runoob.com/linux/linux-comm-file.html) <br/>查看文本类型    | [find](http://www.runoob.com/linux/linux-comm-find.html) <br/> 文件搜索   | [git](http://www.runoob.com/linux/linux-comm-git.html)       |
| [gitview](http://www.runoob.com/linux/linux-comm-gitview.html) | [indent](http://www.runoob.com/linux/linux-comm-indent.html) | [cut](http://www.runoob.com/linux/linux-comm-cut.html)       | [ln](http://www.runoob.com/linux/linux-comm-ln.html)  <br/> 建立一个链接，添加超链接，分为硬链接和软连接，硬链接不能链接目录      |
| [less](http://www.runoob.com/linux/linux-comm-less.html)     | [locate](http://www.runoob.com/linux/linux-comm-locate.html)<br/>查询数据库 | [lsattr](http://www.runoob.com/linux/linux-comm-lsattr.html) | [mattrib](http://www.runoob.com/linux/linux-comm-mattrib.html) |
| [mc](http://www.runoob.com/linux/linux-comm-mc.html)         | [mdel](http://www.runoob.com/linux/linux-comm-mdel.html)     | [mdir](http://www.runoob.com/linux/linux-comm-mdir.html)     | [mktemp](http://www.runoob.com/linux/linux-comm-mktemp.html) |
| [more](http://www.runoob.com/linux/linux-comm-more.html)  <br/>  分页显示 | [mmove](http://www.runoob.com/linux/linux-comm-mmove.html)   | [mread](http://www.runoob.com/linux/linux-comm-mread.html)   | [mren](http://www.runoob.com/linux/linux-comm-mren.html)     |
| [mtools](http://www.runoob.com/linux/linux-comm-mtools.html) | [mtoolstest](http://www.runoob.com/linux/linux-comm-mtoolstest.html) | [mv](http://www.runoob.com/linux/linux-comm-mv.html) <br />移动或重命名 | [od](http://www.runoob.com/linux/linux-comm-od.html)         |
| [paste](http://www.runoob.com/linux/linux-comm-paste.html)   | [patch](http://www.runoob.com/linux/linux-comm-patch.html)   | [rcp](http://www.runoob.com/linux/linux-comm-rcp.html)       | [rm](http://www.runoob.com/linux/linux-comm-rm.html) <br />什么都能删，-r表示删除的是文件夹，-f忽略提示强制删除，-i每次删除都给出提示|
| [slocate](http://www.runoob.com/linux/linux-comm-slocate.html) | [split](http://www.runoob.com/linux/linux-comm-split.html)   | [tee](http://www.runoob.com/linux/linux-comm-tee.html)       | [tmpwatch](http://www.runoob.com/linux/linux-comm-tmpwatch.html) |
| [touch](http://www.runoob.com/linux/linux-comm-touch.html) <br />修改文件时间为当前时间，通常也可以用来创建文件 | [umask](http://www.runoob.com/linux/linux-comm-umask.html)   | [which](http://www.runoob.com/linux/linux-comm-which.html) <br />查看命令位置 | [cp](http://www.runoob.com/linux/linux-comm-cp.html) <br />复制 |
| [whereis](http://www.runoob.com/linux/linux-comm-whereis.html) <br />查找可执行文件 | [mcopy](http://www.runoob.com/linux/linux-comm-mcopy.html)   | [mshowfat](http://www.runoob.com/linux/linux-comm-mshowfat.html) | [rhmask](http://www.runoob.com/linux/linux-comm-rhmask.html) |
| [scp](http://www.runoob.com/linux/linux-comm-scp.html)       | [awk](http://www.runoob.com/linux/linux-comm-awk.html)       | [read](http://www.runoob.com/linux/linux-comm-read.html)     |                                                              |

### 文档编辑

| **文档编辑**                                               |                                                            |                                                            |                                                              |
| ---------------------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------- | ------------------------------------------------------------ |
| [col](http://www.runoob.com/linux/linux-comm-col.html)     | [colrm](http://www.runoob.com/linux/linux-comm-colrm.html) | [comm](http://www.runoob.com/linux/linux-comm-comm.html)   | [csplit](http://www.runoob.com/linux/linux-comm-csplit.html) |
| [ed](http://www.runoob.com/linux/linux-comm-ed.html)       | [egrep](http://www.runoob.com/linux/linux-comm-egrep.html) | [ex](http://www.runoob.com/linux/linux-comm-ex.html)       | [fgrep](http://www.runoob.com/linux/linux-comm-fgrep.html)   |
| [fmt](http://www.runoob.com/linux/linux-comm-fmt.html)     | [fold](http://www.runoob.com/linux/linux-comm-fold.html)   | [grep](http://www.runoob.com/linux/linux-comm-grep.html) <br/> 文本搜索，提取管道信息，-n从文本中搜索到文本同时显示行号，-i忽略大小写，-v取反  | [ispell](http://www.runoob.com/linux/linux-comm-ispell.html) |
| [jed](http://www.runoob.com/linux/linux-comm-jed.html)     | [joe](http://www.runoob.com/linux/linux-comm-joe.html)     | [join](http://www.runoob.com/linux/linux-comm-join.html)   | [look](http://www.runoob.com/linux/linux-comm-look.html)     |
| [mtype](http://www.runoob.com/linux/linux-comm-mtype.html) | [pico](http://www.runoob.com/linux/linux-comm-pico.html)   | [rgrep](http://www.runoob.com/linux/linux-comm-rgrep.html) | [sed](http://www.runoob.com/linux/linux-comm-sed.html)       |
| [sort](http://www.runoob.com/linux/linux-comm-sort.html)   | [spell](http://www.runoob.com/linux/linux-comm-spell.html) | [tr](http://www.runoob.com/linux/linux-comm-tr.html)       | [expr](http://www.runoob.com/linux/linux-comm-expr.html)     |
| [uniq](http://www.runoob.com/linux/linux-comm-uniq.html)   | [wc](http://www.runoob.com/linux/linux-comm-wc.html)       | [let](http://www.runoob.com/linux/linux-comm-let.html)     |   丨 <br/>管道，一个命令的输出可以通过管道当做另一个命令的输入        |

### 文件传输

| **文件传输**                                                 |                                                              |                                                              |                                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [lprm](http://www.runoob.com/linux/linux-comm-lprm.html)     | [lpr](http://www.runoob.com/linux/linux-comm-lpr.html)       | [lpq](http://www.runoob.com/linux/linux-comm-lpq.html)       | [lpd](http://www.runoob.com/linux/linux-comm-lpd.html)       |
| [bye](http://www.runoob.com/linux/linux-comm-bye.html)       | [ftp](http://www.runoob.com/linux/linux-comm-ftp.html)       | [uuto](http://www.runoob.com/linux/linux-comm-uuto.html)     | [uupick](http://www.runoob.com/linux/linux-comm-uupick.html) |
| [uucp](http://www.runoob.com/linux/linux-comm-uucp.html)     | [uucico](http://www.runoob.com/linux/linux-comm-uucico.html) | [tftp](http://www.runoob.com/linux/linux-comm-tftp.html)     | [ncftp](http://www.runoob.com/linux/linux-comm-ncftp.html)   |
| [ftpshut](http://www.runoob.com/linux/linux-comm-ftpshut.html) | [ftpwho](http://www.runoob.com/linux/linux-comm-ftpwho.html) | [ftpcount](http://www.runoob.com/linux/linux-comm-ftpcount.html) |                                                              |

### 磁盘管理

| **磁盘管理**                                                 |                                                              |                                                              |                                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [cd](http://www.runoob.com/linux/linux-comm-cd.html)  <br/> -进入上一次进入的目录      | [df](http://www.runoob.com/linux/linux-comm-df.html) <br/> 检测挂载占用磁盘空间       | [dirs](http://www.runoob.com/linux/linux-comm-dirs.html)     | [du](http://www.runoob.com/linux/linux-comm-du.html)  <br/>  检测目录占用磁盘空间     |
| [edquota](http://www.runoob.com/linux/linux-comm-edquota.html) | [eject](http://www.runoob.com/linux/linux-comm-eject.html)   | [mcd](http://www.runoob.com/linux/linux-comm-mcd.html)       | [mdeltree](http://www.runoob.com/linux/linux-comm-mdeltree.html) |
| [mdu](http://www.runoob.com/linux/linux-comm-mdu.html)       | [mkdir](http://www.runoob.com/linux/linux-comm-mkdir.html) <br/> 创建文件夹，如果同时创建多个文件夹可以加选项 -p | [mlabel](http://www.runoob.com/linux/linux-comm-mlabel.html) | [mmd](http://www.runoob.com/linux/linux-comm-mmd.html)       |
| [mrd](http://www.runoob.com/linux/linux-comm-mrd.html)       | [mzip](http://www.runoob.com/linux/linux-comm-mzip.html)     | [pwd](http://www.runoob.com/linux/linux-comm-pwd.html)  <br/> 查看完整绝对路径    | [quota](http://www.runoob.com/linux/linux-comm-quota.html)   |
| [mount](http://www.runoob.com/linux/linux-comm-mount.html)   | [mmount](http://www.runoob.com/linux/linux-comm-mmount.html) | [rmdir](http://www.runoob.com/linux/linux-comm-rmdir.html) <br/> 删除空文件夹 | [rmt](http://www.runoob.com/linux/linux-comm-rmt.html)       |
| [stat](http://www.runoob.com/linux/linux-comm-stat.html)     | [tree](http://www.runoob.com/linux/linux-comm-tree.html)     | [umount](http://www.runoob.com/linux/linux-comm-umount.html) | [ls](http://www.runoob.com/linux/linux-comm-ls.html) <br/>查看文件或文件夹大小，不包含内部文件        |
| [quotacheck](http://www.runoob.com/linux/linux-comm-quotacheck.html) | [quotaoff](http://www.runoob.com/linux/linux-comm-quotaoff.html) | [lndir](http://www.runoob.com/linux/linux-comm-lndir.html)   | [repquota](http://www.runoob.com/linux/linux-comm-repquota.html) |
| [quotaon](http://www.runoob.com/linux/linux-comm-quotaon.html) |                                                              |                                                              |                                                              |

### 磁盘维护

| **磁盘维护**                                                 |                                                              |                                                              |                                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [badblocks](http://www.runoob.com/linux/linux-comm-badblocks.html) | [cfdisk](http://www.runoob.com/linux/linux-comm-cfdisk.html) | [dd](http://www.runoob.com/linux/linux-comm-dd.html)         | [e2fsck](http://www.runoob.com/linux/linux-comm-e2fsck.html) |
| [ext2ed](http://www.runoob.com/linux/linux-comm-ext2ed.html) | [fsck](http://www.runoob.com/linux/linux-comm-fsck.html)     | [fsck.minix](http://www.runoob.com/linux/linux-comm-fsck-minix.html) | [fsconf](http://www.runoob.com/linux/linux-comm-fsconf.html) |
| [fdformat](http://www.runoob.com/linux/linux-comm-fdformat.html) | [hdparm](http://www.runoob.com/linux/linux-comm-hdparm.html) | [mformat](http://www.runoob.com/linux/linux-comm-mformat.html) | [mkbootdisk](http://www.runoob.com/linux/linux-comm-mkbootdisk.html) |
| [mkdosfs](http://www.runoob.com/linux/linux-comm-mkdosfs.html) | [mke2fs](http://www.runoob.com/linux/linux-comm-mke2fs.html) | [mkfs.ext2](http://www.runoob.com/linux/linux-comm-mkfs-ext2.html) | [mkfs.msdos](http://www.runoob.com/linux/linux-comm-mkfs-msdos.html) |
| [mkinitrd](http://www.runoob.com/linux/linux-comm-mkinitrd.html) | [mkisofs](http://www.runoob.com/linux/linux-comm-mkisofs.html) | [mkswap](http://www.runoob.com/linux/linux-comm-mkswap.html) | [mpartition](http://www.runoob.com/linux/linux-comm-mpartition.html) |
| [swapon](http://www.runoob.com/linux/linux-comm-swapon.html) | [symlinks](http://www.runoob.com/linux/linux-comm-symlinks.html) | [sync](http://www.runoob.com/linux/linux-comm-sync.html)     | [mbadblocks](http://www.runoob.com/linux/linux-comm-mbadblocks.html) |
| [mkfs.minix](http://www.runoob.com/linux/linux-comm-mkfs-minix.html) | [fsck.ext2](http://www.runoob.com/linux/linux-comm-fsck-ext2.html) | [fdisk](http://www.runoob.com/linux/linux-comm-fdisk.html) <br/> 查看磁盘分区 | [losetup](http://www.runoob.com/linux/linux-comm-losetup.html) |
| [mkfs](http://www.runoob.com/linux/linux-comm-mkfs.html)     | [sfdisk](http://www.runoob.com/linux/linux-comm-sfdisk.html) | [swapoff](http://www.runoob.com/linux/linux-comm-swapoff.html) |                                                              |

### 网络通讯

| **网络通讯**                                                 |                                                              |                                                              |                                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [apachectl](http://www.runoob.com/linux/linux-comm-apachectl.html) | [arpwatch](http://www.runoob.com/linux/linux-comm-arpwatch.html) | [dip](http://www.runoob.com/linux/linux-comm-dip.html)       | [getty](http://www.runoob.com/linux/linux-comm-getty.html)   |
| [mingetty](http://www.runoob.com/linux/linux-comm-mingetty.html) | [uux](http://www.runoob.com/linux/linux-comm-uux.html)       | [telnet](http://www.runoob.com/linux/linux-comm-telnet.html) | [uulog](http://www.runoob.com/linux/linux-comm-uulog.html)   |
| [uustat](http://www.runoob.com/linux/linux-comm-uustat.html) | [ppp-off](http://www.runoob.com/linux/linux-comm-ppp-off.html) | [netconfig](http://www.runoob.com/linux/linux-comm-netconfig.html) | [nc](http://www.runoob.com/linux/linux-comm-nc.html)         |
| [httpd](http://www.runoob.com/linux/linux-comm-httpd.html)   | [ifconfig](http://www.runoob.com/linux/linux-comm-ifconfig.html)<br/>查看或配置网卡信息(能够ping通才能远程通信，ping不通可能是因为防火墙)| [minicom](http://www.runoob.com/linux/linux-comm-minicom.html) | [mesg](http://www.runoob.com/linux/linux-comm-mesg.html)     |
| [dnsconf](http://www.runoob.com/linux/linux-comm-dnsconf.html) | [wall](http://www.runoob.com/linux/linux-comm-wall.html)     | [netstat](http://www.runoob.com/linux/linux-comm-netstat.html) | [ping](http://www.runoob.com/linux/linux-comm-ping.html)     |
| [pppstats](http://www.runoob.com/linux/linux-comm-pppstats.html) | [samba](http://www.runoob.com/linux/linux-comm-samba.html)   | [setserial](http://www.runoob.com/linux/linux-comm-setserial.html) | [talk](http://www.runoob.com/linux/linux-comm-talk.html)     |
| [traceroute](http://www.runoob.com/linux/linux-comm-traceroute.html) | [tty](http://www.runoob.com/linux/linux-comm-tty.html)       | [newaliases](http://www.runoob.com/linux/linux-comm-newaliases.html) | [uuname](http://www.runoob.com/linux/linux-comm-uuname.html) |
| [netconf](http://www.runoob.com/linux/linux-comm-netconf.html) | [write](http://www.runoob.com/linux/linux-comm-write.html)   | [statserial](http://www.runoob.com/linux/linux-comm-statserial.html) | [efax](http://www.runoob.com/linux/linux-comm-efax.html)     |
| [pppsetup](http://www.runoob.com/linux/linux-comm-pppsetup.html) | [tcpdump](http://www.runoob.com/linux/linux-comm-tcpdump.html) | [ytalk](http://www.runoob.com/linux/linux-comm-ytalk.html)   | [cu](http://www.runoob.com/linux/linux-comm-cu.html)         |
| [smbd](http://www.runoob.com/linux/linux-comm-smbd.html)     | [testparm](http://www.runoob.com/linux/linux-comm-testparm.html) | [smbclient](http://www.runoob.com/linux/linux-comm-smbclient.html) | [shapecfg](http://www.runoob.com/linux/linux-comm-shapecfg.html) |

### 系统管理

| **系统管理**                                                 |                                                              |                                                              |                                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [adduser](http://www.runoob.com/linux/linux-comm-adduser.html) | [chfn](http://www.runoob.com/linux/linux-comm-chfn.html)     | [useradd](http://www.runoob.com/linux/linux-comm-useradd.html)<br/> 添加用户账号(-d创建主目录，-g添加组名称，-m自动创建组目录)| [date](http://www.runoob.com/linux/linux-comm-date.html)  <br/>查看日期   |
| [exit](http://www.runoob.com/linux/linux-comm-exit.html) <br/>退出登录用户    | [finger](http://www.runoob.com/linux/linux-comm-finger.html) | [fwhios](http://www.runoob.com/linux/linux-comm-fwhios.html) | [sleep](http://www.runoob.com/linux/linux-comm-sleep.html)   |
| [suspend](http://www.runoob.com/linux/linux-comm-suspend.html) | [groupdel](http://www.runoob.com/linux/linux-comm-groupdel.html)<br/>删除用户组 | [groupmod](http://www.runoob.com/linux/linux-comm-groupmod.html) | [halt](http://www.runoob.com/linux/linux-comm-halt.html)     |
| [kill](http://www.runoob.com/linux/linux-comm-kill.html)  <br/>终止进程(-9强力终止)   | [last](http://www.runoob.com/linux/linux-comm-last.html)  <br/>查看用户登录信息   | [lastb](http://www.runoob.com/linux/linux-comm-lastb.html)   | [login](http://www.runoob.com/linux/linux-comm-login.html)   |
| [logname](http://www.runoob.com/linux/linux-comm-logname.html) | [logout](http://www.runoob.com/linux/linux-comm-logout.html) | [ps](http://www.runoob.com/linux/linux-comm-ps.html)   <br/>查看进程信息(-a显示所有进程，-u显示进程的详细信息，-x显示没有终端控制的程序)      | [nice](http://www.runoob.com/linux/linux-comm-nice.html)     |
| [procinfo](http://www.runoob.com/linux/linux-comm-procinfo.html) | [top](http://www.runoob.com/linux/linux-comm-top.html) <br/> 动态显示进程     | [pstree](http://www.runoob.com/linux/linux-comm-pstree.html) | [reboot](http://www.runoob.com/linux/linux-comm-reboot.html)<br/>重启 |
| [rlogin](http://www.runoob.com/linux/linux-comm-rlogin.html) | [rsh](http://www.runoob.com/linux/linux-comm-rsh.html)       | [sliplogin](http://www.runoob.com/linux/linux-comm-sliplogin.html) | [screen](http://www.runoob.com/linux/linux-comm-screen.html) |
| [shutdown](http://www.runoob.com/linux/linux-comm-shutdown.html) | [rwho](http://www.runoob.com/linux/linux-comm-rwho.html)     | [sudo](http://www.runoob.com/linux/linux-comm-sudo.html)     | [gitps](http://www.runoob.com/linux/linux-comm-gitps.html)   |
| [swatch](http://www.runoob.com/linux/linux-comm-swatch.html) | [tload](http://www.runoob.com/linux/linux-comm-tload.html)   | [logrotate](http://www.runoob.com/linux/linux-comm-logrotate.html) | [uname](http://www.runoob.com/linux/linux-comm-uname.html)   |
| [chsh](http://www.runoob.com/linux/linux-comm-chsh.html)     | [userconf](http://www.runoob.com/linux/linux-comm-userconf.html) | [userdel](http://www.runoob.com/linux/linux-comm-userdel.html) <br/>删除用户账号(sudo userdel XXX -r 同时删除组目录和用户主目录)| [usermod](http://www.runoob.com/linux/linux-comm-usermod.html)<br/>更改用户所属组(用户信息存放在/etc/passwd文件中) |
| [vlock](http://www.runoob.com/linux/linux-comm-vlock.html)   | [who](http://www.runoob.com/linux/linux-comm-who.html)  <br/> 查看谁登录过这个主机    | [whoami](http://www.runoob.com/linux/linux-comm-whoami.html)<br/> 查看当前用户| [whois](http://www.runoob.com/linux/linux-comm-whois.html)   |
| [newgrp](http://www.runoob.com/linux/linux-comm-newgrp.html) | [renice](http://www.runoob.com/linux/linux-comm-renice.html) | [su](http://www.runoob.com/linux/linux-comm-su.html) <br/>切换用户        | [skill](http://www.runoob.com/linux/linux-comm-skill.html)   |
| [w](http://www.runoob.com/linux/linux-comm-w.html)  <br/>查看登录用户,最详细         | [id](http://www.runoob.com/linux/linux-comm-id.html)         | [free](http://www.runoob.com/linux/linux-comm-free.html) <br/> 查看磁盘使用和文件挂载   | groupadd <br/>添加组用户(用户组信息存放在/etc/group中。toooney:x:1000”以此对应用户组名：用户权限：用户组号“)  |
| & <br/>后台运行程序 | jobs <br/> 查看后台进程  | fg <br/>将后台进程显示到前端 |

### 系统设置

| **系统设置**                                                 |                                                              |                                                              |                                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [reset](http://www.runoob.com/linux/linux-comm-reset.html)   | [clear](http://www.runoob.com/linux/linux-comm-clear.html) <br/>清屏，也可以用快捷键 Ctrl+l  | [alias](http://www.runoob.com/linux/linux-comm-alias.html)   | [dircolors](http://www.runoob.com/linux/linux-comm-dircolors.html) |
| [aumix](http://www.runoob.com/linux/linux-comm-aumix.html)   | [bind](http://www.runoob.com/linux/linux-comm-bind.html)     | [chroot](http://www.runoob.com/linux/linux-comm-chroot.html) | [clock](http://www.runoob.com/linux/linux-comm-clock.html)   |
| [crontab](http://www.runoob.com/linux/linux-comm-crontab.html) | [declare](http://www.runoob.com/linux/linux-comm-declare.html) | [depmod](http://www.runoob.com/linux/linux-comm-depmod.html) | [dmesg](http://www.runoob.com/linux/linux-comm-dmesg.html)   |
| [enable](http://www.runoob.com/linux/linux-comm-enable.html) | [eval](http://www.runoob.com/linux/linux-comm-eval.html)     | [export](http://www.runoob.com/linux/linux-comm-export.html) | [pwunconv](http://www.runoob.com/linux/linux-comm-pwunconv.html) |
| [grpconv](http://www.runoob.com/linux/linux-comm-grpconv.html) | [rpm](http://www.runoob.com/linux/linux-comm-rpm.html)       | [insmod](http://www.runoob.com/linux/linux-comm-insmod.html) | [kbdconfig](http://www.runoob.com/linux/linux-comm-kbdconfig.html) |
| [lilo](http://www.runoob.com/linux/linux-comm-lilo.html)     | [liloconfig](http://www.runoob.com/linux/linux-comm-liloconfig.html) | [lsmod](http://www.runoob.com/linux/linux-comm-lsmod.html)   | [minfo](http://www.runoob.com/linux/linux-comm-minfo.html)   |
| [set](http://www.runoob.com/linux/linux-comm-set.html)       | [modprobe](http://www.runoob.com/linux/linux-comm-modprobe.html) | [ntsysv](http://www.runoob.com/linux/linux-comm-ntsysv.html) | [mouseconfig](http://www.runoob.com/linux/linux-comm-mouseconfig.html) |
| [passwd](http://www.runoob.com/linux/linux-comm-passwd.html)<br/>设置密码 | [pwconv](http://www.runoob.com/linux/linux-comm-pwconv.html) | [rdate](http://www.runoob.com/linux/linux-comm-rdate.html)   | [resize](http://www.runoob.com/linux/linux-comm-resize.html) |
| [rmmod](http://www.runoob.com/linux/linux-comm-rmmod.html)   | [grpunconv](http://www.runoob.com/linux/linux-comm-grpunconv.html) | [modinfo](http://www.runoob.com/linux/linux-comm-modinfo.html) | [time](http://www.runoob.com/linux/linux-comm-time.html)     |
| [setup](http://www.runoob.com/linux/linux-comm-setup.html)   | [sndconfig](http://www.runoob.com/linux/linux-comm-sndconfig.html) | [setenv](http://www.runoob.com/linux/linux-comm-setenv.html) | [setconsole](http://www.runoob.com/linux/linux-comm-setconsole.html) |
| [timeconfig](http://www.runoob.com/linux/linux-comm-timeconfig.html) | [ulimit](http://www.runoob.com/linux/linux-comm-ulimit.html) | [unset](http://www.runoob.com/linux/linux-comm-unset.html)   | [chkconfig](http://www.runoob.com/linux/linux-comm-chkconfig.html) |
| [apmd](http://www.runoob.com/linux/linux-comm-apmd.html)     | [hwclock](http://www.runoob.com/linux/linux-comm-hwclock.html) | [mkkickstart](http://www.runoob.com/linux/linux-comm-mkkickstart.html) | [fbset](http://www.runoob.com/linux/linux-comm-fbset.html)   |
| [unalias](http://www.runoob.com/linux/linux-comm-unalias.html) | [SVGATextMode](http://www.runoob.com/linux/linux-comm-svgatextmode.html) |                                                              |                                                              |

### 备份压缩

| **备份压缩**                                                 |                                                              |                                                              |                                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [ar](http://www.runoob.com/linux/linux-comm-ar.html)         | [bunzip2](http://www.runoob.com/linux/linux-comm-bunzip2.html) | [bzip2](http://www.runoob.com/linux/linux-comm-bzip2.html)<br/> 压缩或者解压，bz2压缩包 | [bzip2recover](http://www.runoob.com/linux/linux-comm-bzip2recover.html) |
| [gunzip](http://www.runoob.com/linux/linux-comm-gunzip.html) | [unarj](http://www.runoob.com/linux/linux-comm-unarj.html)   | [compress](http://www.runoob.com/linux/linux-comm-compress.html) | [cpio](http://www.runoob.com/linux/linux-comm-cpio.html)     |
| [dump](http://www.runoob.com/linux/linux-comm-dump.html)     | [uuencode](http://www.runoob.com/linux/linux-comm-uuencode.html) | [gzexe](http://www.runoob.com/linux/linux-comm-gzexe.html)   | [gzip](http://www.runoob.com/linux/linux-comm-gzip.html) <br/>压缩或者解压，[-r]压缩，-d表示解压    |
| [lha](http://www.runoob.com/linux/linux-comm-lha.html)       | [restore](http://www.runoob.com/linux/linux-comm-restore.html) | [tar](http://www.runoob.com/linux/linux-comm-tar.html) <br/>  打包或者解包，并未进行压缩，-c创建包，-x解包，-C后面指定解包路径，-v显示进度，-f这个参数放在最后，后面跟文件名 <br/>二合一用法： -czvf打包压缩，-xzvf解压解包，xxx.gz压缩包   | [uudecode](http://www.runoob.com/linux/linux-comm-uudecode.html) |
| [unzip](http://www.runoob.com/linux/linux-comm-unzip.html) <br/>解压文件  | [zip](http://www.runoob.com/linux/linux-comm-zip.html)  <br/>压缩zip文件，此类型并不是Linux常用的压缩格式     | [zipinfo](http://www.runoob.com/linux/linux-comm-zipinfo.html) |                                                              |

### 设备管理

| **设备管理**                                                 |                                                              |                                                          |                                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ | -------------------------------------------------------- | ------------------------------------------------------------ |
| [setleds](http://www.runoob.com/linux/linux-comm-setleds.html) | [loadkeys](http://www.runoob.com/linux/linux-comm-loadkeys.html) | [rdev](http://www.runoob.com/linux/linux-comm-rdev.html) | [dumpkeys](http://www.runoob.com/linux/linux-comm-dumpkeys.html) |
| [MAKEDEV](http://www.runoob.com/linux/linux-comm-makedev.html) |                                                              |                                                          |                                                              |

### 常用选项

|选项|功能|
|----------------------|----------------------------|
|-a |查看隐藏文件|
|-l |列表方式查看|
|-h |人性化显示|
|* |通配符，忽略多个字符匹配|
|？ |通配符，忽略一个字符匹配|
|[Num1-Num2] |通配符，查看从Num1到Num2的匹配|
|> |输出重定向，把原来输出到其他位置，覆盖原来内容|
|>> |输出重定向，原来内容不覆盖，追加到后面|
|Tab |自动不全|
|^a| 以a开头的行|
|z$ |以z结尾的行|
|-v |显示进度|
|q |退出|

### 使用说明 
> 查看自带文档

Command --help

man Command

查看帮助文档使用说明 man man

查看其他选项 man Num Command

------

### 其他命令

- [Linux bc 命令](http://www.runoob.com/linux/linux-comm-bc.html)
- [Linux tail 命令](http://www.runoob.com/linux/linux-comm-tail.html)
- [Linux xargs 命令](http://www.runoob.com/linux/linux-comm-xargs.html)
- Ctrl+Alt+F2/F3/F4 切换到字符界面
- Ctrl+Alt+F7 切换到图像界面

##  软件管理

### 软件安装

#### dpkg

首先在网站上下载.deb格式的文件，在本地所在目录打开terminal，输入下面的命令即可安装demo软件
```
dpkg -i demo.deb
```

#### apt

> 应用软件的安装、卸载和更新(在线)

- [使用阿里apt镜像](https://blog.csdn.net/u011944141/article/details/54846148)

#### npm

- [更换国内npm镜像](http://www.nodeclass.com/articles/811495)

#### rpm

> 应用软件离线安装

#### snap

> 还未详细了解，下载和安装速度较快，推荐使用

#### 源码安装（.tar、tar.gz、tar.bz2、tar.Z）

```
./configure

make

sudo make install
```

### 软件卸载

#### dpkg

1. 如果是用dpkg安装的，可以查看含有demo关键字的软件
```
dpkg -l | grep demo*
```
2. 用下面的命令将demo软件其卸载（注意，上面的命令得到的结果第二列是软件名，下面的命令同时会卸载配置文件）
```
sudo apt-get autoremove --purge demo
```
详情可见[此博客](http://www.cnblogs.com/balaamwe/archive/2011/10/27/2225919.html)

#### 应用商店卸载

×有可能会卸载不干净×

如何清理这些残留文件：

```
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P
```

## 工具/文献汇总

| 教程                                                         | 基础工具                                                     | 源代码                                         | 常用工具                                                     |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ---------------------------------------------- | ------------------------------------------------------------ |
| [Linux Kernel](https://0xax.gitbooks.io/linux-insides/content/index.html) | [Linux](http://linuxtools-rst.readthedocs.io/zh_CN/latest/base/index.html) | [Linux](https://github.com/torvalds/linux)     | [Linux Tools Quick Tutorial](http://linuxtools-rst.readthedocs.io/zh_CN/latest/base/index.html) , 非小白 |
| [OpenCV](https://github.com/spmallick/learnopencv)           | [Shell](https://github.com/qinjx/30min_guides/blob/master/shell.md) | [树莓派](https://github.com/raspberrypi/linux) | [LinuxKit](https://github.com/linuxkit/linuxkit) , 工具包    |
| [内核揭秘](https://xinqiu.gitbooks.io/linux-insides-cn/content/index.html) |                                                              |                                                | [Linux Software](https://alim0x.gitbooks.io/awesome-linux-software-zh_cn/content/) , 应用软件 |
| [破解教程](https://github.com/tiancode/learn-hacking)        |                                                              |                                                | [Linux Dashboard](https://afaqurk.github.io/linux-dash/) , 网页控制面板 |
|                                                              |                                                              |                                                | [Linux Command](http://wangchujiang.com/linux-command/) , 命令查询 |

## 虚拟机和物理机传输文件

> Windows使用Xshell，Linux使用命令scp

Windows远程登录Linux：
1. ping IP地址（互相都能通）
2. 打开Xshell连接成功

Linux主机直接传输文件：

scp -r RemoteUserName@RemoteIpAddress:RemoteFolderName LocalFolderName

## 搭建WebServer服务器http.tar.gz

1. 解压，把服务器放在合适目录
2. make，生成一个myhttp可执行程序
3. sudo ./myhttp start启动服务
4. sudo ./myhttp stop停止服务

##### 论坛：[树莓派](https://afaqurk.github.io/linux-dash/)



