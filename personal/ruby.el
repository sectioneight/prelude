; Use 2-space indents for rooby
(setq ruby-indent-level 2)

(defun my-ruby-mode-hook ()
  (shift-width 2)
  (setq tab-width 2))

(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)
