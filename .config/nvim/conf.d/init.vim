execute 'source' fnamemodify(expand('<sfile>'), ':h') . '/lib.vim'

let config_dir =  '~/.config/nvim'
let plugged_dir = config_dir . '/plugged'
let autoload_dir = config_dir . '/autoload'

if empty(glob(autoload_dir . '/plug.vim'))
  if executable('curl')
    execute 'silent !curl -fLo ' . autoload_dir . '/plug.vim --create-dirs ' .
          \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

execute 'source' fnamemodify(expand('<sfile>'), ':h') . '/plugins.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h') . '/gen.vim'

" Specific Plugins Configurations
let pluginsd_dir = '~/.config/nvim/conf.d/plugins.d/*.vim'
for config_file in split(glob(pluginsd_dir), '\n')
    execute 'source'  config_file
endfor

execute 'source' fnamemodify(expand('<sfile>'), ':h') . '/map.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h') . '/au.vim'

" Misc
set secure

" Override with local settings file
silent! source .vimlocal
