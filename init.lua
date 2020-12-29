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

-- basic settings
require("modules._settings")
require("modules._others")
require("modules._appearances")
require("modules._util")

-- plugins config
require("plugins._luatree")
require("plugins._bufferline")
require("plugins._emmet")
require("plugins._indentline")
require("plugins._gitsigns")
require("plugins._completion")
require("plugins._telescope")

-- highlight bg according to hex/rgb/rgba text
require"colorizer".setup{}

-- load modules
require("modules._mappings")
require("modules._statusline")

-- lsp stuff
require("modules.lsp")

require("plugins._treesitter")

