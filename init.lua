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
require("plugins._packer")

-- load modules
require("modules._settings")
require("modules._others")
require("modules._appearances")
require("modules._util")
require("modules._mappings")
require("modules._statusline")

-- plugins config
require("plugins._nvimtree")
require("plugins._bufferline")
require("plugins._emmet")
-- require("plugins._indentline")
require("plugins._kommentary")
require("plugins._gitsigns")
require("plugins._completion")
require("plugins._telescope")
require("plugins._treesitter")

-- highlight bg according to hex/rgb/rgba text
require"colorizer".setup{}

-- lsp stuff
require("modules.lsp")
