local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

packer.init({
  transitive_opt = false,
  git = {
    clone_timeout = 300,
  },
  display = {
    open_fn = function()
      return require("packer.util").float { border = Util.borders }
    end,
  },
})

local plugins = {
  { "wbthomason/packer.nvim" },

  require("plugins.compe").plugin,
  require("plugins.gitsigns").plugin,
  require("plugins.null-ls").plugin,
  require("plugins.nvim-bufferline").plugin,
  require("plugins.nvim-jdtls").plugin,
  require("plugins.nvim-lspconfig").plugin,
  require("plugins.nvim-tree").plugin,
  require("plugins.rest-nvim").plugin,
  require("plugins.rust-tools").plugin,
  require("plugins.flutter-tools").plugin,
  require("plugins.telescope").plugin,
  require("plugins.treesitter").plugin,
  require("plugins.tsserver").plugin,
  require("plugins.which-key").plugin,

  {
    "folke/tokyonight.nvim",
    opt = false,
    config = function()
      vim.cmd [[colorscheme tokyonight]]
      vim.g.tokyonight_style = "night"
    end
  },

  {
    "plasticboy/vim-markdown",
    filetype = { "markdown" },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_frontmatter = 1
    end,
  },

  {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = function()
      require("colorizer").setup {
        ["*"] = {
          css = true,
          css_fn = true,
          mode = "background",
        },
      }
    end,
  },

  {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup { default = true }
    end,
    requires = {
      -- requires nonicons font installed
      { "yamatsum/nvim-nonicons", after = "nvim-web-devicons" },
    },
  },

  { "sindrets/diffview.nvim" },

  {
    "TimUntersberger/neogit",
    config = function()
      require("neogit").setup {
        disable_signs = false,
        disable_context_highlighting = true,
        signs = {
          -- { CLOSED, OPENED }
          section = { "", "" },
          item = { "+", "-" },
          hunk = { "", "" },
        },
        integrations = {
          diffview = true,
        },
      }
    end,
    requires = {
      "sindrets/diffview.nvim",
    },
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "modules.dap"
    end,
  },

  { "tami5/sql.nvim" },

  {
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_quickfix_enabled = false
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "--shell-escape",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
    end,
  },

  { "tpope/vim-commentary", keys = "gc" },

  {
    "mattn/emmet-vim",
    config = function()
      vim.g.user_emmet_install_global = 0
      vim.g.user_emmet_leader_key = ","
    end,
  },

  { "junegunn/vim-easy-align", keys = "<Plug>(EasyAlign)" },

  {
    "phaazon/hop.nvim",
    cmd = "HopWord",
    setup = function()
      vim.api.nvim_set_keymap(
        "n",
        "<Leader>w",
        "<CMD>HopWord<CR>",
        { noremap = true }
      )
    end,
    config = function()
      require("hop").setup {}
    end,
  },

  { "AndrewRadev/splitjoin.vim", keys = "gS" },

  { "dhruvasagar/vim-table-mode", ft = { "text", "markdown" } },

  { "machakann/vim-sandwich", keys = "s" },

  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    setup = function()
      vim.g.matchup_matchparen_offscreen = {
        method = "popup",
        fullwidth = true,
        highlight = "Normal",
      }
    end,
  },

  { "mhinz/vim-sayonara", cmd = "Sayonara" },

  { "tpope/vim-surround" },
  { "ruby-formatter/rufo-vim" },
  { "thoughtbot/vim-rspec" },
  { "MTDL9/vim-log-highlighting" },
  require("plugins.lualine").plugin,
}

packer.startup(function(use)
  for _, v in pairs(plugins) do
    use(v)
  end
end)
