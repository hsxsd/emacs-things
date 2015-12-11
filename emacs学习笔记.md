# Emacs学习笔记

## 2015-12-11

今天重新开始学习Emacs。

去https://ftp.gnu.org/gnu/emacs/windows/下载最新安装包emacs-24.5-bin-i686-mingw32.zip，解压后直接运行runemacs.exe即可（注意不要解压到中文路径下，否则会出错）。如果再运行addpm.exe，则会在开始菜单下显示emacs应用图标，不完美的是，把该图标固定到任务栏时，打开emacs后会产生两个emacs图标。

首先看内置的使用手册，是中文版的。试了上下左右、翻屏等移动光标的快捷键，找回了以前用emacs的感觉。浏览手册时，最烦的是翻屏操作，翻屏后经常找不到当前光标跑哪去了。理想的翻屏操作应该是，光标固定在某一行，文本内容向上滚动；或者光标跟随原位置向上滚动（可通过`c-u 1 c-v`实现）。

第一种方法没找到怎么解决，第二种方法可以把`c-u 1 c-v`绑定到新快捷键。网上找到的解决方案如下：

``` lisp
;;; scrollers - M-f, M-b
;;; 参考http://superuser.com/questions/527356/dont-change-the-cursor-position-when-scrolling-in-emacs
(global-set-key "\M-f" "\C-u1\C-v")
(global-set-key "\M-b" "\C-u1\M-v")
```

好了，现在要把上面的设置代码保存到.emacs里。使用`c-x c-f ~/.emacs`编辑.emacs文件（参考https://www.gnu.org/software/emacs/manual/html_node/efaq-w32/Location-of-init-file.html），加入以上语句。

现在需要重启emacs，才能使上面的配置生效。好麻烦，可不可以不重启直接使配置文件生效呢？使用`m-x load-file`命令，加载.emacs即可（参考http://stackoverflow.com/questions/2580650/how-can-i-reload-emacs-after-changing-it）。

熟悉了基本光标移动操作，现在可以用emacs干活啦。这篇学习笔记就是使用emacs写的。

把这篇笔记同步到github的过程中，发现笔记内容是乱码（在Windows平台下使用emacs）。肯定是由于emacs默认编码不是utf-8。怎么查看emacs默认编码呢？使用`M-x describe-coding-system`可以看到默认编码果然不是utf-8，而是gbk，通过以下代码可以设置为utf-8（参考http://lunae.cc/windows-emacs-encoding）：

``` lisp
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
```

好了，今天的emacs学习到此结束。

