;;; scrollers - M-f, M-b
;;; 参考http://superuser.com/questions/527356/dont-change-the-cursor-position-when-scrolling-in-emacs
(global-set-key "\M-f" "\C-u1\C-v")
(global-set-key "\M-b" "\C-u1\M-v")

;;; Windows下Emacs默认编码是gbk（可通过m-x describe-coding-system查看）
;;; 现将默认编码改为utf-8
;;; 参考http://lunae.cc/windows-emacs-encoding
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
