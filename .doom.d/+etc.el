;;; ~/.doom.d/+others.el -*- lexical-binding: t; -*-

;; projectile
(setq projectile-project-search-path '("/home/efha/Projects/"))

;; fish-completion
(when (and (executable-find "fish")
	           (require 'fish-completion nil t))
	  (global-fish-completion-mode))

;; doom-line
;; (setq doom-modeline-window-width-limit fill-column)
;; (setq doom-modeline-bar-width 3)
(setq doom-modeline-minor-modes nil)
(setq doom-modeline-buffer-encoding nil)
(setq doom-modeline-env-version nil)

(after! doom-modeline
  (doom-modeline-def-modeline 'main
    '(bar matches buffer-info remote-host buffer-position parrot selection-info)
    '(misc-info minor-modes checker input-method buffer-encoding lsp major-mode process vcs "  ")))

;; delight, hide mode from modeline
(add-hook 'python-mode-hook
          (lambda ()
            (delight '((python-mode "PY")))
            ))

(add-hook 'pyenv-mode-hook
          (lambda ()
            (delight '((pipenv-mode "PE")
                       (pyenv-mode "PE")))
            ))

;; (setq debug-on-error nil)

(defun fh-ansi-term ()
  (interactive)
  (ansi-term "/usr/bin/fish" "fh-ansi-term")
  (term-line-mode)
  (emojify-mode))
