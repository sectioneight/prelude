;; Don't care about the bell
(setq ring-bell-function 'ignore)

;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t))

(if window-system
  (scroll-bar-mode -1))

;; (require 'powerline)
;; (powerline-default-theme)

(menu-bar-mode -1)
(setq initial-scratch-buffer nil)
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

(load-theme 'lush t)

(global-git-gutter+-mode t)

;; follow symlinks with a warning under vc
(setq vc-follow-symlinks nil)

(set-display-table-slot standard-display-table
                        'vertical-border (make-glyph-code 8203))

(set-face-attribute 'vertical-border
                    nil
                    :foreground "#282a2e")
