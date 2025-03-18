(global-display-line-numbers-mode)
(add-to-list 'default-frame-alist '(font . "Fira Code 12"))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'rust-mode)
  (package-install 'rust-mode))
(require 'rust-mode)

(unless (package-installed-p 'doom-themes)
  (package-install 'doom-themes))
(require 'doom-themes)
(load-theme 'doom-one t)

(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)

(unless (package-installed-p 'lsp-mode)
  (package-install 'lsp-mode))
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  ((c-mode . lsp)
   (rust-mode . lsp)
   (csharp-mode . lsp))
  :commands lsp)

(unless (package-installed-p 'lsp-ui)
  (package-install 'lsp-ui))
(use-package lsp-ui :commands lsp-ui-mode)

(unless (package-installed-p 'yasnippet)
  (package-install 'yasnippet))
(unless (package-installed-p 'yasnippet-snippets)
  (package-install 'yasnippet-snippets))

(use-package yasnippet
  :hook
  (lsp-mode . yas-minor-mode))

(use-package yasnippet-snippets
  :config
  (yas-reload-all))

(unless (package-installed-p 'company)
  (package-install 'company))

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
