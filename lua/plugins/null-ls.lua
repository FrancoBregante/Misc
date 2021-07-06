local M = {}

M.plugin = {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    require("plugins.null-ls").config()
  end,
}

M.config = function()
  local null_ls = require "null-ls"
  local h = require "null-ls.helpers"
  local m = null_ls.methods
  local b = null_ls.builtins

  vim.env.PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath "config" .. "/.prettierrc"

  local gofumpt = h.make_builtin {
    method = m.FORMATTING,
    filetypes = { "go" },
    generator_opts = {
      command = "gofumpt",
      to_stdin = true,
    },
    factory = h.formatter_factory,
  }

  local sources = {
    gofumpt,
    b.formatting.shfmt.with {
      args = { "-i", "2" },
    },
    b.formatting.stylua.with {
      args = {
        "--config-path",
        vim.fn.stdpath "config" .. "stylua.toml",
        "-",
      },
    },
    b.formatting.prettierd.with {
      filetypes = {
        "typescriptreact",
        "typescript",
        "javascriptreact",
        "javascript",
        "svelte",
        "json",
        "jsonc",
        "css",
        "html",
      },
    },
  }

  null_ls.setup {
    sources = sources,
  }
end

return M
