(defun my-c++-mode-hook ()
  (show-paren-mode 1)
  (define-key c-mode-base-map [f4] 'ff-find-related-file))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)
