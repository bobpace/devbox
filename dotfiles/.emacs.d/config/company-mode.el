(require 'use-package)
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "M-n") nil)
     (define-key company-active-map (kbd "M-p") nil)
     (define-key company-active-map (kbd "C-n") #'company-select-next)
     (define-key company-active-map (kbd "C-p") #'company-select-previous)))
