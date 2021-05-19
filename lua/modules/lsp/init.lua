vim.cmd [[packadd nvim-lspconfig]]

local nvim_lsp = require("lspconfig")
local is_cfg_present = require("modules._util").is_cfg_present

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

-- use eslint if the eslint config file present
local is_using_eslint = function(_, _, result, client_id)
  if
    is_cfg_present("/.eslintrc.json")
    or is_cfg_present("/.eslintrc.js")
    or is_cfg_present("/.eslintrc.cjs")
  then
    return
  end

  return vim.lsp.handlers["textDocument/publishDiagnostics"](_, _, result, client_id)
end

local ts_utils = function(client)
  local ts_utils = require("nvim-lsp-ts-utils")
  ts_utils.setup {
    eslint_bin = "eslint_d",
    eslint_args = {"-f", "json", "--stdin", "--stdin-filename", "$FILENAME"},
    eslint_enable_disable_comments = true,
    eslint_enable_diagnostics = true,
    eslint_diagnostics_debounce = 250,
  }
  ts_utils.setup_client(client)
end

local servers = {
  tsserver = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    init_options = {
      documentFormatting = false,
    },
    handlers = {
      ["textDocument/publishDiagnostics"] = is_using_eslint,
    },
    on_init = Util.lsp_on_init,
    on_attach = function(client)
      require("modules.lsp._mappings").lsp_mappings()
      ts_utils(client)
    end,
    root_dir = vim.loop.cwd,
  },
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
    root_dir = vim.loop.cwd
  },
  html = { cmd = { "vscode-html-language-server", "--stdio" } },
  cssls = { cmd = { "vscode-css-language-server", "--stdio" } },
  clangd = {},
  solargraph = {
    cmd = {"solargraph", "stdio"},
    filetypes = { "ruby" },
    root_dir = vim.loop.cwd,
    settings = {
      solargraph = {
        -- commandPath = "/home/francisl/.local/share/gem/ruby/3.0.0/bin/solargraph",
        diagnostics = true,
        logLevel = "debug",
        transport = "stdio",
      },
    },
  },
  pyright = {
    root_dir = vim.loop.cwd
  },
  gopls = {
    root_dir = vim.loop.cwd,
  },
  svelte = {
    on_attach = function(client)
      require("modules.lsp._mappings").lsp_mappings()
      ts_utils(client)

      client.server_capabilities.completionProvider.triggerCharacters = {
        ".", '"', "'", "`", "/", "@", "*",
        "#", "$", "+", "^", "(", "[", "-", ":"
      }
    end,
    handlers = {
      ["textDocument/publishDiagnostics"] = is_using_eslint,
    },
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
  local client = nvim_lsp[name]
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
