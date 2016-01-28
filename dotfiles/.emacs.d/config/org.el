(require 'org)
(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c c") 'org-capture)
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c b") 'org-iswitchb)
(setq browse-url-browser-function 'eww-browse-url)
(setq org-log-done t)
(setq org-agenda-files (list "~/data/org/work.org"
                             "~/data/org/home.org"))
(add-hook 'org-mode-hook
          (lambda ()
            (setq evil-shift-width 2)
            (setq evil-auto-indent nil)))
