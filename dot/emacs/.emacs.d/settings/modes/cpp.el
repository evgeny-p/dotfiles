(c-add-style "my-style"
             '("stroustrup"
               (indent-tabs-mode . t)          ; use tabs rather than spaces
               (c-basic-offset . 4)            ; indent by four spaces
               (tab-width . 4)
               (c-offsets-alist . ((inline-open . 0)  ; custom indentation rules
                                   (brace-list-open . 0)
                                   (innamespace . 0)
                                   (statement-case-open . +)
                                   (arglist-cont-nonempty . +)
                                   (member-init-intro . 0)))))

(defun my-c++-mode-hook ()
  (c-set-style "my-style")
  (show-paren-mode 1)
  (define-key c-mode-base-map [f4] 'ff-find-related-file)

  (setq rtags-autostart-diagnostics t)
  (setq rtags-completions-enabled t)
  (setq rtags-display-result-backend 'helm)
  (define-key c-mode-base-map (kbd "M-.") 'rtags-find-symbol-at-point)
  (define-key c-mode-base-map (kbd "M-,") 'rtags-location-stack-back)

  (setq company-backends '(company-rtags))
  (company-mode 1)

  ; fill column indicator
  ; Switched off: conflicts with company mode
  ; https://github.com/alpaker/Fill-Column-Indicator/issues/54
  ; https://github.com/company-mode/company-mode/issues/180#issuecomment-55047120
  ; http://emacs.stackexchange.com/questions/147/how-can-i-get-a-ruler-at-column-80
  ; (fci-mode 1)
  ; (setq fill-column 100)
  )

(add-hook 'c++-mode-hook 'my-c++-mode-hook)
