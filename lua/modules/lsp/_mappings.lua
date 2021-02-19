local remap = vim.api.nvim_set_keymap
local M = {}

-- local provider = require"lspsaga.provider"
local hover = require"lspsaga.hover"
local codeaction = require"lspsaga.codeaction"
local sig_help = require"lspsaga.signaturehelp"
local rename = require"lspsaga.rename"
local diagnostic = require"lspsaga.diagnostic"
local provider = require"lspsaga.provider"

M.lsp_mappings = function()
  remap('i', '<C-s>', '<cmd>lua require"lspsaga.signaturehelp".signature_help()<CR>', { noremap = true, silent = true })
  remap('n', 'K', '<cmd>lua require"lspsaga.hover".render_hover_doc()<CR>', { noremap = true, silent = true })
  remap('n', 'ga', '<cmd>lua require"lspsaga.codeaction".code_action()<CR>', { noremap = true, silent = true })
  remap('n', 'gd', '<cmd>lua require"lspsaga.provider".preview_definition()<CR>', { noremap = true, silent = true })
  remap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
  remap('n', 'gD', '<cmd>lua require"lspsaga.diagnostic".show_line_diagnostics()<CR>', { noremap = true, silent = true })
  remap('n', 'gr', '<cmd>lua require"telescope.builtin".lsp_references()<CR>', { noremap = true, silent = true })
  remap('n', 'gR', '<cmd>lua require"lspsaga.rename".rename()<CR>', { noremap = true, silent = true })
  remap('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
  remap('n', '<Leader>dn', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next()<CR>', { noremap = true, silent = true })
  remap('n', '<Leader>dN', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()<CR>', { noremap = true, silent = true })
end

return M
