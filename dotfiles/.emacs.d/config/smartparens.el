(use-package smartparens
  :ensure t
  :config
    (smartparens-global-mode t)
    (show-smartparens-global-mode t)

    ;;;;;;;;;;;;;;;;;;;;;;;;
    ;; keybinding management
    (define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
    (define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)

    (define-key sp-keymap (kbd "C-M-d") 'sp-down-sexp)
    (define-key sp-keymap (kbd "C-M-a") 'sp-backward-down-sexp)
    (define-key sp-keymap (kbd "C-S-a") 'sp-beginning-of-sexp)
    (define-key sp-keymap (kbd "C-S-d") 'sp-end-of-sexp)

    (define-key sp-keymap (kbd "C-M-e") 'sp-up-sexp)
    (define-key emacs-lisp-mode-map (kbd ")") 'sp-up-sexp)
    (define-key sp-keymap (kbd "C-M-u") 'sp-backward-up-sexp)
    (define-key sp-keymap (kbd "C-M-t") 'sp-transpose-sexp)

    (define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
    (define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)

    (define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
    (define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)

    (define-key sp-keymap (kbd "M-<delete>") 'sp-unwrap-sexp)
    (define-key sp-keymap (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

    (define-key sp-keymap (kbd "C-<right>") 'sp-forward-slurp-sexp)
    (define-key sp-keymap (kbd "C-<left>") 'sp-forward-barf-sexp)
    (define-key sp-keymap (kbd "C-M-<left>") 'sp-backward-slurp-sexp)
    (define-key sp-keymap (kbd "C-M-<right>") 'sp-backward-barf-sexp)

    (define-key sp-keymap (kbd "M-D") 'sp-splice-sexp)
    (define-key sp-keymap (kbd "C-M-<delete>") 'sp-splice-sexp-killing-forward)
    (define-key sp-keymap (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)
    (define-key sp-keymap (kbd "C-S-<backspace>") 'sp-splice-sexp-killing-around)

    (define-key sp-keymap (kbd "C-]") 'sp-select-next-thing-exchange)
    (define-key sp-keymap (kbd "C-<left_bracket>") 'sp-select-previous-thing)
    (define-key sp-keymap (kbd "C-M-]") 'sp-select-next-thing)

    (define-key sp-keymap (kbd "M-F") 'sp-forward-symbol)
    (define-key sp-keymap (kbd "M-B") 'sp-backward-symbol)

    (define-key sp-keymap (kbd "H-t") 'sp-prefix-tag-object)
    (define-key sp-keymap (kbd "H-p") 'sp-prefix-pair-object)
    (define-key sp-keymap (kbd "H-s c") 'sp-convolute-sexp)
    (define-key sp-keymap (kbd "H-s a") 'sp-absorb-sexp)
    (define-key sp-keymap (kbd "H-s e") 'sp-emit-sexp)
    (define-key sp-keymap (kbd "H-s p") 'sp-add-to-previous-sexp)
    (define-key sp-keymap (kbd "H-s n") 'sp-add-to-next-sexp)
    (define-key sp-keymap (kbd "H-s j") 'sp-join-sexp)
    (define-key sp-keymap (kbd "H-s s") 'sp-split-sexp)

    ;;;;;;;;;;;;;;;;;;
    ;; pair management
    (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)

    ;;; markdown-mode
    (sp-with-modes '(markdown-mode gfm-mode rst-mode)
    (sp-local-pair "*" "*" :bind "C-*")
    (sp-local-tag "2" "**" "**")
    (sp-local-tag "s" "```scheme" "```")
    (sp-local-tag "<"  "<_>" "</_>" :transform 'sp-match-sgml-tags))

    ;;; tex-mode latex-mode
    (sp-with-modes '(tex-mode plain-tex-mode latex-mode)
      (sp-local-tag "i" "\"<" "\">"))

    ;;; html-mode
    (sp-with-modes '(html-mode sgml-mode)
      (sp-local-pair "<" ">"))

    ;;; lisp modes
    (sp-with-modes sp--lisp-modes
      ;; disable ', it's the quote character!
      (sp-local-pair "'" nil :actions nil)
      ;; also only use the pseudo-quote inside strings where it serve as
      ;; hyperlink.
      (sp-local-pair "`" "'" :when '(sp-in-string-p sp-in-comment-p))
      (sp-local-pair "`" nil
                     :skip-match (lambda (ms mb me)
                                   (cond
                                    ((equal ms "'")
                                     (or (sp--org-skip-markup ms mb me)
                                         (not (sp-point-in-string-or-comment))))
                                    (t (not (sp-point-in-string-or-comment)))))))

    (defun sp--org-skip-markup (ms mb me)
      (save-excursion
        (and (progn
               (goto-char mb)
               (save-match-data (looking-back "\\sw\\|\\s_\\|\\s.")))
             (progn
               (goto-char me)
               (save-match-data (looking-at "\\sw\\|\\s_\\|\\s.")))))))
