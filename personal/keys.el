;;; Code
(setq prelude-guru nil)

(define-key global-map (kbd "RET") 'newline-and-indent)
;; (electric-indent-mode +1)

(define-key evil-normal-state-map "s" 'evil-forward-char)
(define-key evil-normal-state-map "k" 'kill-word)
(define-key evil-normal-state-map "j" 'evil-delete-backward-word)

(define-key evil-motion-state-map "l" 'evil-search-next)
(define-key evil-motion-state-map "n" 'evil-previous-line)
(define-key evil-motion-state-map "t" 'evil-next-line)
(define-key evil-motion-state-map "h" 'evil-backward-char)
(define-key evil-motion-state-map "s" 'evil-forward-char)

(define-key evil-normal-state-map (kbd "DEL") 'delete-window)

(defun select-paragraph ()
  "Select inside paragraph."
  (interactive)
  (backward-paragraph)
  (evil-next-line)
  (evil-visual-line)
  (forward-paragraph)
  (evil-previous-line))

;; leader
(prelude-require-package 'evil-leader)
(global-evil-leader-mode)

(evil-leader/set-leader ",")

(evil-leader/set-key
  "w" 'evil-write
  "e" 'projectile-find-file
  "n" 'helm-mini
  "g" 'helm-M-x
  "y" 'helm-show-kill-ring
  "a" 'projectile-ag
  "p" 'toggle-pbcopy
  "cd" 'cd
  "r" 'select-paragraph)

;; evil nerd commenter hotkeys
(prelude-require-package 'evil-nerd-commenter)
(evilnc-default-hotkeys)

(evil-leader/set-key "-" 'evilnc-comment-or-uncomment-lines)

;; better m-x
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-b") 'hippie-expand)
;; disable evil-states toggle
(define-key evil-motion-state-map (kbd "C-z") nil)
(define-key evil-insert-state-map (kbd "C-z") nil)

;; git rebase mode is dumb
(setq auto-mode-alist (delete '("git-rebase-todo" . rebase-mode)
                              auto-mode-alist))

(add-to-list 'auto-mode-alist '("git-rebase-todo" . git-commit-mode))

(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer
          (delq (current-buffer)
                (remove-if-not 'buffer-file-name (buffer-list)))))

(setq-default auto-fill-function 'do-auto-fill)

(defun vi-line-above ()
  "Insert a line above."
  (interactive)
  (save-excursion
    (evil-open-above 1)
    (evil-force-normal-state)))

(defun vi-line-below ()
  "Insert a line below."
  (interactive)
  (save-excursion
    (evil-open-below 1)
    (evil-force-normal-state)))

(defun trailing-comma ()
  "Add a trailing comma!"
  (interactive)
  (save-excursion
    (evil-append-line 1)
    (insert ",")
    (evil-force-normal-state)))

(evil-leader/set-key
  "." 'vi-line-above
  "u" 'vi-line-below
  "d" 'trailing-comma
  "s" 'sort-lines)

(defun go-to-reviewers()
  (interactive)
  "Go to reviewers section of `arc diff`"
  (search-forward "Reviewers:")
  (evil-append-line 1))

(define-key evil-motion-state-map "gr" 'go-to-reviewers)

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(global-set-key (kbd "C-c v") 'pbpaste)

(defun tell-emacsclients-for-buffer-to-die ()
  "Sends error exit command to every client for the current buffer."
  (interactive)
  (dolist (proc server-buffer-clients)
    (server-send-string proc "-error die")))

(evil-leader/set-key
  "cq" 'tell-emacsclients-for-buffer-to-die
  "m" 'magit-status
  "b" 'magit-blame-mode
  "h" 'magit-blame-locate-commit)

(defun shift-width (width)
  (interactive "n")
  (set-variable 'evil-shift-width width))

(evil-leader/set-key
  "2" (lambda () (interactive) (shift-width 2))
  "4" (lambda () (interactive) (shift-width 4)))

(provide 'keys)
;;; keys.el ends here
