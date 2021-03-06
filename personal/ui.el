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
  (progn
    (nyan-mode)
    (set-frame-font "Monaco-13")
    (scroll-bar-mode -1)))

(menu-bar-mode -1)
(setq initial-scratch-buffer nil)
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

(prelude-require-package 'lush-theme)
(load-theme 'lush t)

(prelude-require-package 'git-gutter+)
(global-git-gutter+-mode t)

;; follow symlinks with a warning under vc
(setq vc-follow-symlinks nil)

(setq-default fill-column 80)


(set-face-attribute 'vertical-border
                    nil
                    :foreground "#282a2e")

;; display tabs as two-spaces, helpful for golang
(setq tab-width 2)

;; highlight the current argument in eldoc with some color
(set-face-attribute 'eldoc-highlight-function-argument nil
                    :underline nil :foreground "#00ccdd"
                    :weight 'bold)
