(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

(require 'package)
(setq package-archives
      '(("gnu"       . "http://elpa.gnu.org/packages/")
        ("original"  . "http://tromey.com/elpa")
        ("org"       . "http://orgmode.org/elpa/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa"     . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(unless package-archive-contents (package-refresh-contents))

(setq make-backup-files nil)

(let ((pkg 'use-package))
  (unless (package-installed-p pkg)
    (package-install pkg)))

(require 'use-package)

(defun load-directory (dir)
  "`load' all elisp libraries in directory DIR which are not already loaded."
  (interactive "D")
  (let ((libraries-loaded (mapcar #'file-name-sans-extension
                                  (delq nil (mapcar #'car load-history)))))
    (dolist (file (directory-files dir t ".+\\.elc?$"))
      (let ((library (file-name-sans-extension file)))
        (unless (member library libraries-loaded)
          (load library nil t)
          (push library libraries-loaded))))))

(load-directory "~/.emacs.d/config/")

;all y-n prompts
(fset 'yes-or-no-p 'y-or-n-p)

;no tabs for indentation
(setq-default indent-tabs-mode nil)

;better whitespace
(setq whitespace-style (quote (spaces tabs space-mark tab-mark)))

;fix incremental search making screen look funny in terminal
(add-hook 'isearch-update-post-hook 'redraw-display)

;line numbers for lisp
(add-hook 'emacs-lisp-mode-hook 'linum-mode)

;no evil for info mode
(add-hook 'Info-mode-hook 'turn-off-evil-mode)

;auto-indent with return key
(define-key global-map (kbd "RET") 'newline-and-indent)

;alternative to M-x
(global-set-key "\C-x\C-m" 'execute-extended-command)

;unbind C-q since its tmux prefix for nested sessions
(global-unset-key "\C-q")
