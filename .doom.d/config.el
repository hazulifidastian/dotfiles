;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Hazuli Fidastian"
      user-mail-address "hazulifidastian@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "M+ 2m" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

(use-package! berrys-theme
  :config

  :config ;; for good measure and clarity
  (setq-default cursor-type '(bar . 2))
  (setq-default line-spacing 2))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; python
(after! lsp
  (setq lsp-pyls-configuration-sources ["flake8"]
        lsp-pyls-plugins-pylint-enabled nil
        lsp-pyls-plugins-pycodestyle-enabled nil
        lsp-pyls-plugins-flake8-enabled t
        lsp-ui-doc-enable t)

  (setq lsp-python-ms-executable
      "/home/efha/.config/coc/extensions/coc-python-data/languageServer.0.3.47"))

(use-package! pipenv
  :hook (python-mode . pipenv-mode)
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-extended))

;; window
(use-package! dimmer
  :config (dimmer-mode))
(use-package! beacon
  :diminish
  :config (setq beacon-color "#666600")
  :hook   ((org-mode text-mode) . beacon-mode))
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

;; ui:doom-dashboard
(setq fancy-splash-image "~/Pictures/emacs-banner.png")
