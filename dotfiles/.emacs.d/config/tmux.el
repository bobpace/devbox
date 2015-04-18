(defvar tmux-session-name)
(defvar tmux-window-name)
(defvar tmux-pane-number)
(setq tmux-session-name 0)
(setq tmux-window-name 1)
(setq tmux-pane-number 2)

(defun tmux-split-window-project-root()
  "splits tmux pane horizontally at project root"
  (interactive)
  (when (fboundp 'projectile-project-root)
    (shell-command (format "tmux split-window -h -c %s" (projectile-project-root)))))

(defun tmux-exec (command)
  "Execute command in tmux pane"
  (interactive "scommand: ")
  (shell-command
   (format "tmux send-keys -t %s:%s.%s '%s' Enter" tmux-session-name tmux-window-name tmux-pane-number command)))

(defun tmux-setup (x y z)
  "Setup global variables for tmux session, window, and pane"
  (interactive "sEnter tmux session name: \nsEnter tmux window name: \nsEnter tmux pane number: ")
  (setq tmux-session-name x)
  (setq tmux-window-name y)
  (setq tmux-pane-number z)
  (message "Tmux Setup, session name: %s, window name: %s, pane number: %s" tmux-session-name tmux-window-name tmux-pane-number))

(define-key global-map (kbd "C-c \\") 'tmux-split-window-project-root)
