(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See package-archive-priorities
;; and package-pinned-packages. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(org-export-backends (quote (ascii html icalendar latex md odt org)))
 '(package-selected-packages
   (quote
    (slime ox-rst spacemacs-theme magit yaml-mode helm-projectile projectile helm paredit spaceline sly dashboard))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package dashboard
 :ensure t
 :config
 (dashboard-setup-startup-hook))

(use-package spaceline
 :demand t
 :init
 (setq powerline-default-separator 'arrow-fade)
 :config
 (require 'spaceline-config)
 (spaceline-spacemacs-theme))

(use-package helm
 :config
 (require 'helm-config))

(use-package projectile
 :ensure t
 :config
 (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
 (projectile-mode +1))

(use-package helm-projectile
 :ensure t
 :config (helm-projectile-on))

(use-package org
 :ensure t)

(use-package ox-rst
 :ensure t)

(setq inferior-lisp-program "/usr/bin/sbcl")
(set-frame-font "Source Code Pro 12" nil t)
(setq org-default-notes-file (concat org-directory "/notes.org"))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "C-;") 'sly-eval-buffer)

;;disable splash screen and startup message
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq org-todo-keywords
      '((sequence "TODO" "WAITING" "|" "DONE" "CANCELLED")))

(setq python-shell-interpreter "/usr/bin/python3")
(when (executable-find "ipython3")
  (setq python-shell-interpreter "/usr/bin/ipython3"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((lisp . t)
   (python . t)
   ))
(setq org-babel-lisp-eval-fn #'sly-eval)
