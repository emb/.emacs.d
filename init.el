;;; init.el --- Emacs configuration

;;; Commentary:
;; - Load base custom configuration.
;; - Install a bunch of packages.

;;; Code:

;; Record customizations from `Customize` at this path instead of init.el.
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

;; These are Ed's base customization that are emacs centric.
(load (concat user-emacs-directory "base-custom.el"))

(require 'diminish)

;; We  always need magit.
(use-package magit
  :ensure t
  :bind ("C-c m s" . magit-status))

;; And flycheck
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :diminish
  (flycheck-mode . " Ⓢ"))

;; Markdown is also useful.
(use-package markdown-mode
  :ensure t
  :mode "\\.md\\'")

;; Ensure we have smartparens. A good replacement for paredit
(use-package smartparens
  :ensure t
  :init
  (smartparens-global-mode)
  (show-smartparens-global-mode)
  :config
  (require 'smartparens-config)
  :diminish
  (smartparens-mode . " ⓟ"))

;; Fixup OSX path
(use-package exec-path-from-shell
  :ensure t
  :if (eq system-type 'darwin)
  :config
  (add-to-list 'exec-path-from-shell-variables "GOPATH")
  (exec-path-from-shell-initialize))

;; golang can be usefull sometimes.
(use-package go-mode
  :mode "\\.go\\'"
  :init
  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package rust-mode
  :mode "\\.rs\\'")

(use-package dockerfile-mode
  :mode "Dockerfile.\\'")

(use-package yaml-mode
  :mode "\\.ya?ml\\'")

(use-package terraform-mode
  :mode "\\.tf\\'")

;;; init.el ends here
