;; enable _ word-movement in python
(add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
