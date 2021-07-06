local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

packer.init({
  compile_path = vim.fn.stdpath "data"
    .. "/site/pack/loader/start/packer.nvim/plugin/packer_compiled.lua",
  git = {
    clone_timeout = 100,
  },
  display = {
    open_fn = function()
      return require("packer.util").float { border = Util.borders }
    end,
  },
})

local plugins = {
  { "wbthomason/packer.nvim", opt = false },

  require("plugins.null-ls").plugin,
  require("plugins.nvim-jdtls").plugin,
  require("plugins.rust-tools").plugin,
  require("plugins.flutter-tools").plugin,
  require("plugins.telescope").plugin,
  require("plugins.treesitter").plugin,
  require("plugins.tsserver").plugin,

  { "tpope/vim-commentary", keys = "gc" },

  {
    "junegunn/vim-easy-align",
    setup = function()
      vim.api.nvim_set_keymap(
        "x",
        "ga",
        "<Plug>(EasyAlign)",
        { noremap = false, silent = true }
      )
    end,
    keys = "<Plug>(EasyAlign)",
  },

  { "AndrewRadev/splitjoin.vim", keys = "gS" },

  { "dhruvasagar/vim-table-mode", ft = { "text", "markdown" } },

  { "machakann/vim-sandwich", keys = "s" },

  {
    "mhinz/vim-sayonara",
    cmd = "Sayonara",
    setup = function()
      local map = function(lhs, rhs)
        vim.api.nvim_set_keymap("", lhs, rhs, { noremap = true, silent = true })
      end
      map("<A-j>", "<CMD>Sayonara!<CR>")
      map("<A-k>", "<CMD>Sayonara<CR>")
    end,
  },

  {
    "nvim-lua/plenary.nvim",
    module = "plenary",
  },

  {
    "nvim-lua/popup.nvim",
    module = "popup",
  },

  {
    "folke/tokyonight.nvim",
    opt = false,
    config = function()
      vim.cmd [[colorscheme tokyonight]]
      vim.g.tokyonight_style = "night"
    end
  },

  {
    "folke/which-key.nvim",
    config = function()
      require "plugins.which-key"
    end,
  },

  {
    "NTBBloodbath/rest.nvim",
    keys = "<Plug>RestNvim",
    setup = function()
      vim.api.nvim_set_keymap(
        "n",
        "<Leader>rr",
        "<Plug>RestNvim",
        { noremap = false }
      )
    end,
  },

  {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = function()
      require "plugins.nvim-tree"
    end,
  },

  {
    "hrsh7th/nvim-compe",
    event = "InsertEnter",
    wants = "LuaSnip",
    config = function()
      require "plugins.compe"
    end,
    requires = {
      {
        "L3MON4D3/LuaSnip",
        opt = true,
        config = function()
          require "plugins.luasnip"
        end,
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    wants = {
      "plenary.nvim",
    },
    event = "BufRead",
    config = function()
      require "plugins.gitsigns"
    end,
  },

  {
    "akinsho/nvim-bufferline.lua",
    config = function()
      require "plugins.nvim-bufferline"
    end,
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
    setup = function()
      vim.api.nvim_set_keymap(
        "n",
        "<Leader>c",
        "<CMD>ColorizerToggle<CR>",
        { noremap = true, silent = true }
      )
    end,
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
    module = "nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup { default = true }
    end,
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
      "sindrets/diffview.nvim",
      cmd = { "DiffViewOpen" },
      module = "diffview",
    },
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

  {
    "mfussenegger/nvim-dap",
    keys = "<Leader>d",
    config = function()
      require "modules.dap"
    end,
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

  {
    "andymass/vim-matchup",
    event = "BufRead",
    setup = function()
      vim.g.matchup_matchparen_offscreen = {
        method = "popup",
        fullwidth = true,
        highlight = "Normal",
      }
    end,
  },

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
  {
    "TovarishFin/vim-solidity",
    ft = "sol",
  },
}

packer.startup(function(use)
  for _, v in pairs(plugins) do
    use(v)
  end
end)
