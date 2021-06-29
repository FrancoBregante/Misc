let install_path = stdpath("data") . "/site/pack/packer/start/packer.nvim"
if empty(glob(install_path)) > 0
  execute printf("!git clone https://github.com/wbthomason/packer.nvim %s", install_path)
  packadd packer.nvim
endif

let g:mapleader = " "
let g:maplocalleader = " "

let g:loaded_gzip         = 1
let g:loaded_tar          = 1
let g:loaded_tarPlugin    = 1
let g:loaded_zipPlugin    = 1
let g:loaded_2html_plugin = 1
let g:loaded_netrw        = 1
let g:loaded_netrwPlugin  = 1
let g:loaded_matchit      = 1
let g:loaded_matchparen   = 1
let g:loaded_spec         = 1

runtime! lua/modules/keymap.lua
runtime! lua/modules/options.lua
runtime! lua/modules/util.lua
runtime! lua/modules/mappings.lua
runtime! lua/plugins/init.lua
