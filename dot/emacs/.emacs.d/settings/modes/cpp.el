(c-add-style "my-style"
             '("stroustrup"
               (indent-tabs-mode . t)        ; use spaces rather than tabs
               (c-basic-offset . 4)            ; indent by four spaces
               (tab-width . 4)
               (c-offsets-alist . ((inline-open . 0)  ; custom indentation rules
                                   (brace-list-open . 0)
                                   (statement-case-open . +)
                                   (arglist-cont-nonempty . +)
                                   (member-init-intro . 0)))))

(defun my-c++-mode-hook ()
  (c-set-style "my-style")
  (show-paren-mode 1)
  (define-key c-mode-base-map [f4] 'ff-find-related-file)

  ; fill column indicator
  (fci-mode 1)
  (setq fill-column 100))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)
