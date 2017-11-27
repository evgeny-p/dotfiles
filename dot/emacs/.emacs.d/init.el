(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Packages
(when (not package-archive-contents)
    (package-refresh-contents))

(defvar my-packages
  '(company
    company-rtags
    fill-column-indicator
    flycheck-rtags
    helm-rtags
    greymatters-theme
    monokai-theme
    mwim
    neotree
    smooth-scrolling))

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      my-packages)


;; https://www.emacswiki.org/emacs/DotEmacsModular
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

(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
