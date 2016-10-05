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

;; Install auto-complete-mode
(use-package auto-complete
  :ensure t
  :diminish
  (auto-complete-mode . " Ⓐ"))

;; golang can be usefull sometimes.
(defun go-get (package)
  "Use `go get' to install Go package PACKAGE."
  (call-process "go" nil nil nil "get" package))

(use-package go-mode
  :ensure t
  :mode "\\.go\\'"

  :init
  ;; This maybe slow, but whatever
  (go-get "github.com/rogpeppe/godef")
  (go-get "golang.org/x/tools/cmd/...")
  (go-get "github.com/golang/lint/golint")

  (setq gofmt-command "goimports")      ;; goimports better than gofmt.
  (add-hook 'before-save-hook 'gofmt-before-save)

  :bind
  (("M-." . godef-jump)
   ("M-," . pop-tag-mark))

  :config
  ;; Go lint
  (load-file "$GOPATH/src/github.com/golang/lint/misc/emacs/golint.el")

  ;; Install autocomplet
  (use-package go-autocomplete
    :ensure t
    :commands ac-config-default
    :init
    (ac-config-default)
    (add-hook 'go-mode-hook 'auto-complete-mode))

  ;; Mini-buffer documentation.
  (use-package go-eldoc
    :ensure t
    :init
    (add-hook 'go-mode-hook 'go-eldoc-setup)
    :diminish eldoc-mode)

  ;; Install go-guru package
  (use-package go-guru
    :ensure t
    :commands go-guru-hl-identifier-mode
    :init
    (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)))

;; Rust
(use-package rust-mode
  :mode "\\.rs\\'")

;; Docker
(use-package dockerfile-mode
  :mode "Dockerfile.\\'")

;; YAML Files
(use-package yaml-mode
  :mode "\\.ya?ml\\'")

;; Terraform
(use-package terraform-mode
  :mode "\\.tf\\'")

;;; init.el ends here
