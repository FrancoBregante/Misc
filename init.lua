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

local modules = {
  -- load plugin manager first
  "plugins._packer",

  -- load modules
  "modules._settings",
  "modules._appearances",
  "modules._util",
  "modules._mappings",
  "modules._statusline",

  -- plugins config
  "plugins._bufferline",
  "plugins._compe",
  "plugins._formatter",
  "plugins._gitsigns",
  "plugins._nvimtree",
  "plugins._snippets",
  "plugins._telescope",
  "plugins._treesitter",
  "plugins._kommentary",


  "modules._others",

   -- lsp stuff
  "modules.lsp"
}

-- highlight bg according to hex/rgb/rgba text
require"colorizer".setup{}

local errors = {}
for _, v in pairs(modules) do
  local ok, err = pcall(require, v)
  if not ok then
    table.insert(errors, err)
  end
end

if not vim.tbl_isempty(errors) then
  for _, v in pairs(errors) do
    print(v)
  end
end

