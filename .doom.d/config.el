;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq user-full-name "Hazuli Fidastian"
      user-mail-address "hazulifidastian@gmail.com")

(setq doom-font (font-spec :family "D2Coding" :size 15)
  doom-variable-pitch-font (font-spec :family "D2Coding" :size 15)
  doom-big-font (font-spec :family "D2Coding" :size 20))

;; best themes:
;; doom-dark+, doom-city-lights, doom-ephemeral
;; doom-gruvbox, doom-material, doom-nord-light,
;; doom-nord, doom-one-light, doom-one,
;; doom-solarized-light/dark, doom-spacegrey, doom-tomorrow-day,
(setq doom-theme 'doom-tomorrow-day)

(setq org-directory "~/org/")

(load! "+ui")
(load! "+bindings")
(load! "+lsp")
(load! "+org")
(load! "+python")
(load! "+elixir")
(load! "+php")
(load! "+rust")
(load! "+dap")
(load! "+etc")
