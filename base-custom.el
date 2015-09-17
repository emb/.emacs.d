;; disable useless graphical extras
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; hide startup messages
(setq inhibit-startup-screen t) ; no splash screen

;; nothing in *scratch* when started
(setq initial-scratch-message nil)

;; show matching parentheses
(show-paren-mode 1)

;; whitespace
(setq show-trailing-whitespace t)

;; disable beeping and visual bell
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; dialog boxes are annoying
(setq use-dialog-box nil)

;; bigger message log than default of 100
(setq message-log-max 5000)

;; display
(setq custom-enabled-themes (quote (misterioso)))

;; editing adjustments
(setq-default indent-tabs-mode nil)

;; Configuration for ido mode.
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
