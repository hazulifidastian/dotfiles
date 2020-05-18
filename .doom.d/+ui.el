;;; ~/.doom.d/+ui.el -*- lexical-binding: t; -*-

;; ui:doom-dashboard
(setq fancy-splash-image "~/Pictures/emacs-banner.png")

;; remember cursor position
(save-place-mode 1)

;; dimmer
(use-package! dimmer
  :config (dimmer-mode))

;; beacon, cursor highlighter
(use-package! beacon
  :diminish
  :config (setq beacon-color "#666600")
  :hook   ((org-mode text-mode) . beacon-mode))

;; golden-ratio
(use-package! golden-ratio
  :diminish golden-ratio-mode
  :init (golden-ratio-mode 1)
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
      select-window-5)))
  )
