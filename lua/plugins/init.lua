vim.cmd [[ packadd packer.nvim ]]

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

packer.init({
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
  { "wbthomason/packer.nvim", opt = true },

  require("plugins.compe").plugin,
  require("plugins.gitsigns").plugin,
  require("plugins.null-ls").plugin,
  require("plugins.nvim-bufferline").plugin,
  require("plugins.nvim-jdtls").plugin,
  require("plugins.nvim-tree").plugin,
  require("plugins.rest-nvim").plugin,
  require("plugins.rust-tools").plugin,
  require("plugins.flutter-tools").plugin,
  require("plugins.telescope").plugin,
  require("plugins.treesitter").plugin,
  require("plugins.tsserver").plugin,
  require("plugins.which-key").plugin,

  { "nvim-lua/plenary.nvim" },

  { "nvim-lua/popup.nvim" },

  {
    "folke/tokyonight.nvim",
    opt = false,
    config = function()
      vim.cmd [[colorscheme tokyonight]]
      vim.g.tokyonight_style = "night"
    end
  },

  {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    config = function()
      require "modules.lsp"
    end,
  },

  {
    "plasticboy/vim-markdown",
    filetype = "markdown",
    setup = function()
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
    cmd = "Neogit",
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
      {
        "sindrets/diffview.nvim",
        after = "neogit",
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    keys = "<Leader>d",
    config = function()
      require "modules.dap"
    end,
  },

  {
    "lervag/vimtex",
    setup = function()
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
    "mapkts/enwise",
    event = "BufRead",
    setup = function()
      vim.g.enwise_enable_globally = 1
    end
  },

  {
    "mattn/emmet-vim",
    setup = function()
      vim.g.user_emmet_install_global = 0
      vim.g.user_emmet_leader_key = ","
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup {
        window = {
          backdrop = 1,
          width = 80, -- width of the Zen window
          height = 32, -- height of the Zen window
          linebreak = true,
          wrap = true,
        },
        plugins = {
          options = {
            enabled = true,
            ruler = false,
            showcmd = false,
          },
          gitsigns = { enabled = true }, -- disables git signs
          tmux = { enabled = false }, -- disables the tmux statusline
        },
        on_open = function(win)
          vim.api.nvim_win_set_option(win, "wrap", true)
          vim.api.nvim_win_set_option(win, "linebreak", true)
        end,
      }
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

  require("plugins.lualine").plugin,
  {
    "ruby-formatter/rufo-vim",
    cmd = "Rufo",
  },
  {
    "thoughtbot/vim-rspec",
    keys = "<Leader>rt",
  },
  {
    "MTDL9/vim-log-highlighting",
    ft = "log",
  },
}

packer.startup(function(use)
  for _, v in pairs(plugins) do
    use(v)
  end
end)
