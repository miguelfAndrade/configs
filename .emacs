(setq theme "~/.emacs.custom.el")

(package-initialize)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(global-display-line-numbers-mode)

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-/") 'suspend-frame)

(load-file theme)
