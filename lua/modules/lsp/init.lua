vim.cmd[[packadd nvim-lspconfig]]
vim.cmd[[packadd lspsaga.nvim]]

local nvim_lsp = require("lspconfig")
local mappings = require("modules.lsp._mappings")
local is_cfg_present = require("modules._util").is_cfg_present

require("modules.lsp._diagnostic") -- diagnostic stuff

require"lspsaga".init_lsp_saga({
  border_style = 1,
}) -- initialise lspsaga UI

local custom_on_attach = function(client)
  mappings.lsp_mappings()

  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end
end

local custom_on_init = function()
  print("Language Server Protocol started!")
end

local custom_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true;

  return capabilities
end

nvim_lsp.tsserver.setup{
  filetypes = { 'javascript', 'typescript', 'typescriptreact' },
  on_attach = function(client)
    mappings.lsp_mappings()

    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
  end,
  on_init = custom_on_init,
  root_dir = vim.loop.cwd,
}

nvim_lsp.html.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init
}

nvim_lsp.cssls.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init
}

nvim_lsp.rust_analyzer.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
}

nvim_lsp.clangd.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init
}

local system_name = "Linux"
local sumneko_root_path = '/home/francisl/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

nvim_lsp.sumneko_lua.setup{
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT", path = vim.split(package.path, ';'), },
      completion = { keywordSnippet = "Disable" },
      diagnostics = {
        enable = true,
        globals = {
          "vim", "describe", "it", "before_each", "after_each",
          "awesome", "theme", "client"
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
      },
    }
  }
}

nvim_lsp.solargraph.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  settings = {
    solargraph = {
      autoformat = true,
      completion = true,
      commandPath = '/home/francob/.gem/ruby/2.7.0/bin/solargraph',
      diagnostics = true
    },
  },
}


nvim_lsp.pyright.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
}


nvim_lsp.pyls_ms.setup{
  cmd = { "dotnet", "exec", "/home/francisl/python-language-server/output/bin/Debug/Microsoft.Python.LanguageServer.dll" },
  on_attach = custom_on_attach,
  on_init = custom_on_init,
}

