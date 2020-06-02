;;; ~/.doom.d/+elixir.el -*- lexical-binding: t; -*-

;; credo strict
(setq flycheck-elixir-credo-strict t)

;; configuration for elixir-ls
(after! lsp-clients
  (lsp-register-client
   (make-lsp-client :new-connection
    (lsp-stdio-connection
        (expand-file-name
          "/home/efha/Applications/elixir-ls/rel/language_server.sh"))
        :major-modes '(elixir-mode)
        :priority -1
        :server-id 'elixir-ls
        :initialized-fn (lambda (workspace)
            (with-lsp-workspace workspace
             (let ((config `(:elixirLS
                             (:mixEnv "dev"
                                     :dialyzerEnabled
                                     :json-false))))
             (lsp--set-configuration config)))))))
