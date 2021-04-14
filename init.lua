vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- prevent typo when pressing `wq` or `q`
vim.cmd[[
  cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
  cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
  cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
  cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
]]

-- change cwd to current directory
vim.cmd("cd %:p:h")

-- load plugin manager first
pcall(require, "plugins._packer")

-- load modules
pcall(require, "modules._settings")
pcall(require, "modules._appearances")
pcall(require, "modules._util")
pcall(require, "modules._mappings")
pcall(require, "modules._statusline")
pcall(require, "modules._others")

-- plugins config
pcall(require, "plugins._bufferline")
pcall(require, "plugins._compe")
-- pcall(require, "plugins._emmet")
pcall(require, "plugins._formatter")
pcall(require, "plugins._gitsigns")
pcall(require, "plugins._nvimtree")
-- pcall(require, "plugins._snippets")
pcall(require, "plugins._telescope")
pcall(require, "plugins._treesitter")
pcall(require, "plugins._kommentary")

-- highlight bg according to hex/rgb/rgba text
require"colorizer".setup{}

-- lsp stuff
pcall(require, "modules.lsp")
