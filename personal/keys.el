;;; Code

(define-key global-map (kbd "RET") 'newline-and-indent)

(define-key evil-normal-state-map "s" 'evil-forward-char)

(define-key evil-motion-state-map "n" 'evil-previous-line)
(define-key evil-motion-state-map "t" 'evil-next-line)
(define-key evil-motion-state-map "h" 'evil-backward-char)
(define-key evil-motion-state-map "s" 'evil-forward-char)

;; leader
(require 'evil-leader)
(global-evil-leader-mode)

(evil-leader/set-leader ",")
(evil-leader/set-key "e" 'projectile-find-file)
(evil-leader/set-key "w" 'evil-write)
(evil-leader/set-key "," 'evil-write)
(evil-leader/set-key "." 'evil-write)

(provide 'keys)
;;; keys.el ends here
