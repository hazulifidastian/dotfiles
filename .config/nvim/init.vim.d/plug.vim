if empty(glob(autoload_dir . '/plug.vim'))
  if executable('curl')
    execute 'silent !curl -fLo ' . autoload_dir . '/plug.vim --create-dirs ' .
          \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

call plug#begin(plugged_dir)

    " Display the result when searching
    Plug 'google/vim-searchindex'

    " Find and replace
    Plug 'brooth/far.vim', {'on': ['Far', 'Farp', 'F']}

    " Editor config
    Plug 'sgur/vim-editorconfig'

    " Automatically add matching tag
    Plug 'jiangmiao/auto-pairs'

    " Wrapper for git and display git diff in the left gutter
    Plug 'tpope/vim-fugitive' | Plug 'mhinz/vim-signify'

    " Display commits for project / file
    Plug 'junegunn/gv.vim', {'on': 'GV'}

    " Surrounding with whatever you want (parenthesis, quotes...)
    Plug 'tpope/vim-surround'

    " Easily search, substitute and abbreviate multiple version of words
    Plug 'tpope/vim-abolish'

    " The . command can repeat whatever you want!
    " http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
    Plug 'tpope/vim-repeat', {'on': [
        \ '<Plug>(RepeatDot)',
        \ '<Plug>(RepeatUndo)',
        \ '<Plug>(RepeatUndoLine)',
        \ '<Plug>(RepeatRedo)'
    \ ]}

    " Comment automatically
    Plug 'scrooloose/nerdcommenter', {'on': '<Plug>NERDCommenterToggle'}

    " Add sugar on top of Vim
    Plug 'tpope/vim-eunuch', {'on': [
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
    \ ]}

    " Move line
    Plug 'tpope/vim-unimpaired', {'on': [
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
    \ ]}

    " Dispatch
    " Plug 'tpope/vim-dispatch'

    " Swap arguments in parenthesis
    Plug 'machakann/vim-swap'

    " Match more stuff with % (html tag, LaTeX...)
    Plug 'andymass/vim-matchup', {'for': general_ft}

    " Rooter
    Plug 'airblade/vim-rooter'

    " Snippets, managed by coc-snippets
    Plug 'honza/vim-snippets', {'for': general_ft}

    " reStructured text
    Plug 'Rykka/riv.vim', {'for': 'rst'}

    " Python & django
    Plug 'tweekmonster/django-plus.vim', {'for': ['python', 'htmldjango']}
    Plug 'mgedmin/python-imports.vim', {'for': 'python'}

    " PHP
    Plug 'captbaritone/better-indent-support-for-php-with-html', {'for': 'php'}

    " Rust
    Plug 'racer-rust/vim-racer', {'for': 'rust'}

    " Typescript
    Plug 'HerringtonDarkholme/yats.vim', {'for': ['typescript', 'typescriptreact']}

    " Dart & Flutter
    Plug 'tiagofumo/dart-vim-flutter-layout', {'for': 'dart'}

    " Autocompletion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Quality tools
    Plug 'w0rp/ale', {'for': general_ft}

    " Outliner
    Plug 'majutsushi/tagbar'

    " Collections of filetypeplugins
    Plug 'sheerun/vim-polyglot'

    " Dirvish, explorer
    Plug 'justinmk/vim-dirvish'

    " Status bar
    Plug 'itchyny/lightline.vim'
    Plug 'maximbaz/lightline-ale'

    " Undo tree
    Plug 'sjl/gundo.vim', {'on': [
        \ 'GundoToggle',
        \ 'GundoShow',
        \ 'GundoHide',
        \ 'GundoRenderGraph',
    \]}

    " Registers
    Plug 'bfredl/nvim-miniyank', {'on': [
        \ '<Plug>(miniyank-startput)',
        \ '<Plug>(miniyank-startPut)',
        \ '<Plug>(miniyank-autoput)',
        \ '<Plug>(miniyank-autoPut)',
        \ '<Plug>(miniyank-cycle)',
        \ '<Plug>(miniyank-cycleback)',
        \ '<Plug>(miniyank-tochar)',
        \ '<Plug>(miniyank-toline)',
        \ '<Plug>(miniyank-toblock)',
    \]}

    " Close the current buffer
    Plug 'moll/vim-bbye', {'on': ['Bdelete', 'Bwipeout']}

    " Emmet for html
    Plug 'mattn/emmet-vim', {'for': ['html', 'htmldjango', 'css', 'typescriptreact', 'javascriptreact']}

    " Fzf - poweful fuzzy finder
    Plug 'junegunn/fzf', {
        \ 'dir': '~/.fzf',
        \ 'do': './install --all',
        \ }
    Plug 'junegunn/fzf.vim', {'on': [
        \ 'Files',
        \ 'GFiles',
        \ 'Buffers',
        \ 'Colors',
        \ 'Ag',
        \ 'Rg',
        \ 'Lines',
        \ 'BLines',
        \ 'Tags',
        \ 'BTags',
        \ 'Marks',
        \ 'Windows',
        \ 'Locate',
        \ 'History',
        \ 'Snippets',
        \ 'Commits',
        \ 'BCommits',
        \ 'Commands',
        \ 'Maps',
        \ 'Helptags',
        \ 'Filetypes',
    \ ]}

    Plug 'pechorin/any-jump.vim', {'on': 'AnyJump'}


    " Allow multisearch in current directory / multi replace as well
    Plug 'wincent/ferret', {'on': [
        \ '<Plug>(FerretAck)',
        \ '<Plug>(FerretAcks)',
        \ 'Ack',
        \ 'Acks',
        \ 'Ack!',
        \ 'Lack',
        \ 'Lacks',
        \ 'Lack!',
        \ 'Back',
        \ 'Back!',
        \ 'Black',
        \ 'Black!',
        \ 'Quack',
        \ 'Quack!',
        \ 'FerretCancelAsync',
        \ 'FerretPullAsync',
        \ 'Qargs',
        \ 'Largs',
    \ ]}

    " Easy way to rezise and exchange windows
    " Plug 'simeji/winresizer'

    " Split arrays in PHP / struct in Go
    Plug 'AndrewRadev/splitjoin.vim', {'for': ['php', 'go']}

    " Themes
    Plug 'morhetz/gruvbox'
    Plug 'ayu-theme/ayu-vim'

    " Indent line
    Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
    autocmd! User indentLine doautocmd indentLine Syntax

    " Dealing with swap files
    Plug 'gioele/vim-autoswap'

    " Goyo
    Plug 'junegunn/goyo.vim', {'for': 'markdown'}

    " Generate tags
    Plug 'ludovicchabant/vim-gutentags', {'for': ['php', 'python']}

call plug#end()
