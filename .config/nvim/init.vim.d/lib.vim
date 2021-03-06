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
    endfor
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
