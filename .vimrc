if !1 | finish | endif

if &compatible
    set nocompatible
endif

syntax on


" path to your python
let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python2'


" Filetype

if exists("g:did_load_filetypes")
  filetype off
  filetype plugin indent off
endif

filetype on
filetype plugin indent on

set background=dark

" Change cursor shape based on mode

let &t_SI="\<Esc>[6 q"
let &t_SR="\<Esc>[4 q"
let &t_EI="\<Esc>[2 q"


" Vim specific config

set ttymouse=xterm2

set t_Co=256

" gruvbox soft colors
let g:terminal_ansi_colors=[
\ '#32302f',
\ '#cc241d',
\ '#98971a',
\ '#d79921',
\ '#458588',
\ '#b16286',
\ '#689d6a',
\ '#a89984',
\ '#928374',
\ '#fb4934',
\ '#b8bb26',
\ '#fabd2f',
\ '#83a598',
\ '#d3869b',
\ '#8ec07c',
\ '#ebdbb2'
\ ]

" User Interface

" Set line number
set number

" Use 4 spaces instead of tab (to replace existing tab use :retab)
" Copy indent from current line when starting a new line
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Wrap nowrap and easy horz scrolling
set nowrap
set sidescroll=1

" when at 3 spaces, and I hit > ... go to 4, not 7
set shiftround

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Set list
set list listchars=tab:\┆\ ,trail:·,nbsp:±,extends:>,precedes:<

" Doesn't prompt a warning when opening a file and the current file was written but not saved
set hidden

" Doesn't display the mode status
set noshowmode

" Fold related
set foldlevelstart=1 " Start with some folds closed

" relative / hybrid line number switch
set number number

" for vertical pane in git diff tool
set diffopt+=vertical

" Enable the mouse
set mouse=a

" split below and right
set splitbelow splitright

" Shorten message
set shortmess+=c

" hide tabline (tabline had limited capability)
set showtabline=1

" No resizing if any window closed
set noequalalways

" Show fileinfo on terminal title
set title titlestring=

" Colum coloring
" set colorcolumn=88

set updatetime=300

" Always show signcolumns
set signcolumn=yes

" command height
set cmdheight=1


" Swap setting

" No swap file! This is just annoying
"set noswapfile


" Clipboard setting

" The copy goes to the clipboard
set clipboard=unnamedplus

" Better ex autocompletion
set wildmenu
set wildmode=list:longest,full



" Shell

set shell=/usr/bin/fish


" Ignored files & folders

" Files and folders to ignore
set wildignore=*/.git/*
set wildignore+=*/.DS_Store
set wildignore+=*/vendor
set wildignore+=*/env/*
set wildignore+=*.pyc
set wildignore+=*/__pycache__/
set wildignore+=*/deps/* " Elixir deps
set wildignore+=*/_build/* " Elixir builds
set wildignore+=*/Pods/* " CocoaPods
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=*/elm-stuff/*
set wildignore+=*/staticfiles/*
set wildignore+=*.gch
set wildignore+=*.o


" Misc

" hu?
inoremap <expr> <c-y> matchstr(getline(line('.')-1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')

" Waiting for key
set timeout timeoutlen=1000 ttimeoutlen=10

" Show status on vim/gvim
set laststatus=2

set sessionoptions-=help
set sessionoptions-=buffers
set sessionoptions-=options

" Search file when open with command :e file<Tab>
set path+=**

" Repeat pattern after search with /<pattern>
set incsearch
