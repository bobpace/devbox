(require 'use-package)
(use-package markdown-mode
  :ensure t
  :config
    (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode)))
