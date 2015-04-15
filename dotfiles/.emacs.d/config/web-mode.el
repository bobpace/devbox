(require 'use-package)
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
  ;; adjust indents for web-mode to 2 spaces
  (defun my-web-mode-hook ()
    "Hooks for Web mode. Adjust indents"
    ;;; http://web-mode.org/
    (eval-after-load "expand-region"
      (progn
        ('er/add-js-mode-expansions)
        ('er/add-js2-mode-expansions)))
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2))
  (add-hook 'web-mode-hook 'my-web-mode-hook))
