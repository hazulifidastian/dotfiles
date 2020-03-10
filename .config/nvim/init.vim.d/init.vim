execute 'source' fnamemodify(expand('<sfile>'), ':h') . '/lib.vim'

let config_dir =  '~/.config/nvim'
let plugged_dir = config_dir . '/plugged'
let autoload_dir = config_dir . '/autoload'

execute 'source' fnamemodify(expand('<sfile>'), ':h') . '/plugins.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h') . '/gen.vim'

" Specific Plugins Configurations
let pluginsd_dir = '~/.config/nvim/init.vim.d/plugins.d/*.vim'
for config_file in split(glob(pluginsd_dir), '\n')
    execute 'source'  config_file
endfor

execute 'source' fnamemodify(expand('<sfile>'), ':h') . '/map.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h') . '/au.vim'

" Misc
set secure

" Override with local settings file
if filereadable(".vimlocal")
  source .vimlocal 
endif
