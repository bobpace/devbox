(require 'use-package)
(use-package less-css-mode
  :ensure t
  :config
    (setq css-indent-offset 2)
    (add-to-list 'auto-mode-alist '("\\.less$" . less-css-mode)))
