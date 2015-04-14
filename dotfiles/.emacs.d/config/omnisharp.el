(require 'use-package)

(defun my-csharp-mode ()
  (add-to-list 'company-backends 'company-omnisharp)
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)
  (turn-on-eldoc-mode))

(use-package omnisharp
  :ensure t
  :init
  (add-hook 'csharp-mode-hook 'my-csharp-mode)
  (custom-set-variables
   '(omnisharp-company-sort-results t)
   '(omnisharp-company-strip-trailing-brackets nil)
   '(omnisharp-server-executable-path
     "~/data/omnisharp-server/OmniSharp/bin/Debug/OmniSharp\.exe"
     ))
  :config
  (add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))
  (setq omnisharp-company-do-template-completion t)

  ;(evil-define-key 'normal omnisharp-mode-map (kbd "g d") (lambda() (interactive) (evil-jumper--set-jump) (omnisharp-go-to-definition)))
  ;(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> b") 'omnisharp-build-in-emacs)
  ;(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> cf") 'omnisharp-code-format)
  ;(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> nm") 'omnisharp-rename-interactively)
  ;(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> fu") 'omnisharp-helm-find-usages)
  ;(evil-define-key 'normal omnisharp-mode-map (kbd "<M-RET>") 'omnisharp-run-code-action-refactoring)
  ;(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> ss") 'omnisharp-start-omnisharp-server)
  ;(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> sp") 'omnisharp-stop-omnisharp-server)
  ;(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> fi") 'omnisharp-find-implementations)
  ;(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> x") 'omnisharp-fix-code-issue-at-point)
  ;(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> fx") 'omnisharp-fix-usings)
  ;(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> o") 'omnisharp-auto-complete-overrides)
  ;(define-key evil-normal-state-map (kbd "<SPC> rt") (lambda() (interactive) (omnisharp-unit-test "single")))
  ;(define-key evil-normal-state-map (kbd "<SPC> rf") (lambda() (interactive) (omnisharp-unit-test "fixture")))
  ;(define-key evil-normal-state-map (kbd "<SPC> ra") (lambda() (interactive) (omnisharp-unit-test "all")))
  ;(define-key evil-normal-state-map (kbd "<SPC> rl") 'recompile)

  (evil-define-key 'normal omnisharp-mode-map (kbd "g d") (lambda() (interactive) (evil-jumper--set-jump) (omnisharp-go-to-definition)))
  (evil-leader/set-key
    "rt" (lambda() (interactive) (omnisharp-unit-test "single"))
    "rf" (lambda() (interactive) (omnisharp-unit-test "fixture"))
    "ra" (lambda() (interactive) (omnisharp-unit-test "all"))
    "fu" 'omnisharp-helm-find-usages
    "cf" 'omnisharp-code-format
    "b"  'omnisharp-build-in-emacs
    "nm" 'omnisharp-rename-interactively
    "x"  'omnisharp-fix-code-issue-at-point
    "fi" 'omnisharp-find-implementations
    "fx" 'omnisharp-fix-usings)
  )
