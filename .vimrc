" =======================
" Vim/Nvim Configurations
" =======================



" Document structures
" ===================

    " Header 1
    " ========

    " Header 2
    " --------

    " Header 3
    " ''''''''

    " Header 4
    " ~~~~~~~~

    " Header 5
    " ````````



" Initial Configurations
" ======================


" Skip for vim-tiny or vim-small

if !1 | finish | endif

if &compatible
    set nocompatible
endif



" Libraries
" =========

" Restore position of the cursor when reopening a file
function! RestorePosition()
    if exists("g:restore_position_ignore") && match(expand("%"), g:restore_position_ignore) > -1
        return
    endif

    if line("'\"") > 1 && line("'\"") <= line("$")
        exe "normal! g`\""
    endif
endfunc

" delete trailing space when saving files
function! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" buffer cleanup - delete every buffer except the one open
function! Buflist()
    redir => bufnames
    silent ls
    redir END
    let list = []
    for i in split(bufnames, "\n")
        let buf = split(i, '"' )
        call add(list, buf[-2])
|   endfor
    return list
endfunction

function! Bdeleteonly()
    let list = filter(Buflist(), 'v:val != bufname("%")')
    for buffer in list
        call DeleteEmptyBuffers()
        exec "bdelete ".buffer
    endfor
endfunction

function! DeleteEmptyBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val) < 0 && (getbufline(v:val, 1, "$") == [""])')
    if !empty(buffers)
        exe 'bd '.join(buffers, ' ')
    endif
endfunction

" Simple Zoom / Restore window (like Tmux)
function! ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction

function! FoldText()
    let line=getline(v:foldstart)
    let nucolwidth=&foldcolumn+&number*&numberwidth
    let windowwidth=winwidth(0)-nucolwidth-3
    let foldedlinecount=v:foldend-v:foldstart+1
    let onetab=strpart('          ', 0, &tabstop)
    let line=substitute(line, '\t', onetab, 'g')
    let line=strpart(line, 0, windowwidth-2-len(foldedlinecount))
    let fillcharcount=windowwidth-len(line)-len(foldedlinecount)
    return line.'…'.repeat(' ',fillcharcount).foldedlinecount.'L'.' '
endfunction

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" For use with pressing * or # in visual mode to search for current selection
function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute 'normal! vgvy'

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", '', '')

  if a:direction is# 'gv'
    call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction is# 'replace'
    call CmdLine('%s' . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" to toggle quickfix list and location list
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

" restore window size and position
function! ScreenFilename()
    if has('amiga')
        return "s:.vimsize"
    elseif has('win32')
        return $HOME.'\_vimsize'
    else
        return $HOME.'/.vimsize'
    endif
endfunction

function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
        let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
        for line in readfile(f)
            let sizepos = split(line)
            if len(sizepos) == 5 && sizepos[0] == vim_instance
                silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
                silent! execute "winpos ".sizepos[3]." ".sizepos[4]
                return
            endif
        endfor
    endif
endfunction

function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
        let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
        let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
                    \ (getwinposx()<0?0:getwinposx()) . ' ' .
                    \ (getwinposy()<0?0:getwinposy())
        let f = ScreenFilename()
        if filereadable(f)
            let lines = readfile(f)
            call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
            call add(lines, data)
        else
            let lines = [data]
        endif
        call writefile(lines, f)
    endif
endfunction



" Plugins
" =======


if has('nvim')
  let vimplugdir='~/.config/nvim/plugged'
  let vimautoloaddir='~/.config/nvim/autoload'
  " TODO: pip2 install neovim
  " TODO: pip3 install neovim
else
  let vimplugdir='~/.vim/plugged'
  let vimautoloaddir='~/.vim/autoload'
endif

if empty(glob(vimautoloaddir . '/plug.vim'))
  " TODO: else?
  if executable('curl')
    execute 'silent !curl -fLo ' . vimautoloaddir . '/plug.vim --create-dirs ' .
          \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

call plug#begin(vimplugdir)

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

" Highlight briefly every yank text
Plug 'machakann/vim-highlightedyank'

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
Plug 'davidhalter/jedi-vim', {'for': 'py'}
Plug 'tweekmonster/django-plus.vim'

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

" Nerdtree + modifications file explorer
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind']}
augroup nerd_loader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   execute 'autocmd! nerd_loader'
        \| endif
augroup END

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

" Indent line
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
autocmd! User indentLine doautocmd indentLine Syntax

" Dealing with swap files
Plug 'gioele/vim-autoswap'

" Send code to REPL
Plug 'jpalardy/vim-slime'

" Goyo
Plug 'junegunn/goyo.vim'

call plug#end()



" General Configurations
" ======================

syntax on


" Path declarations
" -----------------

let g:vimdir='~/.vim/'

" Create backup directory if not exists
if empty(glob(vimdir . '/backup'))
  if executable('curl')
    execute 'silent !mkdir -p ' . vimdir . 'backup'
  endif
endif

execute 'set backupdir='.g:vimdir.'backup//'
execute 'set directory='.g:vimdir.'swap//'

" Save undo trees in files
set undofile
execute 'set undodir='.g:vimdir.'undo//'

" Session directory
let g:sessions_dir=g:vimdir.'sessions//'

" path to your python
let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python2'


" Filetype
" --------

if exists("g:did_load_filetypes")
  filetype off
  filetype plugin indent off
endif

filetype on
filetype plugin indent on


" True colors setting
" -------------------

set termguicolors
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"


" Colorscheme
" -----------

let g:gruvbox_bold=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_contrast_light="medium"
let g:gruvbox_sign_column='dark0'
let g:gruvbox_color_column="dark0"
let g:gruvbox_vert_split="dark0"
let g:gruvbox_invert_selection=0
let g:gruvbox_invert_signs=0
let g:gruvbox_invert_indent_guides=0
let g:gruvbox_invert_tabline=0
let g:gruvbox_improved_warnings=1
set background=dark

colorscheme gruvbox 

" Change cursor shape based on mode
" ---------------------------------

let &t_SI="\<Esc>[6 q"
let &t_SR="\<Esc>[4 q"
let &t_EI="\<Esc>[2 q"


" Nvim/Vim specific config
" --------------------

if !has('nvim')
    set ttymouse=xterm2

    set termguicolors
    set t_Co=256

    " gruvbox colors
    let g:terminal_ansi_colors=[
	\ '#282828',
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

    " alternative colors
    " let g:terminal_ansi_colors=[
    " \ '#4d5057',
    " \ '#cb817c',
    " \ '#83ac75',
    " \ '#f6e5af',
    " \ '#83afe5',
    " \ '#9a93e1',
    " \ '#80c1ca',
    " \ '#c5c8c6',
    " \ '#4d5057',
    " \ '#da4e4a',
    " \ '#9dcf8d',
    " \ '#ff9a54',
    " \ '#83afe5',
    " \ '#d08ec2',
    " \ '#85def4',
    " \ '#c5c8c6'
    " \ ]
    set t_AB=^[[48;5;%dm
    set t_AF=^[[38;5;%dm
endif

if has('nvim')
    tnoremap <Esc> <C-\><C-n>

    " Show the substitution LIVE
    set inccommand=nosplit
    
    autocmd TermOpen * setlocal nornu nonu
endif


" Undo levels
" -----------

" Number of undo saved in memory
set undolevels=1000  " How many undos
set undoreload=1000  " number of lines to save for undo


" User Interface
" --------------

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
set foldlevelstart=0 " Start with all folds closed

" Set foldtext
set foldtext=FoldText()

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
set showtabline=0

" No resizing if any window closed
set noequalalways

" Show fileinfo on terminal title
set title titlestring=

" Hide tilde on blank line
hi NonText guifg=bg

" Colum coloring
set colorcolumn=88

set updatetime=300

" Always show signcolumns
set signcolumn=yes

" command height
" set cmdheight=2


" Swap setting
" ------------

" No swap file! This is just annoying
"set noswapfile


" Clipboard setting
" -----------------

" The copy goes to the clipboard
set clipboard+=unnamedplus

" Better ex autocompletion
set wildmenu
set wildmode=list:longest,full



" Shell
" -----

set shell=/usr/bin/fish


" Ignored files & folders
" -----------------------

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


" Netrw config
" ------------

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25


" Misc
" ----

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



" Plugins Configurations
" ======================

" Source every plugin configs
for file in split(glob("~/.vim/plugins.vim.d/*.vim"), '\n')
    exe 'source' file
endfor



" Mapping
" =======


" Change Leader
" -------------

" Weird hack for NERDTree to work
let mapLeader="\\"
map <SPACE> <Leader>


" Special Char
" ------------------

" Indent without kill the selection in vmode
vmap < <gv
vmap > >gv

" Execute a macro for the all selection
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<Cr>

" Override search keys
vmap * y/\<<C-r>"\><Cr>
vmap # y?\<<C-r>"\><Cr>
vmap g* y/<C-r>"<Cr>
vmap g# y?<C-r>"<Cr>


" Word keys
" ---------

" Act like D and C
nnoremap Y y$

" Remap the annoying u in visual mode
vmap u y

" Change in next bracket
nmap cinb cib

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Move cursor and respect wrapped line
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Search & Replace
" ''''''''''''''''

" Search and replace
nmap <Leader>m :%s//g<LEFT><LEFT>
vmap <Leader>m :s//g<LEFT><LEFT>

" Search and replace using last search
nmap <expr> <Leader>M ':%s/' . @/ . '//g<LEFT><LEFT>'
vmap <expr> <Leader>M ":s/" . @/ . '//g<LEFT><LEFT>'

nmap <Leader><C-m> :%S//g<LEFT><LEFT>
vmap <Leader><C-m> :S//g<LEFT><LEFT>


" Control
" -------

" Save file
nnoremap <C-s> :update<Cr>
inoremap <C-s> <Esc>:update<Cr>
vnoremap <C-s> <Esc>:update<Cr>

" maximize
nnoremap <C-w>m <C-w>_<C-w><bar>

nnoremap <expr> <C-w>q &buftype ==# 'terminal' ? ":bd!<Cr>" : "<C-w>q"

" Override C-c
imap <C-c> <Esc><C-c>

" Fzf
nnoremap <C-l> :Files<Cr>


" Move Text Shortcut
" ''''''''''''''''''

" This using tpop/unimpaired just move one line on normal mode
nmap <C-S-Up> [e
nmap <C-S-Down> ]e
" Visual mode, when selected
vmap <C-S-Up> [egv
vmap <C-S-Down> ]egv

" TAB
" ---

" Autocompletion with tab
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" Leader
" ------

" MassSetup
" '''''''''

" Setup key [1-9] for moving windows, tab, and buffer
for s:i in range(1, 9)
  " <Leader>[1-9] move to window [1-9]
  execute 'nnoremap <Leader>w' . s:i . ' :' . s:i . 'wincmd w<Cr>'
  " <Leader><leader>[1-9] move to tab [1-9]
  execute 'nnoremap <Leader>t' . s:i . ' ' . s:i . 'gt'
  " <Leader>b[1-9] move to buffer [1-9]
  execute 'nnoremap <Leader>b' . s:i . ' :b' . s:i . '<Cr>'
endfor
unlet s:i

" "'
" ''

" Surround by quotes - frequently use cases of vim-surround
map <Leader>" ysiw"<cr>
map <Leader>' ysiw'<cr>
vmap <Leader>' S'
vmap <Leader>" S"

" A
" '

" Ale
nnoremap <Leader>a <nop>
nnoremap <Leader>af :ALEFirst<Cr>
nnoremap <Leader>an :ALENextWrap<Cr>
nnoremap <Leader>ap :ALEPreviousWrap<Cr>
nnoremap <Leader>al :ALELast<Cr>

" B
" '

nnoremap <Leader>bb :ls<Cr>:b
nmap <Leader>bd :bwipeout<cr>
nmap <Leader>bD :bwipeout!<cr>

" Save as
nnoremap <Leader>bS :sav %:h/

" Edit
nnoremap <Leader>bE :e %:h/

" Show buffer info
nnoremap <Leader>bi 2<C-g>


" C
" '

" Clear trailing whitespace
nnoremap <Leader>cw :call DeleteTrailingWS()<Cr>

" E
" '

nnoremap <silent><Leader>e :NERDTreeToggle<Cr>
nnoremap <silent><Leader>E :NERDTreeFind<Cr>

" F
" '

" Fzf
nnoremap <Leader>fh :History<cr>
nnoremap <Leader>fb :Buffers<cr>
nnoremap <Leader>ff :Files<cr>
nnoremap <Leader>fc :Commands<cr>
nnoremap <Leader>f: :History:<cr>
nnoremap <Leader>f/ :History/<cr>
nnoremap <Leader>fw :Windows<cr>
nnoremap <Leader>fT :Tags<cr>
nnoremap <Leader>ft :BTags<cr>

" Fzf curent file dir
nnoremap <Leader>f. :Files <C-R>=expand('%:h')<Cr><Cr>

" I
" '


" L
" '


" P
" '

" Print root directory
nnoremap <Leader>pr :echo FindRootDirectory()<Cr>

" Paste yanked text on selected text
" the delete selected text to blackhole register
vnoremap <Leader>p "_dP

" R
" '


" S
" '

" T
" '

" Tab
nnoremap <Leader>tn :tabnew<Cr>
nnoremap <Leader>tN :-tabnew<Cr>
nnoremap <Leader>tc :tabc<Cr>
nnoremap <Leader>tt :tabs<Cr>:tab

" Switch to last-active tab
if !exists('g:lasttab')
    let g:lasttab=1
    let g:lasttab_backup=1
endif
autocmd! TabLeave * let g:lasttab_backup=g:lasttab | let g:lasttab=tabpagenr()
autocmd! TabClosed * let g:lasttab=g:lasttab_backup
nmap <Leader>t# :execute "tabn" . g:lasttab<Cr>

" V
" '

" Open nvim config folder, and search for files
nnoremap <Leader>vc :tabnew<Cr>:lcd ~/.vim/plugins.vim.d<Cr>:Files<Cr>
nnoremap <silent><Leader>vC :source $MYVIMRC<Cr>

" Save and load session
if has('gui_running')
    nnoremap <Leader>vs :mksession! ~/.vim/sessions/gui.vim "SaveSession
    nnoremap <Leader>vS :source ~/.vim/sessions/gui.vim "LoadGUISession
else
    nnoremap <Leader>vs :mksession! ~/.vim/sessions/terminal.vim "SaveTerminalSession
    nnoremap <Leader>vS :source ~/.vim/sessions/terminal.vim "LoadTerminalSession
endif

" W
" '

" Location & quickfix window
nnoremap <silent> <Leader>wl :call ToggleList("Location List", 'l')<Cr>
nnoremap <silent> <Leader>wq :call ToggleList("Quickfix List", 'c')<Cr>


" Nvim/Vim spesific mapping
" '''''''''''''''''''''''''

if !has("nvim")
    " On terminal
    tmap <Esc> <C-w>N
endif

" Misc
" ''''

" Override Esc 
tnoremap <Esc> <C-\><C-n>


" Shortcut
" --------

nnoremap <Leader>k <C-w>k
nnoremap <Leader>j <C-w>j
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l

" Keyboard error
" ''''''''''''''

" Command
nmap <Leader>/ <Esc>a;
nmap <Leader>? <Esc>a:

nmap <Leader>@ <Esc>a.
nmap <Leader>^ <Esc>a>

nmap <Leader>\ <Esc>a$
nmap <Leader><bar> <Esc>a~
nmap <Leader>, :



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

" Auto wrap on quickfix
" augroup quickfix
    " autocmd!
    " autocmd FileType qf setlocal wrap
" augroup END

" if has('gui_running')
"     autocmd vimrc buftype terminal nmap <Esc> <C-w>N
" endif

autocmd FileType netrw setl bufhidden=wipe

" Hide highlight search after exit command-line
augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" autocmd BufNewFile,BufRead Justfile set syntax=make

" autocmd vimrc BufWritePre *.py call Isort()
" function Isort()
"     execute 'CocCommand python.sortImports'
"     w
" endfunction

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



" Miscellaneous
" =============

set secure

" Override with local settings file
silent! source .vimlocal
