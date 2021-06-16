local fn = vim.fn
local install_path = fn.stdpath "data"  .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system {
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  vim.cmd([[packadd packer.nvim]])
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

local use = packer.use

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

local plugins = function()
  use { "wbthomason/packer.nvim", opt = true }

  use {
    "folke/tokyonight.nvim",
    opt = false,
    requires = { "rktjmp/lush.nvim" },
  }

  use {
    "plasticboy/vim-markdown",
    opt = true,
    filetype = { "markdown" },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_frontmatter = 1
    end,
  }

  use {
    "norcalli/nvim-colorizer.lua",
    opt = true,
    ft = {
      "lua",
      "html",
      "css",
      "typescript",
      "javascript",
      "svelte",
      "vim",
    },
    config = function()
      require("colorizer").setup({
        ["*"] = {
          css = true,
          css_fn = true,
          mode = "background",
        },
      })
    end,
  }

  use { "folke/which-key.nvim", opt = false }

  use {
    "nvim-treesitter/nvim-treesitter",
    opt = false,
    requires = {
      {
        "nvim-treesitter/playground",
        opt = true,
        cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
      },
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
  }

  use {
    'yamatsum/nvim-nonicons',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use { "kyazdani42/nvim-tree.lua", opt = false }

  use { "akinsho/nvim-bufferline.lua", opt = false }

  use {
    "sindrets/diffview.nvim",
    opt = true,
    cmd = { "DiffViewOpen" },
  }

  use { "lewis6991/gitsigns.nvim", opt = false }

  use {
    "TimUntersberger/neogit",
    opt = false,
    config = function()
      require("neogit").setup({
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
      })
    end,
  }

  use { "neovim/nvim-lspconfig", opt = false }

  use {
    "mfussenegger/nvim-dap",
    opt = false,
    config = function() require("modules.dap") end
  }

  use { "akinsho/flutter-tools.nvim", opt = false }

  use { "simrat39/rust-tools.nvim", opt = false }

  use { "ray-x/lsp_signature.nvim", opt = false }

  use { "jose-elias-alvarez/nvim-lsp-ts-utils", opt = false }

  use { "jose-elias-alvarez/null-ls.nvim", opt = false }

  use { "mfussenegger/nvim-jdtls", opt = false }

  use {
    "hrsh7th/nvim-compe",
    opt = false,
    requires = {
      { "L3MON4D3/LuaSnip" },
    },
  }

  use {
    "nvim-telescope/telescope.nvim",
    opt = false,
    config = function()
      require("modules._telescope")
    end,
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-media-files.nvim" },
      { "nvim-telescope/telescope-frecency.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { "nvim-telescope/telescope-dap.nvim" },
    },
  }

  use { "tami5/sql.nvim", opt = false }

  use { "editorconfig/editorconfig-vim", opt = false }

  use {
    "lervag/vimtex",
    opt = false,
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
  }

  use { "tpope/vim-commentary", opt = false }

  use { "NTBBloodbath/rest.nvim", opt = false }

  use { "mattn/emmet-vim", opt = false }

  use { "junegunn/vim-easy-align", opt = false }

  use {
    "phaazon/hop.nvim",
    opt = true,
    cmd = "HopWord",
    config = function()
      require("hop").setup({})
    end,
  }

  use { "AndrewRadev/splitjoin.vim", opt = false }

  use {
    "dhruvasagar/vim-table-mode",
    ft = { "text", "markdown" },
    opt = true,
  }

  use { "machakann/vim-sandwich", opt = false }

  use {
    "andymass/vim-matchup",
    opt = false,
    setup = function()
      vim.g.matchup_matchparen_offscreen = {
        method = "popup",
        fullwidth = true,
        highlight = "Normal",
      }
    end,
  }

  use {
    "mhinz/vim-sayonara",
    opt = true,
    cmd = "Sayonara",
  }

  use { "notomo/curstr.nvim", opt = false }

  use { "tpope/vim-surround", opt = false }
  use { "ngmy/vim-rubocop", opt = false }
  use { "tpope/vim-rails", opt = false }
  use { "thoughtbot/vim-rspec", opt = false }
  use { "MTDL9/vim-log-highlighting", opt = false }
  use {
    "andweeb/presence.nvim",
    opt = false,
  }
  use { "hoob3rt/lualine.nvim" }
end

packer.startup(plugins)
