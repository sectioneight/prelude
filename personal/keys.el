;;; Code
(setq prelude-guru nil)

(define-key global-map (kbd "RET") 'newline-and-indent)
;; (electric-indent-mode +1)

(define-key evil-normal-state-map "s" 'evil-forward-char)

(define-key evil-motion-state-map "l" 'evil-search-next)
(define-key evil-motion-state-map "n" 'evil-previous-line)
(define-key evil-motion-state-map "t" 'evil-next-line)
(define-key evil-motion-state-map "h" 'evil-backward-char)
(define-key evil-motion-state-map "s" 'evil-forward-char)

(define-key evil-normal-state-map (kbd "DEL") 'delete-window)

;; leader
(require 'evil-leader)
(global-evil-leader-mode)

(evil-leader/set-leader ",")

(evil-leader/set-key "w" 'evil-write)
(evil-leader/set-key "," 'evil-write)

(evil-leader/set-key "e" 'projectile-find-file)
(evil-leader/set-key "n" 'helm-mini)
(evil-leader/set-key "g" 'helm-M-x)

;; evil nerd commenter hotkeys
(evilnc-default-hotkeys)

(evil-leader/set-key "-" 'evilnc-comment-or-uncomment-lines)

;; better m-x
(global-set-key (kbd "M-x") 'helm-M-x)

;; git rebase mode is dumb
(setq auto-mode-alist (delete '("git-rebase-todo" . rebase-mode)
                              auto-mode-alist))

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

(evil-leader/set-key "." 'vi-line-above)
(evil-leader/set-key "u" 'vi-line-below)


(defun go-to-reviewers()
  (interactive)
  "Go to reviewers section of `arc diff`"
  (search-forward "Reviewers:")
  (evil-append-line 1))

(define-key evil-motion-state-map "gr" 'go-to-reviewers)

(provide 'keys)
;;; keys.el ends here
