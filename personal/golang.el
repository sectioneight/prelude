;;; Code:

(defun my-go-mode-hook ()
  (whitespace-mode -1)
  (setq tab-width 2 indent-tabs-mode 1)
  (setq fill-column 100))

(add-hook 'before-save-hook #'gofmt-before-save)
(add-hook 'go-mode-hook 'my-go-mode-hook)

(defun go-display-cover-out ()
  "Display go coverage from coverage.out"
  (go-coverage (expand-file-name "./cover.out")))

(defun golang-compile-and-coverage ()
  "Compile with coverage."
  (interactive)
  (message "Running tests...")
  (shell-command "make -k test")
  (go-display-cover-out))

(evil-leader/set-key-for-mode 'go-mode
  "l" 'golang-compile-and-coverage)

;;; golang.el ends here
