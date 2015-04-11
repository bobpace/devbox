(use-package flycheck
  :ensure t
  :defer
  :config
    (add-hook 'after-init-hook #'global-flycheck-mode)
    (setq-default flycheck-disabled-checkers
                  (append flycheck-disabled-checkers
                          '(javascript-jshint json-jsonlist)))
    (flycheck-add-mode 'javascript-eslint 'web-mode))
