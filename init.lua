vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.python3_host_prog = "/usr/bin/python"

-- prevent typo when pressing `wq` or `q`
vim.cmd[[
  cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
  cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
  cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
  cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
]]

-- highlight yanked text for 250ms
vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank { timeout = 250, higroup = "OnYank" }]]

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

