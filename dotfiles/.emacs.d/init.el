(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

;(toggle-debug-on-error)

;auto revert buffer when file changes on disk
(global-auto-revert-mode t)
;always add new line to the end of a file
(setq require-final-newline t)
;remove trailing whitespaces before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;enable to support navigate in camelCase words
(global-subword-mode t)

;shell settings
(setq shell-file-name "/bin/zsh")
(setq explicit-shell-file-name "/bin/zsh")
;; always insert at the bottom
(setq comint-scroll-to-bottom-on-input t)
;; no duplicates in command history
(setq comint-input-ignoredups t)
;; what to run when i press enter on a line above the current prompt
(setq comint-get-old-input (lambda () """"))
;; max shell history size
(setq comint-input-ring-size 1000)
;; show all in emacs interactive output
(setenv "PAGER" "cat")
;; set lang to enable Chinese display in shell-mode
(setenv "LANG" "en_US.UTF-8")

;unbind C-q since its tmux prefix for nested sessions
(global-unset-key "\C-q")

;fix incremental search making screen look funny in terminal
(add-hook 'isearch-update-post-hook 'redraw-display)

;auto-indent with return key
(define-key global-map (kbd "RET") 'newline-and-indent)

;calendar
(add-hook 'calendar-today-visible-hook 'calendar-mark-today)
(setq calendar-latitude 40.8)
(setq calendar-longitude -111.9)
(setq calendar-location-name "SLC, UT")
(setq calendar-time-zone -420)
(setq calendar-standard-time-zone-name "MST")
(setq calendar-daylight-time-zone-name "MDT")

;misc preferences
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default indent-tabs-mode nil)
(setq whitespace-style (quote (spaces tabs space-mark tab-mark)))
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq default-major-mode 'text-mode)

;linum-mode
(setq linum-format "%4d \u2502 ")
(mapc
(lambda (mode-hook)
    (add-hook mode-hook 'linum-mode))
'(text-mode-hook
    prog-mode-hook
    comint-mode-hook
    conf-mode-hook))

;no evil modes
(add-hook 'calendar-initial-window-hook 'turn-off-evil-mode)
(add-hook 'Info-mode-hook 'turn-off-evil-mode)
(add-hook 'help-mode 'turn-off-evil-mode)

;eww
(eval-after-load "eww"
  '(progn
     (setq eww-search-prefix "https://www.google.com/search?q=")
     (define-key eww-mode-map (kbd "o") 'eww)
     (define-key eww-mode-map (kbd "L") 'eww-forward-url)
     (define-key eww-mode-map (read-kbd-macro "/") 'evil-search-forward)
     (define-key eww-mode-map (read-kbd-macro "?") 'evil-search-backward)
     (define-key eww-mode-map (read-kbd-macro "n") 'evil-search-next)
     (define-key eww-mode-map (read-kbd-macro "N") 'evil-search-previous)
     (define-key eww-mode-map (read-kbd-macro "r") 'eww-reload)
     (define-key eww-mode-map (kbd "<backtab>") 'shr-previous-link)
     (define-key eww-mode-map (read-kbd-macro "j") 'evil-next-line)
     (define-key eww-mode-map (read-kbd-macro "k") 'evil-previous-line)
     (define-key eww-mode-map (read-kbd-macro "C-j") (lambda () (interactive) (next-line 2) (scroll-up 2)))
     (define-key eww-mode-map (read-kbd-macro "C-k") (lambda () (interactive) (scroll-down 2) (previous-line 2)))
     (define-key eww-mode-map (read-kbd-macro "d") 'evil-scroll-down)
     (define-key eww-mode-map (read-kbd-macro "u") 'evil-scroll-up)
     (define-key eww-mode-map (read-kbd-macro "C-d") 'evil-scroll-down)
     (define-key eww-mode-map (read-kbd-macro "C-u") 'evil-scroll-up)
     ))

;install packages from config directory
(require 'package)
(setq package-archives
      '(("gnu"       . "http://elpa.gnu.org/packages/")
        ("original"  . "http://tromey.com/elpa")
        ("org"       . "http://orgmode.org/elpa/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa"     . "http://melpa.milkbox.net/packages/")))

;https://github.com/emacs-helm/helm-ls-git/issues/29
;require this before package-initialize
(require 'eieio)
(package-initialize)

(unless package-archive-contents (package-refresh-contents))

(let ((pkg 'use-package))
  (unless (package-installed-p pkg)
    (package-install pkg)))

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
