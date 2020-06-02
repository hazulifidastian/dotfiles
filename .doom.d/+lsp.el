;;; ~/.doom.d/+lsp.el -*- lexical-binding: t; -*-

;; lsp-ui
;; (after! lsp-ui
;;   (setq lsp-ui-doc-max-height 13
;;         lsp-ui-doc-max-width 80
;;         lsp-ui-sideline-ignore-duplicate t
;;         lsp-ui-doc-header t
;;         lsp-ui-doc-include-signature t
;;         lsp-ui-doc-position 'bottom
;;         lsp-ui-doc-use-webkit nil
;;         lsp-ui-flycheck-enable t
;;         lsp-ui-imenu-kind-position 'left
;;         lsp-ui-sideline-code-actions-prefix "💡"
;;         ;; fix for completing candidates not showing after “Enum.”:
;;         company-lsp-match-candidate-predicate #'company-lsp-match-candidate-prefix
;;         ))

(after! lsp-ui
  (setq lsp-ui-sideline-enable nil
        lsp-ui-flycheck-enable t))
