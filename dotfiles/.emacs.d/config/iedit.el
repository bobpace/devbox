(require 'use-package)
(use-package iedit
  :ensure t
  :config
  (global-set-key (kbd "M-[ 5 n") 'iedit-mode);iterm2 key ^; : ^[[5n
  )
