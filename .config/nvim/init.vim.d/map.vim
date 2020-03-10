" Weird hack for NERDTree to work
let mapLeader="\\"
map <SPACE> <Leader>


" Special Char "

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


" Word keys "

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

" Search & Replace "

" Search and replace
nmap <Leader>m :%s//g<LEFT><LEFT>
vmap <Leader>m :s//g<LEFT><LEFT>

" Search and replace using last search
nmap <expr> <Leader>M ':%s/' . @/ . '//g<LEFT><LEFT>'
vmap <expr> <Leader>M ":s/" . @/ . '//g<LEFT><LEFT>'

nmap <Leader><C-m> :%S//g<LEFT><LEFT>
vmap <Leader><C-m> :S//g<LEFT><LEFT>


" Ctrl/Alt "

" Open nvim config folder, and search for files
nnoremap <silent><M-s> :tabnew<Cr>:lcd ~/.config/nvim/init.vim.d<Cr>:Files<Cr>

" Save file
nnoremap <C-s> :w<Cr>
inoremap <C-s> <Esc>:w<Cr>
vnoremap <C-s> <Esc>:w<Cr>

nnoremap <expr> <C-w>q &buftype ==# 'terminal' ? ":bd!<Cr>" : "<C-w>q"
nnoremap <C-w>Q :qa<Cr>

" Override C-c
inoremap <C-c> <Esc><C-c>
" vnoremap <C-c> <Esc>


" Move Text Shortcut "

" This using tpop/unimpaired just move one line on normal mode
nmap <C-S-Up> [e
nmap <C-S-Down> ]e
" Visual mode, when selected
vmap <C-S-Up> [egv
vmap <C-S-Down> ]egv

nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

imap <C-J> <Esc>o


" Leader "


" Surround by quotes - frequently use cases of vim-surround
map <Leader>" ysiw"<cr>
map <Leader>' ysiw'<cr>
vmap <Leader>' S'
vmap <Leader>" S"

" Ale
nnoremap <Leader>a <nop>
nnoremap <Leader>af :ALEFirst<Cr>
nnoremap <Leader>an :ALENextWrap<Cr>
nnoremap <Leader>ap :ALEPreviousWrap<Cr>
nnoremap <Leader>al :ALELast<Cr>
nnoremap <Leader>aL :ALELint<Cr>

nnoremap <Leader>bb :ls<Cr>:b
nmap <Leader>bd :bwipeout<cr>
nmap <Leader>bD :bwipeout!<cr>

" Save as
nnoremap <Leader>bS :sav %:h/

" Edit
nnoremap <Leader>bE :e %:h/

" Show buffer info
nnoremap <Leader>bi 2<C-g>


" Clear trailing whitespace
nnoremap <Leader>cw :call DeleteTrailingWS()<Cr>

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

" Print root directory
nnoremap <Leader>pr :echo FindRootDirectory()<Cr>

" Paste yanked text on selected text
" the delete selected text to blackhole register
vnoremap <Leader>p "_dP

nmap <leader>rp <Plug>(FerretAck)
nmap <leader>rP <Plug>(FerretAcks)

" Switch to last-active tab
if !exists('g:lasttab')
    let g:lasttab=1
    let g:lasttab_backup=1
endif
autocmd! TabLeave * let g:lasttab_backup=g:lasttab | let g:lasttab=tabpagenr()
autocmd! TabClosed * let g:lasttab=g:lasttab_backup
nmap <Leader>t# :execute "tabn" . g:lasttab<Cr>
nmap <Leader>tn :tabnew<Cr>

" Save and load session
if has('gui_running')
    nnoremap <Leader>vss :mksession! ~/.vim/sessions/gui.vim "SaveSession
    nnoremap <Leader>vls :source ~/.vim/sessions/gui.vim "LoadGUISession
else
    nnoremap <Leader>vss :mksession! ~/.vim/sessions/terminal.vim "SaveTerminalSession
    nnoremap <Leader>vls :source ~/.vim/sessions/terminal.vim "LoadTerminalSession
endif

" Location & quickfix window
nnoremap <silent> <Leader>wl :call ToggleList("Location List", 'l')<Cr>
nnoremap <silent> <Leader>wq :call ToggleList("Quickfix List", 'c')<Cr>


" Nvim spesific mapping "

" On terminal
tmap <Esc> <C-w>N


" Misc "

" Override Esc
tnoremap <Esc> <C-\><C-n>


" Shortcut "

map <Left> :vertical resize -2<Cr>
map <Right> :vertical resize +2<Cr>
map <Up> :resize +2<Cr>
map <Down> :resize -2<Cr>

nmap <C-L> :Files<Cr>
