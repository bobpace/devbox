(require 'use-package)
(use-package js-doc
  :ensure t
  :config
  (setq js-doc-mail-address "bob.pace@gmail.com"
        js-doc-author (format "Bob Pace <%s>" js-doc-mail-address)))
