;;; ~/.doom.d/+python.el -*- lexical-binding: t; -*-

;; lsp-python-ms
;; (after! lsp-python-ms
;;   (set-lsp-priority! 'mspyls 1))

;; pyls config
(use-package! lsp
  :init
  (setq lsp-pyls-plugins-flake8-enabled nil)
  (setq lsp-pyls-plugins-pylint-enabled nil)
  (setq lsp-pyls-plugins-autopep8-enabled nil)
  (setq lsp-pyls-plugins-yapf-enabled nil)
  (setq lsp-pyls-plugins-pyflakes-enabled nil)
  (setq lsp-pyls-plugins-rope-completion-enabled nil)
  (setq lsp-pyls-plugins-pydocstyle-enabled nil)
  (setq lsp-pyls-plugins-pycodestyle-enabled nil)
  (setq lsp-pyls-plugins-jedi-completion-enabled t))

;; compatibility emacs shell with ipython and jupyter repl
(setq +python-ipython-repl-args '("-i" "--simple-prompt" "--no-color-info"))
(setq +python-jupyter-repl-args '("--simple-prompt"))

;; pipenv
(setq pipenv-with-flycheck nil)
(setq pipenv-with-projectile nil)

;; flycheck
(add-hook 'pipenv-mode-hook
          (lambda ()
            (setq flycheck-checker 'python-flake8)
            (setq flycheck-disabled-checkers '(python-mypy))
            (flycheck-add-next-checker 'python-flake8 '(warning . python-pylint) '(warning . python-mypy))
            (setq flycheck-check-syntax-automatically '(mode-enabled save idle-change idle-buffer-switch))
            ;; (setq flycheck-python-flake8-executable "/home/efha/.pyenv/shims/flake8")
            (setq flycheck-flake8rc "/home/efha/Projects/sinta/setup.cfg")
            ;; (setq flycheck-python-pylint-executable "/home/efha/.pyenv/shims/pylint")
            ;; (setq flycheck-python-mypy-executable "/home/efha/.pyenv/shims/mypy")
            ))
