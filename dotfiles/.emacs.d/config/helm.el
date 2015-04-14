(require 'use-package)
(use-package helm
  :ensure t
  :config
  (require 'helm-config)
  (helm-mode 1)
  (helm-autoresize-mode 1)
  (setq helm-recentf-fuzzy-match t
        helm-buffers-fuzzy-matching t)
  (defvar helm-M-x-fuzzy-match
    (setq helm-M-x-fuzzy-match t))
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-m") 'helm-M-x)
  (global-set-key (kbd "C-x m") 'helm-M-x)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x f") 'helm-find-files)
  (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
  (global-set-key (kbd "C-c h o") 'helm-occur)
  (global-set-key (kbd "C-\\") 'helm-resume)
  (global-set-key (kbd "C-x C-d") 'helm-browse-project))

(use-package helm-ag
  :ensure t
  :config
  (setq helm-ag-fuzzy-match t))

(use-package helm-projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'helm
        helm-projectile-fuzzy-match t)
  (helm-projectile-on))

(use-package helm-flycheck
  :ensure t
  :config
  (define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))

(use-package helm-ls-git
  :ensure t
  :config
  (setq helm-ls-git-fuzzy-match t))
