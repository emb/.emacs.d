;; Record customizations from `Customize` at this path instead of init.el.
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

;; These are Ed's base customization that are emacs centric without
;; external packages.
(add-hook 'after-init-hook'
          (lambda ()
            (load (concat user-emacs-directory "base-custom.el"))))

;; Personal script path
(add-to-list 'load-path (concat user-emacs-directory "extension"))

;; Install/load required packages.
(require 'ext-packages)
