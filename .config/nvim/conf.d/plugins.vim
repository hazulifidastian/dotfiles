call plug#begin(plugged_dir)

	" Display the result when searching
	Plug 'google/vim-searchindex'

	" Find and replace
	Plug 'brooth/far.vim'

	" Editor config
	Plug 'sgur/vim-editorconfig'

	" Automatically add matching tag
	Plug 'jiangmiao/auto-pairs'

	" Wrapper for git and display git diff in the left gutter
	Plug 'tpope/vim-fugitive' | Plug 'mhinz/vim-signify'

	" Display commits for project / file
	Plug 'junegunn/gv.vim'

	" Surrounding with whatever you want (paranthesis, quotes...)
	Plug 'tpope/vim-surround'

	" Easily search, substitute and abbreviate multiple version of words
	Plug 'tpope/vim-abolish'

	" The . command can repeat whatever you want!
	" http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
	Plug 'tpope/vim-repeat'

	" Comment automatically
	Plug 'scrooloose/nerdcommenter'

	" Add sugar on top of Vim
	Plug 'tpope/vim-eunuch'

	" Move line
	Plug 'tpope/vim-unimpaired'

	" Dispatch
	Plug 'tpope/vim-dispatch'

	" Swap arguments in parenthesis
	Plug 'machakann/vim-swap'

	" Match more stuff with % (html tag, LaTeX...)
	Plug 'andymass/vim-matchup'

	" Rooter
	Plug 'airblade/vim-rooter'

	" Snippets, managed by coc-snippets
	Plug 'honza/vim-snippets'

	" reStructured text
	Plug 'Rykka/riv.vim', {'for': 'rst'}

	" Python & django
	Plug 'tweekmonster/django-plus.vim'
	Plug 'mgedmin/python-imports.vim'

	" PHP
	Plug 'captbaritone/better-indent-support-for-php-with-html'

	" Rust
	Plug 'racer-rust/vim-racer', {'for': 'rust'}

	" Typescript
	Plug 'HerringtonDarkholme/yats.vim'

	" Dart & Flutter
	Plug 'tiagofumo/dart-vim-flutter-layout', {'for': 'dart'}

	" Autocompletion
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Quality tools
	Plug 'w0rp/ale'

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
	Plug 'sjl/gundo.vim'

	" Registers
	Plug 'bfredl/nvim-miniyank'

	" Close the current buffer
	Plug 'moll/vim-bbye'

	" Emmet for html
	Plug 'mattn/emmet-vim'

	" Fzf - poweful fuzzy finder
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

	" Allow multisearch in current directory / multi replace as well
	Plug 'wincent/ferret'

	" Easy way to rezise and exchange windows
	Plug 'simeji/winresizer'

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
	Plug 'junegunn/goyo.vim'

	" Generate tags
	Plug 'ludovicchabant/vim-gutentags'

call plug#end()
