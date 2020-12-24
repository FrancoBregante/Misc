vim.cmd[[packadd nvim-treesitter]]
vim.cmd[[packadd playground]]

local ts_config = require("nvim-treesitter.configs")
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

ts_config.setup {
  ensure_installed = {
    "typescript",
    "javascript",
    "jsdoc",
    "html",
    "css",
    "php",
    "rust",
    "tsx",
    "cpp",
    "python",
    "lua",
    "yaml",
    "toml",
    "go",
  },

  highlight = {
    enable = true,
    -- disable = { 'svelte' },
    use_languagetree = true,
  },

  indent = {
    enable = true
  },
}
