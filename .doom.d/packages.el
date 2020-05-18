;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; Snippets! From hlissner!
(package! emacs-snippets
  :recipe (:host github
           :repo "hlissner/emacs-snippets"
           :files ("*")))

(package! evil-matchit
  :recipe (:host github
           :repo "redguardtoo/evil-matchit"))
;; python
(package! cython :disable t)
(package! anaconda-mode :disable t)
(package! conda :disable t)
(package! nose :disable t)
(package! traad)
(package! pipenv)

;; php
(package! phpactor)

;; theme

;; window
(package! dimmer)
(package! beacon)
(package! golden-ratio)

;; modeline
(package! delight)
