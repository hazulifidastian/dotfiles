" Autocommand
" ===========

" General config for autocommand
augroup vimrc
  autocmd!
augroup END

autocmd vimrc FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd vimrc FileType php,js,vue,go call matchadd('ColorColumn', '\%120v', 100)

" open devdocs.io with googel chrome and search the word under the cursor
command! -nargs=? DevDocs :call system('type -p open >/dev/null 2>&1 && open https://devdocs.io/#q=<args> || google-chrome -url https://devdocs.io/#q=<args>')
autocmd vimrc FileType python,ruby,rspec,javascript,go,html,php,eruby,coffee,haml nmap <buffer> <Leader>D :exec "DevDocs " . fnameescape(expand('<cword>'))<CR>

" buffer cleanup - delete every buffer except the one open
command! Ball :silent! call Bdeleteonly()

" restore the position of the last cursor when you open a file
autocmd vimrc BufReadPost * call RestorePosition()

" delete trailing space when saving files
autocmd vimrc BufWrite *.php,*.js,*.jsx,*.vue,*.twig,*.html,*.sh,*.yaml,*.yml :call DeleteTrailingWS()

" Open images with feh
autocmd vimrc BufEnter *.png,*.jpg,*gif silent! exec "! feh ".expand("%") | :bw

autocmd FileType netrw setl bufhidden=wipe

" Hide highlight search after exit command-line
augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" Support comment on json
autocmd FileType json syntax match Comment +\/\/.\+$+

" Override filetype
" -----------------

" Twig
autocmd vimrc BufNewFile,BufRead *.twig set filetype=html.twig

" Yaml
autocmd vimrc BufNewFile,BufRead *.yml.dist set filetype=yaml.

" vimlocal
autocmd vimrc BufNewFile,BufRead *.vimlocal set filetype=vim

" css
autocmd vimrc BufNewFile,BufRead *.css set filetype=css

" Autoreload vim
" autocmd BufWritePost .vimrc source $MYVIMRC
" autocmd BufWritePost .vimlocal source .vimlocal
