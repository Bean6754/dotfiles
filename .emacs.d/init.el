;; Disable toolbar.
;; (menu-bar-mode -1)

;; Disable backups.
(setq make-backup-files nil)

;; Set line numbers to display.
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; %H = 24hr, e.g 02:33. %k = blank-padded, e.g: 2:33.
;; %I = 12hr. %l = blank-padded.
;; %M = minutes.
;; %S = seconds.
;; %p = am/pm.
(setq display-time-format "%l:%M(%p)")
(display-time-mode 1)

;; Set html-mode for .php files.
(setq auto-mode-alist
      (append '((".*\\.php\\'" . html-mode))
              auto-mode-alist))

;; Windmove window controls.
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; Theme.
(setq theme-file "~/.config/emacs/theme.el")
(load theme-file)

;; Evil mode.
;; Enable MELPA to install evil mode and neotree. ('M-x package-refresh-contents' then 'M-x package-install RET <pkg>').
;; Current pkg list: dired-sidebar, evil and evil-collection.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;; Evil mode.
(setq evil-want-keybinding nil)
(require 'evil)
(evil-mode 1)
(require 'evil-collection)

;; Dired-sidebar.
(add-hook 'emacs-startup-hook #'dired-sidebar-toggle-sidebar)
(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-subtree-line-prefix "__")
  (setq dired-sidebar-theme 'none)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t))
  (setq dired-sidebar-width 40)
  (setq dired-sidebar-display-alist '((side . right)))
  (setq dired-sidebar-pop-to-sidebar-on-toggle-open nil)
