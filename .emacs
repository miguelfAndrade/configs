3(setq custom-configs "~/.emacs.custom.el")
(package-initialize)

;; Completly copied from here https://github.com/rexim/dotfiles/blob/master/.emacs
(load "~/.rc.el")

;; Basic config
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode)

;; Keyboard Basic Shortcuts
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-d") 'duplicate-line)
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-º") 'comment-line)
;; (global-set-key (kbd "C-<tab>") 'other-window)

(rc/require 'monokai-theme)
(load-theme 'monokai)

;; Move-text shortcuts
(rc/require 'move-text)
(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

;; C++ Config
(rc/require 'lsp-mode)
(add-hook 'lsp-mode 'lsp-enable-which-key-integration)
(setq lsp-completion-enable-additional-text-edit nil)

(rc/require 'lsp-ui)
(lsp-ui-mode)

(rc/require 'ccls)
(setq ccls-executable "ccls")
(setq lsp-prefer-flymake nil)
(setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
(add-hook 'c-mode (lambda () (require 'ccls) (lsp)))
(add-hook 'c++-mode (lambda () (require 'ccls) (lsp)))
(add-hook 'objc-mode (lambda () (require 'ccls) (lsp)))

(rc/require 'flycheck)
(rc/require 'yasnippet)
(yas-global-mode)
(rc/require 'which-key)
(which-key-mode)
(rc/require 'helm-lsp)
(rc/require 'helm)
(helm-mode)
(rc/require 'lsp-treemacs)

;; Magit (git library)
(rc/require 'cl-lib)
(rc/require 'magit)

(setq magit-auto-revert-mode nil)

(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)

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


(load-file custom-configs)
