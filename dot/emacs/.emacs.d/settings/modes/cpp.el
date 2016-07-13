(defun my-c++-mode-hook ()
  (show-paren-mode 1)
  (define-key c-mode-base-map [f4] 'ff-find-related-file)

  ; fill column indicator
  (fci-mode 1)
  (setq fill-column 80))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)
