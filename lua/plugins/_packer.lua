vim.cmd [[ packadd packer.nvim ]]

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git", "clone", "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.cmd [[packadd packer.nvim]]
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then return end

local use = packer.use

packer.init {
  transitive_opt = false,
  git = {
    clone_timeout = 300, -- 5 minutes, I have horrible internet
  },
  display = {
    open_fn = function()
      return require("packer.util").float({ border = Util.borders })
    end,
  },
}

local plugins = function()
  use {'wbthomason/packer.nvim', opt = true}

  use {
		"joshdick/onedark.vim",
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
    end
  }

  use {
    "norcalli/nvim-colorizer.lua",
    opt = true,
    ft = {
      "lua", "html", "css", "typescript",
      "javascript", "svelte", "vim"
    },
    config = function()
      require("colorizer").setup {
        ["*"] = {
          css = true,
          css_fn = true,
          mode = "background",
        },
      }
    end,
  }

  use {
    "folke/todo-comments.nvim",
    opt = false,
    config = function() require("plugins._todo") end,
  }

  use {
    "folke/which-key.nvim",
    opt = false,
    config = function() require("plugins._which-key") end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    opt = false,
    config = function() require("plugins._treesitter") end,
    requires = {
      { "nvim-treesitter/playground" },
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
  }

  use {
    "kyazdani42/nvim-web-devicons",
    opt = true,
    requires = {
      "yamatsum/nvim-nonicons"
    }
  }

  use {
    "kyazdani42/nvim-tree.lua",
    opt = false,
    config = function() require("plugins._nvimtree") end,
  }

  use {
    "akinsho/nvim-bufferline.lua",
    opt = false,
    config = function() require("plugins._bufferline") end,
  }

  use { "sindrets/diffview.nvim", opt = false }

  use {
    "lewis6991/gitsigns.nvim",
    opt = false,
    config = function() require("plugins._gitsigns") end,
  }

  use {
    "ruifm/gitlinker.nvim",
    opt = false,
    config = function() require("gitlinker").setup {} end,
  }

  use {
    "TimUntersberger/neogit",
    opt = false,
    config = function ()
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
          diffview = true
        }
      }
    end
  }

  use {
    "neovim/nvim-lspconfig",
    opt = false,
  }

  use {
    "mhartington/formatter.nvim",
    opt = false,
    config = function() require("plugins._formatter") end,
  }

  use {
    "mfussenegger/nvim-dap",
    opt = false,
    config = function() require("modules.dap") end,
    requires = { "rcarriga/nvim-dap-ui" },
  }

  use { "akinsho/flutter-tools.nvim", opt = false }

  use { "simrat39/rust-tools.nvim", opt = false }

  use { "ray-x/lsp_signature.nvim", opt = false }

  use { "jose-elias-alvarez/nvim-lsp-ts-utils", opt = false }

  use { "jose-elias-alvarez/null-ls.nvim", opt = false }

  use {
    "hrsh7th/nvim-compe",
    opt = false,
    config = function() require("plugins._compe") end,
    requires = {
      -- Snippet plugin for vim/nvim that supports LSP/VSCode's snippet
      -- format. Only used for LSP completion that needs snippet and todo stuff
      {
        "L3MON4D3/LuaSnip",
        config = function() require("plugins._snippets") end,
      },
    },
  }

  use {
    "nvim-telescope/telescope.nvim",
    opt = false,
    config = function() require("plugins._telescope") end,
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

  use { "tpope/vim-commentary", opt = false }

  use { "NTBBloodbath/rest.nvim", opt = false }

  use { "junegunn/vim-easy-align", opt = false }

	use {
    "steelsojka/pears.nvim",
    config = function() require("plugins._pears") end
  }

  use { "tjdevries/astronauta.nvim", opt = false }

  use {
    "phaazon/hop.nvim",
    opt = true,
    cmd = "HopWord",
    config = function() require("hop").setup {} end,
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
    config = function()
      vim.g.matchup_matchparen_offscreen = {
        method = "popup",
        fullwidth = true,
        highlight = "Normal"
      }
    end
  }

  use {
    "mhinz/vim-sayonara",
    opt = true,
    cmd = "Sayonara",
  }

	use { "notomo/curstr.nvim", opt = false }


  use { 'tpope/vim-surround', opt = false } -- surround words with symbol
  use { 'ngmy/vim-rubocop', opt = false }
  use { 'tpope/vim-rails', opt = false }
  use { 'thoughtbot/vim-rspec', opt = false }
  use { 'MTDL9/vim-log-highlighting', opt = false }
  use {
    "andweeb/presence.nvim",
    opt = false,
    config = function() require("plugins._presence") end,
  }
end

packer.startup(plugins)
