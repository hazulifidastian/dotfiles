;;; ~/.doom.d/+ui.el -*- lexical-binding: t; -*-

;; ui:doom-dashboard
(setq fancy-splash-image "~/Pictures/emacs-banner.png")
(setq +doom-dashboard-name "*EFHA*")

;; remember cursor position
(save-place-mode 1)

;; dimmer
;; (use-package! dimmer
;;   :config (dimmer-mode))

;; beacon, cursor highlighter
;; (use-package! beacon
;;    :diminish
;;    :config (setq beacon-color "#666600")
;;    :hook   ((org-mode text-mode) . beacon-mode))

;; golden-ratio
(use-package! golden-ratio
  :diminish golden-ratio-mode
  :init (golden-ratio-mode -1)
  (setq golden-ratio-extra-commands
        (append golden-ratio-extra-commands
                '(evil-window-left
                  evil-window-right
                  evil-window-up
                  evil-window-down
                  select-window-1
                  select-window-2
                  select-window-3
                  select-window-4
                  select-window-5))
        golden-ratio-exclude-modes
        '("calendar-mode"
          "org-agenda-mode"
          "help-mode"
          "helpful-mode"
          "rxt-help-mode"
          "treemacs-mode"
          "comint-mode")
        golden-ratio-exclude-buffer-names
        '("*Org tags*"
          "*Org todo*"
          "*info*"
          "*Messages*"
          "*Debugger*"
          "*Backtrace*")
        golden-ratio-exclude-buffer-regexp
        '("*Treemacs"
          "*dap-ui-"
          "*Python ::")
        ))

;; tab-bar
;; (set-face-background 'tab-bar "#e5e9f0")
;; (set-face-background 'tab-bar-tab "#5d86b6")
;; (set-face-foreground 'tab-bar-tab "white")
;; (face-spec-set 'tab-bar-tab-inactive
;;                '((t (:foreground "inherit" :background "#e5e9f0"))))
