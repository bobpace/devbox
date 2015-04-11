(use-package evil
  :ensure t
  :config (evil-mode 1)
  ;(define-key evil-normal-state-map (kbd ",f") 'projectile-find-file)
  (define-key evil-normal-state-map (kbd ",,") 'evil-buffer)
  (define-key evil-normal-state-map (kbd "q") nil)

  (define-key evil-insert-state-map (kbd "C-e") nil)
  (define-key evil-insert-state-map (kbd "C-d") nil)
  (define-key evil-insert-state-map (kbd "C-k") nil)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-visual-state-map (kbd "C-c") 'evil-normal-state)
  
  (define-key evil-motion-state-map (kbd "C-e") nil)
  (define-key evil-visual-state-map (kbd "C-c") 'evil-exit-visual-state)
  (setq evil-move-cursor-back nil))

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader ",")
  ;(evil-leader/set-key "," `evil-buffer)
  )

(use-package evil-jumper
  :ensure t
  :config 
    (setq evil-jumper-auto-center t)
    (setq evil-jumper-file (concat temporary-file-directory "evil-jumps"))
    (setq evil-jumper-auto-save-interval 3600)
    (global-evil-jumper-mode t))

(use-package evil-search-highlight-persist
  :ensure t
  :config
  (evil-leader/set-key "SPC" 'evil-search-highlight-persist-remove-all))

(add-hook 'js-mode-hook
  (function (lambda ()
          (setq evil-shift-width js-indent-level))))
