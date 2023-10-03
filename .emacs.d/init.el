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

;; Theme.
(setq theme-file "~/.emacs.d/theme.el")
(load theme-file)

;; Evil mode.
;; Enable MELPA for initial evil mode installation ('M-x package-refresh-contents' then 'M-x package-install RET evil').
;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (package-initialize)
(require 'evil)
(evil-mode 1)
