vim.cmd [[packadd nvim-compe]]
local remap = vim.api.nvim_set_keymap

vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets"

-- don't load *all* modules
vim.g.loaded_compe_snippets_nvim = true
vim.g.loaded_compe_spell = true
vim.g.loaded_compe_tags = true
vim.g.loaded_compe_treesitter = true
vim.g.loaded_compe_emoji = true
vim.g.loaded_compe_omni = true
vim.g.loaded_compe_vsnip = true
vim.g.loaded_compe_ultisnips = true
vim.g.loaded_compe_vim_lsc = true
require("compe").setup({
  enabled              = true,
  debug                = false,
  min_length           = 2,
  preselect            = "disable",
  source_timeout       = 200,
  incomplete_delay     = 400,
  allow_prefix_unmatch = false,

  source = {
    path     = true,
    calc     = true,
    buffer   = true,
    luasnip  = true,
    nvim_lsp = true,
    nvim_lua = true,
  },
})

remap(
  "i",
  "<CR>",
  "v:lua.Util.trigger_completion()",
  { expr = true, silent = true }
)
remap(
  "i",
  "<Tab>",
  table.concat({
    "pumvisible() ? \"<C-n>\" : v:lua.Util.check_backspace()",
    "? \"<Tab>\" : compe#confirm()",
  }),
  { silent = true, noremap = true, expr = true }
)

remap(
  "i",
  "<S-Tab>",
  "pumvisible() ? \"<C-p>\" : \"<S-Tab>\"",
  { noremap = true, expr = true }
)
remap(
  "i",
  "<C-Space>",
  "compe#complete()",
  { noremap = true, expr = true, silent = true }
)
