(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Packages
(when (not package-archive-contents)
    (package-refresh-contents))

(defvar my-packages
  '(company
    company-irony
    fill-column-indicator
    monokai-theme
    neotree
    smooth-scrolling))

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      my-packages)



(defun load-directory (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
        ((and (eq isdir t) (not ignore-dir))
         (load-directory fullpath))
        ((and (eq isdir nil) (string= (substring path -3) ".el"))
         (load (file-name-sans-extension fullpath)))))))

(load-directory "~/.emacs.d/settings")

;; Rust
(setq racer-cmd "/home/evgeny/bin/racer")
(setq racer-rust-src-path "/home/evgeny/soft/rustc-1.8.0/src")

(add-hook 'racer-mode-hook #'company-mode)

(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
