local g = vim.g

-- map leader key to space
g.mapleader = " "
g.maplocalleader = " "

-- disable builtin plugins I don't use
g.loaded_2html_plugin = 1
g.loaded_netrw        = 1
g.loaded_netrwPlugin  = 1
g.loaded_matchit      = 1
g.loaded_matchparen   = 1
g.loaded_spec         = 1

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
  "plugins._packer",

  "modules._settings",
  "modules._appearances",
  "modules._util",
  "modules._mappings",
  "modules._statusline",

   -- lsp stuff
  "modules.lsp"
}

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
