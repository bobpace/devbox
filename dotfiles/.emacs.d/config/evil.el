(require 'use-package)
(use-package evil
  :ensure t
  :init
  (setq evil-want-C-i-jump nil
        evil-want-C-u-scroll nil
        evil-want-visual-char-semi-exclusive t)
  :config
  (mapc
   (lambda (mode-hook)
     (add-hook mode-hook 'turn-on-evil-mode)
     (evil-esc-mode 1))
   '(text-mode-hook
     prog-mode-hook
     fsharp-mode-hook
     comint-mode-hook
     conf-mode-hook
     css-mode-hook))
  (mapc
   (lambda (mode-hook)
     (add-hook mode-hook 'turn-off-evil-mode))
   '(Info-mode-hook))
  (setq
   ;; h/l wrap around to next lines
   evil-cross-lines t
   ;; don't move the cursor around like Vim
   evil-move-cursor-back t)

  (define-key evil-normal-state-map "gf" 'helm-find-files)
  (define-key evil-normal-state-map (kbd "C-p") 'helm-mini)
  (define-key evil-normal-state-map (kbd "M-J") 'flycheck-next-error)
  (define-key evil-normal-state-map (kbd "M-K") 'flycheck-previous-error)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-normal-state-map (kbd "<SPC> <SPC>") 'evil-force-normal-state)
  (define-key evil-normal-state-map (kbd "q") nil)
  (define-key evil-insert-state-map (kbd "C-e") nil)
  (define-key evil-insert-state-map (kbd "C-d") nil)
  (define-key evil-insert-state-map (kbd "C-k") nil)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-visual-state-map (kbd "C-c") 'evil-normal-state)
  (define-key evil-motion-state-map (kbd "C-e") nil)
  (define-key evil-visual-state-map (kbd "C-c") 'evil-exit-visual-)
  )

(use-package evil-leader
  :ensure t
  :config
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
   "f" 'helm-for-files
   "y" 'helm-show-kill-ring
   "t" 'helm-top
   "o" 'helm-swoop
   "j" 'helm-M-x
   "e" 'helm-find-files
   "r" 'helm-recentf
   "b" 'helm-buffers-list
   "h" 'helm-projectile-find-file
   "H" 'helm-projectile)
  (eval-after-load "expand-region"
    (progn
      (setq expand-region-contract-fast-key "z")
      ;iterm2 key ^= : ^[[6n
      (global-set-key (kbd "M-[ 6 n") 'er/expand-region)
      (evil-leader/set-key "xx" 'er/expand-region)))
  (eval-after-load "magit"
    (evil-leader/set-key "g" 'magit-status))
  ;; (eval-after-load "quickrun"
  ;;   (evil-leader/set-key "q" 'quickrun))
  (evil-leader/set-key
   "c" 'evil-ace-jump-char-mode
   "w" 'evil-ace-jump-word-mode
   "l" 'evil-ace-jump-line-mode
   "k" 'kill-buffer
   "d" 'dired
   "z" 'repeat
   "0" 'delete-window
   "1" 'delete-other-windows
   "2" 'split-window-below
   "3" 'split-window-right)
  (global-evil-leader-mode))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-visualstar
  :ensure t
  :config
  (global-evil-visualstar-mode 1))

(use-package evil-matchit
  :ensure t
  :config
  (global-evil-matchit-mode))

(use-package evil-nerd-commenter
  :ensure t
  :config
  (evilnc-default-hotkeys))

(add-hook 'js-mode-hook
          (function (lambda ()
                      (setq evil-shift-width js-indent-level))))
