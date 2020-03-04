let g:lightline = {
    \   'active': {
    \     'left':[ [ 'mode', 'paste' ],
    \              [ 'gitbranch', 'readonly', 'relativepath', 'modified', 'tagbar']
    \     ],
    \     'right':[ ['lineinfo', 'percent'],
    \               ['linter_checking', 'linter_errors', 'linter_warnings', 'cocstatus' ]
    \     ],
    \   },
    \   'component': {
    \     'tagbar': '%{tagbar#currenttag("%s", "", "f")}',
    \     'lineinfo': ' %2l:%-1v',
    \     'relativepath': '%<%f',
    \   },
    \   'component_function': {
    \     'readonly': 'LightlineReadonly',
    \     'gitbranch': 'LightlineFugitiveHead',
    \     'cocstatus': 'LightlineCocStatus',
    \   }
    \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

if &background ==# 'dark'
    let g:lightline.colorscheme = 'gruvbox'
else
    let g:lightline.colorscheme = 'solarized'
endif

" Theme
" let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
" let s:color = [['#7c6f64', '#303030', 'NONE', 'NONE']]
" let s:palette.normal.middle = s:color
" let s:palette.insert.middle = s:color
" let s:palette.visual.middle = s:color
" let s:inactive_color = [['#7c6f64', 'NONE', 'NONE', 'NONE']]
" let s:palette.inactive.left = s:inactive_color
" let s:palette.inactive.midle = s:inactive_color
" let s:palette.inactive.right = s:inactive_color

function! PopulateTab()
    return '⇄ '.tabpagenr().'/'.tabpagenr('$')
endfunction

function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction

let g:minwidth = 120

function! LightlineFugitiveHead() abort
    if (winwidth(0) > g:minwidth)
        if exists('*FugitiveHead')
            let branch = FugitiveHead()
            return branch !=# '' ? '⽊ '.branch : ''
        endif
    endif
    return ''
endfunction

function! LightlineCocStatus() abort
    if (winwidth(0) > g:minwidth)
        return coc#status()
    endif
    return ''
endfunction

let g:lightline.separator = {
    \   'left': "\ue0b4", 'right': "\ue0b6"
    \ }

" let g:lightline.separator = {
"     \   'left': '', 'right': ''
"     \ }
"
" let g:lightline.subseparator = {
"     \   'left': '', 'right': ''
"     \ }

" let g:lightline.separator = {
"     \   'left': '', 'right': ''
"     \ }

let g:lightline.subseparator = {
    \   'left': '', 'right': ''
    \ }

let g:lightline.tabline_separator = {
    \   'left': "\ue0b4", 'right': "\ue0b6"
    \ }

if !has("gui_running")
    let g:lightline.tabline = {
        \ 'left': [ [ 'tabs' ] ],
        \ 'right': [ [ 'close' ] ] }
endif

let g:lightline.mode_map = {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'VL',
    \ "\<C-v>": 'VB',
    \ 'c' : 'C',
    \ 's' : 'S',
    \ 'S' : 'SL',
    \ "\<C-s>": 'SB',
    \ 't': 'T',
    \ }
