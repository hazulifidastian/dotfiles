"Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Used in ternaries for fallbacks to upstream sources when vcs_cst isn’t available:
let s:vcs_cst = dein#util#_get_type('vcs_cst') != {}

" Add a pre- or suffix to a list of strings. This greatly improves readability in my opinion.
function! s:prefix(str, args)
    return map(a:args, {_, s -> a:str . s})
endfunction
function! s:sffix(str, args)
    return map(a:args, {_, s -> s . a:str})
endfunction

" executable() doesn’t cache results, so we’ll do it ourselves to handle repeated calls:
let s:has_exec_cache = {}
function! s:has_exec(command)
    if !has_key(s:has_exec_cache, a:command)
        let s:has_exec_cache[a:command] = executable(a:command)
    endif
    return s:has_exec_cache[a:command]
endfunction


if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

        call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

        " Display the result when searching
        call dein#add('google/vim-searchindex')

        " Find and replace
        call dein#add('brooth/far.vim', {'on_cmd': ['Far', 'Farp', 'F']})

        " Editor config
        call dein#add('sgur/vim-editorconfig')

        " Automatically add matching tag
        call dein#add('jiangmiao/auto-pairs', {'on_ft': [
            \ '<Plug>AutoPairsReturn'
        \ ]})

        " Wrapper for git and display git diff in the left gutter
        call dein#add('tpope/vim-fugitive') | call dein#add('mhinz/vim-signify')

        " Display commits for project / file
        call dein#add('junegunn/gv.vim', {'on_cmd': 'GV'})

        " Surrounding with whatever you want (paranthesis, quotes...)
        call dein#add('tpope/vim-surround', {'on_cmd': [
            \ '<Plug>SurroundRepeat',
            \ '<Plug>Dsurround',
            \ '<Plug>Csurround',
            \ '<Plug>CSurround',
            \ '<Plug>Yssurround',
            \ '<Plug>YSsurround',
            \ '<Plug>Ysurround',
            \ '<Plug>YSurround',
            \ '<Plug>VSurround',
            \ '<Plug>VgSurround',
            \ '<Plug>Isurround',
            \ '<Plug>ISurround',
        \ ]})

        " Easily search, substitute and abbreviate multiple version of words
        call dein#add('tpope/vim-abolish', {'on_cmd': [
            \ '<Plug>(abolish-coerce)',
            \ '<Plug>(abolish-coerce)',
            \ '<plug>(abolish-coerce-word)'
        \ ]})

        " The . command can repeat whatever you want!
        " http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
        call dein#add('tpope/vim-repeat', {'on_cmd': [
            \ '<Plug>(RepeatDot)',
            \ '<Plug>(RepeatUndo)',
            \ '<Plug>(RepeatUndoLine)',
            \ '<Plug>(RepeatRedo)'
        \ ]})

        " Comment automatically
        call dein#add('scrooloose/nerdcommenter', {'on_cmd': '<Plug>NERDCommenterToggle'})

        " Add sugar on top of Vim
        call dein#add('tpope/vim-eunuch', {'on_cmd': [
            \ 'Delete',
            \ 'Unlink',
            \ 'Move',
            \ 'Rename',
            \ 'Chmod',
            \ 'Mkdir',
            \ 'Cfind',
            \ 'Clocate',
            \ 'Lfind',
            \ 'Wall',
            \ 'SudoWrite',
            \ 'SudoEdit'
        \ ]})

        " Move line
        call dein#add('tpope/vim-unimpaired', {'on_cmd': [
            \ '<Plug>unimpairedDirectoryNext',
            \ '<Plug>unimpairedDirectoryPrevious',
            \ '<Plug>unimpairedContextPrevious',
            \ '<Plug>unimpairedContextNext',
            \ '<Plug>unimpairedBlankUp',
            \ '<Plug>unimpairedBlankDown',
            \ '<Plug>unimpairedMove',
            \ '<Plug>unimpairedMoveSelectionUp',
            \ '<Plug>unimpairedMoveSelectionDown',
            \ '<Plug>unimpairedMoveUp',
            \ '<Plug>unimpairedMoveDown',
            \ '<Plug>unimpairedPaste',
            \ '<Plug>unimpairedPut',
            \ '<Plug>unimpairedPutAbove',
            \ '<Plug>unimpairedPutBelow'
        \ ]})

        " Dispatch
        " call dein#add('tpope/vim-dispatch', {'on_event': 'FileType'})

        " Swap arguments in parenthesis
        call dein#add('machakann/vim-swap', {'on_event': 'FileType'})

        " Match more stuff with % (html tag, LaTeX...)
        call dein#add('andymass/vim-matchup', {'on_ft': general_ft})

        " Rooter
        call dein#add('airblade/vim-rooter', {'on_event': 'FileType'})

        " Snippets, managed by coc-snippets
        call dein#add('honza/vim-snippets', {'on_ft': general_ft})

        " reStructured text
        call dein#add('Rykka/riv.vim', {'on_ft': 'rst'})

        " Python & django
        call dein#add('tweekmonster/django-plus.vim', {'on_ft': ['htmldjango', 'python']})
        call dein#add('mgedmin/python-imports.vim', {'on_ft': 'python'})

        " PHP
        call dein#add('captbaritone/better-indent-support-for-php-with-html', {'on_ft': 'php'})

        " Rust
        call dein#add('racer-rust/vim-racer', {'on_ft': 'rust'})

        " Typescript
        call dein#add('HerringtonDarkholme/yats.vim', {'on_ft': ['typescript', 'typescriptreact']})

        " Dart & Flutter
        call dein#add('tiagofumo/dart-vim-flutter-layout', {'on_ft': 'dart'})

        " Autocompletion
        call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})

        " Quality tools
        call dein#add('w0rp/ale', {'on_ft': general_ft})

        " Outliner
        call dein#add('majutsushi/tagbar', {'on_cmd': 'TagbarToggle'})

        " Collections of filetypeplugins
        call dein#add('sheerun/vim-polyglot', {'on_event': 'FileType'})

        " Dirvish, explorer
        call dein#add('justinmk/vim-dirvish', {'on_map': '-'})

        " Status bar
        call dein#add('itchyny/lightline.vim', {'on_event': 'FileType'})
        call dein#add('maximbaz/lightline-ale', {'on_event': 'FileType'})

        " Undo tree
        call dein#add('sjl/gundo.vim', {'on_cmd': [
            \ 'GundoToggle',
            \ 'GundoShow',
            \ 'GundoHide',
            \ 'GundoRenderGraph',
        \]})

        " Registers
        call dein#add('bfredl/nvim-miniyank', {'on_event': 'FileType'})

        " Close the current buffer
        call dein#add('moll/vim-bbye', {'on_event': 'FileType'})

        " Emmet for html
        call dein#add('mattn/emmet-vim', {'on_ft': [ 'html', 'css', 'javascript', 'javascriptreact' ]})

        " Fzf - poweful fuzzy finder
        call dein#add('junegunn/fzf', {
            \ 'build': './install --all',
            \ 'merged': 0, 
            \ 'if': s:has_exec('fzf'),
            \ 'on_cmd': 'FZF',
            \ 'on_func': 'fzf#run',
        \ })
        call dein#add('junegunn/fzf.vim', {
            \ 'depends': 'fzf',
            \ 'if': s:has_exec('fzf'),
            \ 'on_cmd': s:prefix(
            \   'FZF',
            \   ['Ag', 'Buffers', 'Colors', 'Commands', 'Files', 'GFiles',
            \    'History', 'Lines', 'Maps', 'Marks', 'Snippets', 'Windows']),
        \ })

        " Allow multisearch in current directory / multi replace as well
        call dein#add('wincent/ferret', {'on_event': 'FileType'})

        " Split arrays in PHP / struct in Go
        call dein#add('AndrewRadev/splitjoin.vim', {'on_ft': ['php', 'go']})

        " Themes
        call dein#add('morhetz/gruvbox')
        call dein#add('ayu-theme/ayu-vim')

        " Indent line
        call dein#add('Yggdroot/indentLine', { 'on_cmd': 'IndentLinesEnable' })
        autocmd! User indentLine doautocmd indentLine Syntax

        " Dealing with swap files
        call dein#add('gioele/vim-autoswap')

        " Goyo
        call dein#add('junegunn/goyo.vim', {'on_ft': ['markdown']})

        " Generate tags
        call dein#add('ludovicchabant/vim-gutentags', {'on_ft': ['php', 'python']})

    call dein#end()
    call dein#save_state()
endif
