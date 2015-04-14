(require 'use-package)
(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint json-jsonlist emacs-lisp-checkdoc)))
  (flycheck-add-mode 'javascript-eslint 'web-mode))
