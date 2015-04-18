(require 'use-package)
(use-package js2-mode
  :ensure js2-mode
  :config
    (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
    (js2-mode-hide-warnings-and-errors)
    (setq js2-highlight-level 3)
    (defvar js-indent-level
      (setq js-indent-level 2))
    (custom-set-variables
     '(js2-basic-offset 2))
    (add-hook 'js2-mode-hook
              (lambda () (tern-mode 1))))
