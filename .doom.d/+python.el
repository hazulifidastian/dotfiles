;;; ~/.doom.d/+python.el -*- lexical-binding: t; -*-

;; lsp-python-ms
(after! lsp-python-ms
  (set-lsp-priority! 'mspyls 1))

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
(add-hook 'python-mode-hook
          (lambda ()
            (setq-default flycheck-checker 'python-flake8
                          flycheck-disabled-checkers '(python-pylint python-mypy python-pycompile)
                          flycheck-flake8rc ".global_python_setup.cfg"
                          flycheck-pylintrc ".global_python_setup.cfg"
                          flycheck-python-mypy-config ".global_python_setup.cfg"
                          flycheck-check-syntax-automatically '(mode-enabled save idle-change idle-buffer-switch))))

;; temporary hack for traad
;; TODO find alternative
(setq venv-location "/home/efha/.local/share/")

;; delight, hide mode from modeline
(add-hook 'python-mode-hook
          (lambda ()
            (delight '((python-mode "PY")))))

;; pyvenv on modeline
(add-hook 'pyvenv-post-activate-hooks
          (lambda ()
            (setq pyvenv-virtual-env-name (substring pyvenv-virtual-env-name 0 3))))
