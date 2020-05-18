;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq user-full-name "Hazuli Fidastian"
      user-mail-address "hazulifidastian@gmail.com")

(setq doom-font (font-spec :family "M+ 2m" :size 14)
  doom-variable-pitch-font (font-spec :family "M+ 2m" :size 14)
  doom-big-font (font-spec :family "M+ 2m" :size 20))

;; best themes:
;; doom-dark+, doom-city-lights, doom-ephemeral
;; doom-gruvbox, doom-material, doom-nord-light,
;; doom-nord, doom-one-light, doom-one,
;; doom-solarized-light, doom-spacegrey, doom-tomorrow-day,
(setq doom-theme 'doom-one)

(setq org-directory "~/org/")

(setq display-line-numbers-type t)

(load! "+ui")
(load! "+bindings")
(load! "+lsp")
(load! "+org")
(load! "+python")
(load! "+elixir")
(load! "+php")
(load! "+rust")
(load! "+etc")
