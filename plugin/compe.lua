local remap = vim.api.nvim_set_keymap

require("compe").setup {
  enabled              = true,
  debug                = false,
  min_length           = 2,
  preselect            = "disable",
  source_timeout       = 200,
  incomplete_delay     = 400,
  throttle_time        = 200,
  allow_prefix_unmatch = true,

  source = {
    path     = true,
    buffer   = true,
    luasnip  = true,
    nvim_lua = true,
    nvim_lsp = {
      enable = true,
      priority = 10001, -- takes precedence over file completion
    },
  },
}

remap(
  "i",
  "<Tab>",
  table.concat {
    'pumvisible() ? "<C-n>" : v:lua.Util.check_backspace()',
    '? "<Tab>" : compe#confirm()',
  },
  { silent = true, noremap = true, expr = true }
)

remap(
  "i",
  "<S-Tab>",
  'pumvisible() ? "<C-p>" : "<S-Tab>"',
  { noremap = true, expr = true }
)

remap(
  "i",
  "<CR>",
  "v:lua.Util.trigger_completion()",
  { noremap = true, expr = true }
)

remap(
  "i",
  "<C-Space>",
  "compe#complete()",
  { noremap = true, expr = true, silent = true }
)
