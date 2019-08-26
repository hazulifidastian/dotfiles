let g:coc_user_config = {
    \ "coc.preferences.formatOnSaveFiletypes": ["css", "html", "htmldjango"],
    \ "suggest.enablePreview": 1,
    \ "snippets.ultisnips.directories": ["~/.vim/ultisnips"],
    \ "snippets.extends": {
    \     "htmldjango": ["htmldjango", "html", "css", "javascript"]
    \ },
    \ "diagnostic.displayByAle": 1,
    \ "diagnostic.checkCurrentLine": 1,
    \ "diagnostic.refreshOnInsertMode": 1,
    \ "diagnostic.refreshAfterSave": 1,
    \ "diagnostic.errorSign": "!!",
    \ "diagnostic.warningSign": "--",
    \ "diagnostic.infoSign": "\"",
    \ "diagnostic.hintSign": "'",
    \ "languageserver": {
    \    "dart": {
    \        "command": "dart_language_server",
    \        "args": [],
    \        "filetypes": ["dart"],
    \        "initializationOptions": {},
    \        "settings": {
    \            "dart": {
    \            "validation": {},
    \            "completion": {}
    \            }
    \        }
    \    }
    \ },
    \ "python.jediEnabled": 0,
    \ "python.linting.flake8Enabled": 1,
    \ "python.linting.flake8Args": ["--ignore=E116,E501,E265,W503", "--max-line-length=88"],
    \ "python.linting.pylintEnabled": 1,
    \ "python.linting.pylintArgs": [
    \    "--disable=all", 
    \    "--enable=import-error, import-self, reimported, wildcard-import, misplaced-future, deprecated-module, unpacking-non-sequence, invalid-all-object, undefined-all-variable, used-before-assignment, cell-var-from-loop, global-variable-undefined, redefine-in-handler, unused-import, unused-wildcard-import, global-variable-not-assigned, undefined-loop-variable, global-statement, global-at-module-level, bad-open-mode, redundant-unittest-assert, boolean-datetime deprecated-method, anomalous-unicode-escape-in-string, anomalous-backslash-in-string, not-in-loop, continue-in-finally, abstract-class-instantiated, star-needs-assignment-target, duplicate-argument-name, return-in-init, too-many-star-expressions, nonlocal-and-global, return-outside-function, return-arg-in-generator, invalid-star-assignment-target, bad-reversed-sequence, nonexistent-operator, yield-outside-function, init-is-generator, nonlocal-without-binding, lost-exception, assert-on-tuple, dangerous-default-value, duplicate-key, useless-else-on-loop expression-not-assigned, confusing-with-statement, unnecessary-lambda, pointless-statement, pointless-string-statement, unnecessary-pass, unreachable, eval-used, exec-used, using-constant-test, bad-super-call, missing-super-argument, slots-on-old-class, super-on-old-class, property-on-old-class, not-an-iterable, not-a-mapping, format-needs-mapping, truncated-format-string, missing-format-string-key, mixed-format-string, too-few-format-args, bad-str-strip-call, too-many-format-args, bad-format-character, format-combined-specification, bad-format-string-key, bad-format-string, missing-format-attribute, missing-format-argument-key, unused-format-string-argument unused-format-string-key, invalid-format-index, bad-indentation, mixed-indentation, unnecessary-semicolon, lowercase-l-suffix, invalid-encoded-data, unpacking-in-except, import-star-module-level, long-suffix, old-octal-literal, old-ne-operator, backtick, old-raise-syntax, metaclass-assignment, next-method-called, dict-iter-method, dict-view-method, indexing-exception, raising-string, using-cmp-argument, cmp-method, coerce-method, delslice-method, getslice-method, hex-method, nonzero-method, t-method, setslice-method, old-division, logging-format-truncated, logging-too-few-args, logging-too-many-args, logging-unsupported-format, logging-format-interpolation, invalid-unary-operand-type, unsupported-binary-operation, not-callable, redundant-keyword-arg, assignment-from-no-return, assignment-from-none, not-context-manager, repeated-keyword, missing-kwoa, no-value-for-parameter, invalid-sequence-index, invalid-slice-index, unexpected-keyword-arg, unsupported-membership-test, unsubscriptable-object, access-member-before-definition, method-hidden, assigning-non-slot, duplicate-bases, inconsistent-mro, inherit-non-class, invalid-slots, invalid-slots-object, no-method-argument, no-self-argument, unexpected-special-method-signature, non-iterator-returned, arguments-differ, signature-differs, bad-staticmethod-argument, non-parent-init-called, bad-except-order, catching-non-exception, bad-exception-context, notimplemented-raised, raising-bad-type, raising-non-exception, misplaced-bare-raise, duplicate-except, broad-except, nonstandard-exception, binary-op-exception, bare-except, not-async-context-manager, yield-inside-async-function", 
    \    "--load-plugins=pylint_django", 
    \    "--max-parents=25"
    \ ],
    \ "python.linting.mypyEnabled": 1,
    \ "python.linting.mypyArgs": ["--ignore-missing-imports", "--follow-imports=silent"],
    \ "python.formatting.provider": "black"
    \ }

let g:coc_global_extensions = [
    \ 'coc-tslint-plugin', 
    \ 'coc-tsserver', 
    \ 'coc-emmet', 
    \ 'coc-css', 
    \ 'coc-html', 
    \ 'coc-json', 
    \ 'coc-yank', 
    \ 'coc-prettier',
    \ 'coc-python',
    \ 'coc-rls',
    \ 'coc-snippets',
\ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>cp  :<C-u>CocListResume<CR>

" coc-snippet
" ===========

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
