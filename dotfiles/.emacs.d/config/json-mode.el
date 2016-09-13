(require 'use-package)
(use-package json-mode
  :ensure t
  :config
  (setq json-reformat:indent-width 2)
  (setq js-indent-level 2))
