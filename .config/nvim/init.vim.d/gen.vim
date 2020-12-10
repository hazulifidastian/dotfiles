syntax on


" Path declarations "

let config_dir = '~/.nvim/'

" Create backup directory if not exists
if empty(glob(config_dir . '/backup'))
  if executable('curl')
    execute 'silent !mkdir -p ' . config_dir . 'backup'
  endif
endif

execute 'set backupdir=' .config_dir. 'backup//'
execute 'set directory=' .config_dir. 'swap//'

" Save undo trees in files
set undofile
execute 'set undodir=' .config_dir. 'undo//'

" Session directory
let g:sessions_dir = config_dir. 'sessions//'

" path to your python
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'


" Filetype "

if exists("g:did_load_filetypes")
  filetype off
  filetype plugin indent off
endif

filetype on
filetype plugin indent on


" Colorscheme "

set background=dark

if &background ==# 'dark'
    " let g:gruvbox_bold=1
    " let g:gruvbox_underline=1
    " let g:gruvbox_undercurl=1
    " let g:gruvbox_termcolors=256
    " let g:gruvbox_contrast_dark="soft"
    " let g:gruvbox_contrast_light="soft"
    " let g:gruvbox_sign_column='dark0_soft'
    " let g:gruvbox_color_column='dark0_soft'  "Ruler
    " let g:gruvbox_vert_split='dark0_soft'
    " let g:gruvbox_invert_selection=0
    " let g:gruvbox_invert_signs=0
    " let g:gruvbox_invert_indent_guides=0
    " let g:gruvbox_invert_tabline=0
    " let g:gruvbox_improved_warnings=1
    colorscheme onedark

    " Hide tilde on blank line for gruvbox
    hi EndOfBuffer ctermfg=bg
else
    " colorscheme solarized8_flat
    set termguicolors

    let ayucolor="light"
    colorscheme ayu
endif

" Change cursor shape based on mode

let &t_SI="\<Esc>[6 q"
let &t_SR="\<Esc>[4 q"
let &t_EI="\<Esc>[2 q"


" Nvim specific config "

tnoremap <Esc> <C-\><C-n>

" Show the substitution LIVE
set inccommand=nosplit

autocmd TermOpen * setlocal nornu nonu


" Number of undo saved in memory
"
set undolevels=1000  " How many undos
set undoreload=1000  " number of lines to save for undo


" User Interface "

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

" Set foldtext
set foldtext=FoldText()

" relative / hybrid line number switch
set number number

" for vertical pane in git diff tool
set diffopt+=vertical

" Enable the mouse
set mouse=a

" split below and right
" set splitbelow splitright

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
" set signcolumn=yes

" command height
set cmdheight=1


" Swap setting "

" No swap file! This is just annoying
"set noswapfile


" Clipboard setting "

" The copy goes to the clipboard
set clipboard+=unnamedplus

" Better ex autocompletion
set wildmenu
set wildmode=list:longest,full



" Shell "

set shell=/usr/bin/fish


" Ignored files & folders "

" Files and folders to ignore
set wildignore=*/.git/*
set wildignore+=*/.DS_Store
set wildignore+=*/vendor
set wildignore+=*/env/*
set wildignore+=*.pyc
set wildignore+=*/__pycache__/
set wildignore+=*/.mypy_cache
set wildignore+=*/deps/* " Elixir deps
set wildignore+=*/_build/* " Elixir builds
set wildignore+=*/Pods/* " CocoaPods
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=*/elm-stuff/*
set wildignore+=*/staticfiles/*
set wildignore+=*.gch
set wildignore+=*.o


" Misc "

" No clue what it is :D
" autocmd VimResized * wincmd =

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

" Python3 config
let g:python3_host_prog = '/home/efha/.asdf/shims/python'
