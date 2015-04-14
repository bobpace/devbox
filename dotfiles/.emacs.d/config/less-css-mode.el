(require 'use-package)
(use-package less-css-mode
  :ensure t
  :config
    (add-to-list 'auto-mode-alist '("\\.less$" . less-css-mode)))
