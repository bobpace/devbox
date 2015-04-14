(require 'use-package)
(use-package js2-mode
  :ensure js2-mode
  :config
    (add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
    (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
    (add-hook 'js-mode-hook 'js2-minor-mode)
    (setq js2-highlight-level 3)
    (defvar js-indent-level
      (setq js-indent-level 2))
    (custom-set-variables
     '(js2-basic-offset 2)))
