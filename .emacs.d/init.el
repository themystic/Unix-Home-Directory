(tool-bar-mode -1)
(menu-bar-mode -1)

(setq visible-bell t
      inhibit-startup-message t
      color-theme-is-global t) 

; always display line numbers
(global-linum-mode 1)

; where to look for binaries
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/texlive/2010/bin/x86_64-darwin"))

; where to look for .el files.
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/color-themes/emacs-color-theme-solarized")
(add-to-list 'custom-theme-load-path "~/.emacs.d/color-themes/emacs-color-theme-solarized")

; configure package.el repos
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

; Packages that I use...
(defvar my-packages '(color-theme 
		      markdown-mode 
		      web-mode 
		      ido-ubiquitous 
		      smex ))

; Nice highlighting
(require 'idle-highlight-mode)

; use a nicer font.
(set-default-font "-apple-Monaco-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1")

; use a nicer theme
(load-theme 'solarized-light t)


; Helps manage parens in lisp.
(require 'paredit)
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook
	    (lambda ()
	      (paredit-mode t)
	      (show-paren-mode t)))

; remember my place in a file
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places") ) 
(require 'saveplace)   

; IDO mode config - much nicer mode line.
(require 'ido)
(ido-mode t)
(ido-ubiquitous t)
(smex-initialize)
(global-set-key [(meta x)] 'smex)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

; use web-mode instead of html-mode.
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

; auto-complete!
(require 'auto-complete-config)
(ac-config-default)

; Good indent settings
(setq python-indent 4)
(setq js-indent-level 2)
(setq html-indent-level 2)

; html-mode indent
(add-hook 'html-mode-hook
          (lambda()
	    ; turn off the linewrap.
            (auto-fill-mode 0)
            (setq sgml-basic-offset 4)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#fcf4dc")
 '(background-mode light)
 '(cursor-color "#52676f")
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" "501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" default)))
 '(foreground-color "#52676f"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
