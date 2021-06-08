vim.cmd([[packadd nvim-lspconfig]])

local lspconfig = require("lspconfig")

-- override handlers
pcall(require, "modules.lsp._handlers")

-- specific language server configuration
pcall(require, "modules.lsp._sumneko")
pcall(require, "modules.lsp._flutter")
pcall(require, "modules.lsp._rust")

local custom_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  return capabilities
end

local servers = {
  tsserver = require("modules.lsp._tsserver").config,
  -- rust_analyzer = {},
  --[[ denols = {
    filetypes = { "javascript", "typescript", "typescriptreact" },
    root_dir = vim.loop.cwd,
    settings = {
      documentFormatting = true
    }
  }, ]]
  jsonls = {
    cmd = { "vscode-json-languageserver", "--stdio" },
    filetypes = { "json", "jsonc" },
    root_dir = vim.loop.cwd,
  },
  html = { cmd = { "html-languageserver", "--stdio" } },
  cssls = { cmd = { "css-languageserver", "--stdio" } },
  clangd = {},
  gopls = {},
  solargraph = {
    cmd = {"solargraph", "stdio"},
    filetypes = { "ruby" },
    root_dir = vim.loop.cwd,
    settings = {
      solargraph = {
        diagnostics = true,
        logLevel = "debug",
        transport = "stdio",
      },
    },
  },
  pyright = {},
  svelte = {
    on_attach = function(client)
      require("modules.lsp._mappings").lsp_mappings()
      require("modules.lsp._tsserver").ts_utils(client)
      require("null-ls").setup {}

      client.server_capabilities.completionProvider.triggerCharacters = {
        ".", '"', "'", "`", "/", "@", "*",
        "#", "$", "+", "^", "(", "[", "-", ":"
      }
    end,
    on_init = Util.lsp_on_init,
    filetypes = { "svelte" },
    settings = {
      svelte = {
        plugin = {
          html = { completions = { enable = true, emmet = false } },
          svelte = { completions = { enable = true, emmet = false } },
          css = { completions = { enable = true, emmet = true } },
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  local client = lspconfig[name]
  if opts.extra_setup then
    opts.extra_setup()
  end
  client.setup({
    cmd = opts.cmd or client.cmd,
    filetypes = opts.filetypes or client.filetypes,
    on_attach = opts.on_attach or Util.lsp_on_attach,
    on_init = opts.on_init or Util.lsp_on_init,
    handlers = opts.handlers or client.handlers,
    root_dir = opts.root_dir or client.root_dir,
    capabilities = opts.capabilities or custom_capabilities(),
    settings = opts.settings or {},
  })
end
