(defun my-go-mode-hook ()
  (setq tab-width 2 indent-tabs-mode 1))

(add-hook 'go-mode-hook 'my-go-mode-hook)
