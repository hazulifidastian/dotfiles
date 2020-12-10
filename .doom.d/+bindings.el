;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

;; comment or uncomment
(global-set-key (kbd "C-/") 'comment-dwim)

;; alternative M-x
(global-set-key (kbd "M-q") 'execute-extended-command)

;; ansi-term
(map! :leader :desc "ansi-term" "ot" #'fh-ansi-term)
;; tabar
(map! :leader
    ;; tab-bar
      (:prefix-map ("T" . "tab-bar")
       :desc "create"                             "c" #'tab-bar-new-tab 
       :desc "delete"                             "d" #'tab-bar-close-tab
       :desc "delete others"                      "O" #'tab-bar-close-other-tabs
       :desc "rename"                             "r" #'tab-bar-rename-tab
       :desc "rename tab by name"                 "R" #'tab-bar-rename-tab-by-name
       :desc "toggle active/deactive"             "T" #'tab-bar-mode
       :desc "undo close"                         "u" #'tab-bar-undo-close-tab
       :desc "move"                               ">" #'tab-bar-move-tab
       :desc "recent"                             "^" #'tab-bar-switch-to-recent-tab
       :desc "select tab by name"                 "s" #'tab-bar-select-tab-by-name))

(map! :n "gt" 'tab-bar-switch-to-next-tab)
(map! :n "gT" 'tab-bar-switch-to-prev-tab)

;; workspace
(map! :leader
      (:prefix-map ("TAB" . "workspace")
       :desc "Create workspace" "c" #'+workspace/new
       :desc "Next workspace" "n" #'+workspace/switch-right
       :desc "Prev workspace" "p" #'+workspace/switch-left))

;; font size, override C-M-=
(global-set-key (kbd "C-M-+") 'doom/increase-font-size)
