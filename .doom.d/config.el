;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(set-language-environment   "UTF-8")
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq user-full-name "Hazuli Fidastian"
      user-mail-address "hazulifidastian@gmail.com")

;; (setq doom-font (font-spec :family "JetBrains Mono" :size 14)
;;   doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 14)
;;   doom-big-font (font-spec :family "JetBrains Mono" :size 20))

(set-face-attribute 'default nil
                    :family "JetBrains Mono"
                    :height 103)

(setq-default line-spacing 0.19)

;; themes for gui and emacs -nw
(if window-system
    (setq doom-theme 'doom-nord-light)
  (setq doom-theme 'doom-peacock))


(setq org-directory "~/org/")

(load! "+ui")
(load! "+bindings")
(load! "+lsp")
(load! "+org")
(load! "+python")
(load! "+js")
(load! "+elixir")
(load! "+php")
(load! "+rust")
(load! "+dap")
(load! "+etc")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-ellipsis "⤵")
 '(safe-local-variable-values
   '((eval add-hook 'python-mode-hook 'flycheck-mode
           (setq-default flycheck-disabled-checkers
                         '(python-mypy python-pycompile))
           (setq flycheck-flake8rc "/home/efha/Projects/sinta/setup.cfg" flycheck-pylintrc "/home/efha/Projects/sinta/setup.cfg"))
     (eval dap-register-debug-template "Python :: Sinta"
           (list :type "python" :args "runserver --noreload" :cwd "/home/efha/Projects/sinta" :env
                 '(("DJANGO_SETTINGS_MODULE" . "sinta.settings.dev"))
                 :module nil :request "launch" :console "integratedTerminal" :program "/home/efha/Projects/sinta/manage.py" :name "Python :: Sinta" :django t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
