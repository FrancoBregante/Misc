local remap = vim.api.nvim_set_keymap

-- don't load *all* modules
vim.g.loaded_compe_snippets_nvim = 1
vim.g.loaded_compe_spell         = 1
vim.g.loaded_compe_tags          = 1
vim.g.loaded_compe_treesitter    = 1
vim.g.loaded_compe_emoji         = 1
vim.g.loaded_compe_omni          = 1
vim.g.loaded_compe_vsnip         = 1
vim.g.loaded_compe_ultisnips     = 1
vim.g.loaded_compe_vim_lsc       = 1

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
    nvim_lua = true,
    nvim_lsp = {
      enable = true,
      priority = 10001, -- takes precedence over file completion
    },
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
