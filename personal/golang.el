(defun my-go-mode-hook ()
  (whitespace-mode -1)
  (setq tab-width 2 indent-tabs-mode 1))

(add-hook 'go-mode-hook 'my-go-mode-hook)
