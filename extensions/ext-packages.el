;;;
;;; Install & Load required package.
;;;

;; Load CommonLisp to simlify the rest of this configuration.
(require 'cl-lib)

; Configure package manager
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;; list the absolutely required packages here.
(defvar required-packages
  '(markdown-mode
    paredit
    magit)
  "A list of packages to ensure are installed at launch.")

;; Check for any packages that are not installed, and auto install.
(let ((uninstalled-packages (remove-if 'package-installed-p required-packages)))
  ;; refresh the package cache if we're going to install.
  (when uninstalled-packages
    (package-refresh-contents))
  ;; install each of the packages that are uninstalled.
  (dolist (p uninstalled-packages)
    (unless (package-installed-p p)
      (package-install p))))


;; Configure magit.
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; enable paredit by default for the various lisp modes
(loop for hook in '(emacs-lisp-mode-hook
		    lisp-mode-hook
		    inferior-lisp-mode-hook
		    scheme-mode-hook)
      do (add-hook hook (lambda ()
			  (paredit-mode t)
			  ;; better indentation mode
			  (local-set-key "\r" 'paredit-newline))))

;; markdown
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(provide 'ext-packages)
