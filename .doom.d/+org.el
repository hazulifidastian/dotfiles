;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-

(setq
 org-tags-column -80
 org-agenda-files (ignore-errors (directory-files +org-dir t "\\.org$" t))
 org-log-done 'time
 default-buffer-file-coding-system 'utf-8
 org-startup-indented t
 org-src-tab-acts-natively t
 org-hide-emphasis-markers t
 org-fontify-done-headline t
 org-hide-leading-stars t
 org-pretty-entities t
 org-odd-levels-only t
 )

(use-package org-bullets
  :custom
  ;; (org-bullets-bullet-list '("◉" "☯" "○" "☯" "✸" "☯" "✿" "☯" "✜" "☯" "◆" "☯" "▶"))
  (org-ellipsis "⤵")
  :hook (org-mode . org-bullets-mode))

;; change asterisk to ...
(font-lock-add-keywords 'org-mode
    '(("^\\(*\\)"
    (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "⛊"))))))

  (font-lock-add-keywords 'org-mode
    '(("^\\*\\(*\\)"
    (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "⛊"))))))

  (font-lock-add-keywords 'org-mode
    '(("^*\\*\\(*\\)"
    (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "⛉"))))))

  (font-lock-add-keywords 'org-mode
    '(("^*\\*\\*\\(*\\)"
    (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "⛉"))))))

;; (after! org
;;   (set-face-attribute 'org-link nil
;;                       :weight 'normal
;;                       :background nil)
;;   (set-face-attribute 'org-code nil
;;                       :foreground "#a9a1e1"
;;                       :background nil)
;;   (set-face-attribute 'org-date nil
;;                       :foreground "#5B6268"
;;                       :background nil)
;;   (set-face-attribute 'org-level-1 nil
;;                       :foreground "steelblue2"
;;                       :background nil
;;                       :height 1.2
;;                       :weight 'normal)
;;   (set-face-attribute 'org-level-2 nil
;;                       :foreground "slategray2"
;;                       :background nil
;;                       :height 1.0
;;                       :weight 'normal)
;;   (set-face-attribute 'org-level-3 nil
;;                       :foreground "SkyBlue2"
;;                       :background nil
;;                       :height 1.0
;;                       :weight 'normal)
;;   (set-face-attribute 'org-level-4 nil
;;                       :foreground "DodgerBlue2"
;;                       :background nil
;;                       :height 1.0
;;                       :weight 'normal)
;;   (set-face-attribute 'org-level-5 nil
;;                       :weight 'normal)
;;   (set-face-attribute 'org-level-6 nil
;;                       :weight 'normal)
;;   (set-face-attribute 'org-document-title nil
;;                       :foreground "SlateGray1"
;;                       :background nil
;;                       :height 1.75
;;                       :weight 'bold))
