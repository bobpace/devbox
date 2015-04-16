(require 'use-package)

(defun my-csharp-mode ()
  (add-to-list 'company-backends 'company-omnisharp)
  (omnisharp-mode)
  (company-mode)
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  (turn-on-eldoc-mode))

(use-package omnisharp
  :ensure t
  :init
  (add-hook 'csharp-mode-hook 'my-csharp-mode)
  (custom-set-variables
   '(omnisharp-company-sort-results t)
   '(omnisharp-auto-complete-want-documentation nil)
   '(omnisharp-company-strip-trailing-brackets nil)
   '(omnisharp-server-executable-path
     "~/data/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe"
     )
   )
  :config
  (add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))
  (setq omnisharp-company-do-template-completion t
        ;omnisharp-debug t
        )

  (evil-define-key 'normal omnisharp-mode-map (kbd "g d") (lambda() (interactive) (evil-jumper--set-jump) (omnisharp-go-to-definition)))
  (evil-define-key 'normal omnisharp-mode-map (kbd ", b") 'omnisharp-build-in-emacs)
  (evil-define-key 'normal omnisharp-mode-map (kbd ", cf") 'omnisharp-code-format)
  (evil-define-key 'normal omnisharp-mode-map (kbd ", nm") 'omnisharp-rename-interactively)
  (evil-define-key 'normal omnisharp-mode-map (kbd ", fu") 'omnisharp-helm-find-usages)
  (evil-define-key 'normal omnisharp-mode-map (kbd ", fs") 'omnisharp-helm-find-symbols)
  (evil-define-key 'normal omnisharp-mode-map (kbd "<M-RET>") 'omnisharp-run-code-action-refactoring)
  (evil-define-key 'normal omnisharp-mode-map (kbd ", ss") 'omnisharp-start-omnisharp-server)
  (evil-define-key 'normal omnisharp-mode-map (kbd ", sp") 'omnisharp-stop-omnisharp-server)
  (evil-define-key 'normal omnisharp-mode-map (kbd ", fi") 'omnisharp-find-implementations)
  (evil-define-key 'normal omnisharp-mode-map (kbd ", x") 'omnisharp-fix-code-issue-at-point)
  (evil-define-key 'normal omnisharp-mode-map (kbd ", fx") 'omnisharp-fix-usings)
  (evil-define-key 'normal omnisharp-mode-map (kbd ", o") 'omnisharp-auto-complete-overrides)
  (define-key evil-normal-state-map (kbd ", rt") (lambda() (interactive) (omnisharp-unit-test "single")))
  (define-key evil-normal-state-map (kbd ", rf") (lambda() (interactive) (omnisharp-unit-test "fixture")))
  (define-key evil-normal-state-map (kbd ", ra") (lambda() (interactive) (omnisharp-unit-test "all")))
  (define-key evil-normal-state-map (kbd ", rl") 'recompile)
  )
