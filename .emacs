(setq custom-configs "~/.emacs.custom.el")
(package-initialize)

;; Basic config
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode)

;; C++ Config
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     '("melpa-stable" . "https://stable.melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package lsp-mode
  :ensure t
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config (setq lsp-completion-enable-additional-text-edit nil))
(use-package lsp-ui
  :commands lsp-ui-mode
  :ensure t)
(use-package ccls
  :ensure t
  :config
  (setq ccls-executable "ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))
(use-package flycheck
  :ensure t)
(use-package yasnippet
  :ensure t
  :config (yas-global-mode))
(use-package which-key
  :ensure t
  :config (which-key-mode))
(use-package helm-lsp
  :ensure t)
(use-package helm
  :ensure t
  :config (helm-mode))
(use-package lsp-treemacs
  :ensure t)
(use-package nano-theme
  :ensure t)
(load-theme 'nano-dark t)
(use-package move-text
  :ensure t)

;; Code stolen from here: https://github.com/rexim/dotfiles/blob/e3f123e1eda53ae6d21402ce4ae5c9533124d009/.emacs.rc/misc-rc.el#L113-L125
(defun duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

;;; This will enable emacs to compile a simple cpp single file without any makefile by just pressing [f9] key
;; (defun code-compile()
;;   (interactive)
;;   (unless (file-exists-p "Makefile")
;;     (set (make-local-variable 'compile-command)
;; 	 (let ((file (file-name-nondirectory buffer-file-name)))
;; 	   (format "%s -o %s %s"
;; 		   (if (equal (file-name-extension file) "cpp") "g++" "gcc")
;; 		   (file-name-sans-extension file)
;; 		   file)))
;;     (compile compile-command)))
;; (global-set-key [f9] 'code-compile)

;; Keyboard Shortcuts
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-d") 'duplicate-line)
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-º") 'comment-line)
(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)
;(global-set-key (kbd "C-<tab>") 'other-window)

(load-file custom-configs)
