(use-package js2-mode
  :ensure js2-mode
  :config
    (add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
    (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
    (add-hook 'js-mode-hook 'js2-minor-mode)
    (add-hook 'js-mode-hook 'linum-mode)
    (add-hook 'js2-mode-hook 'linum-mode)
    (setq js2-highlight-level 3)
    (setq js-indent-level 2)
    (custom-set-variables
     '(js2-basic-offset 2)))
