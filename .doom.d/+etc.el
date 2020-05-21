;;; ~/.doom.d/+others.el -*- lexical-binding: t; -*-

;; projectile
(setq projectile-project-search-path '("/home/efha/Projects/"))

;; fish-completion
(when (and (executable-find "fish")
	           (require 'fish-completion nil t))
	  (global-fish-completion-mode))

;; do not force dedicated mode
;; (advice-add 'gdb-display-buffer
;;         :around (lambda (orig-fun &rest r)
;;               (let ((window (apply orig-fun r)))
;;             (set-window-dedicated-p window nil)
;;             window)))

;; (advice-add 'gdb-set-window-buffer
;;         :around (lambda (orig-fun name &optional ignore-dedicated window)
;;               (funcall orig-fun name ignore-dedicated window)
;;               (set-window-dedicated-p window nil)))

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
