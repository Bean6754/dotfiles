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

;; Theme.
(setq theme-file "~/.emacs.d/theme.el")
(load theme-file)
