local lspconfig = require "lspconfig"

-- override handlers
pcall(require, "modules.lsp.handlers")

local custom_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

local servers = {
  -- denols = {
  --   filetypes = { "javascript", "typescript", "typescriptreact" },
  --   root_dir = vim.loop.cwd,
  --   settings = {
  --     documentFormatting = true,
  --   },
  -- },
  sumneko_lua = require("modules.lsp.sumneko").config,
  jsonls = require("modules.lsp.json").config,
  svelte = require("modules.lsp.svelte").config,
  html = { cmd = { "html-languageserver", "--stdio" } },
  cssls = { cmd = { "css-languageserver", "--stdio" } },
  clangd = {},
  gopls = {},
  solargraph = {
    root_dir = vim.loop.cwd,
    settings = {
      solargraph = {
        diagnostic = true,
        logLevel = "debug",
        transport = "stdio",
      },
    },
  },
  pyright = {},
  texlab = {},
  angularls = {},
}

for name, opts in pairs(servers) do
  if type(opts) == "function" then
    opts()
  else
    local client = lspconfig[name]
    client.setup {
      cmd = opts.cmd or client.cmd,
      filetypes = opts.filetypes or client.filetypes,
      on_attach = opts.on_attach or Util.lsp_on_attach,
      on_init = opts.on_init or Util.lsp_on_init,
      handlers = opts.handlers or client.handlers,
      root_dir = opts.root_dir or client.root_dir,
      capabilities = opts.capabilities or custom_capabilities(),
      settings = opts.settings or {},
    }
  end
end
