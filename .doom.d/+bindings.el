;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

;; comment or uncomment
(global-set-key (kbd "C-/") 'comment-dwim)

;; alternative M-x
(global-set-key (kbd "M-q") 'execute-extended-command)

;; ansi-term
(map! :leader :desc "ansi-term" "ot" #'fh-ansi-term)

;; tab-bar
(map! :n "gt" 'tab-bar-switch-to-next-tab)
(map! :n "gT" 'tab-bar-switch-to-prev-tab)
