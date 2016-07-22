(blink-cursor-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(setq-default cursor-type 'bar)

;; Monokai
; Ignore "Wrong type argument: stringp, highlight"
;(ignore-errors (load-theme 'monokai t))
(load-theme 'greymatters t)
(set-cursor-color "#333")

(setq neo-theme 'ascii)

(global-hl-line-mode 1)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(hl-line ((t (:background "#444")))))
 '(hl-line ((t (:background "#eee")))))
