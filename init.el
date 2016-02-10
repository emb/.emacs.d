
;; Record customizations from `Customize` at this path instead of init.el.
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

;; These are Ed's base customization that are emacs centric without
;; external packages.
(load (concat user-emacs-directory "base-custom.el"))

;; Install/Configure magit
(use-package magit
  :ensure t
  :bind ("C-c m s" . magit-status))

;; Install/Configure markdown mode
(use-package markdown-mode
  :mode "\\.md\\'")
