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
(set-face-background 'hl-line "#eee")
