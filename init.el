(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default indent-line-function 'insert-tab)

; (setq rust-indent-offset 2) ;; rust

(global-display-line-numbers-mode)
(add-to-list 'default-frame-alist '(font . "Fira Code 12"))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq use-package-always-ensure t)

(use-package rust-mode)

(use-package doom-themes
  :config (load-theme 'doom-one t))

(use-package evil
  :config (evil-mode 1))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  ((c-mode . lsp)
   (c++-mode . lsp)
   (rust-mode . lsp)
   (csharp-mode . lsp))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)

(use-package yasnippet
  :hook
  (lsp-mode . yas-minor-mode))

(use-package yasnippet-snippets
  :config
  (yas-reload-all))

(use-package company
  :init
  (setq company-backends `((:separate company-capf company-yasnippet))))

(electric-pair-mode 1)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups/")))

(add-to-list 'exec-path "~/.dotnet/tools")

(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(ido-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
