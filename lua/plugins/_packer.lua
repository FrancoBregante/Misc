vim.cmd[[packadd packer.nvim]]

local packer_ok, packer = pcall(require, "packer")

if packer_ok then
  local use = packer.use
  packer.init({
    git = {
      clone_timeout = 150
    },
    display = {
      open_cmd = '80vnew [packer]',
    }
  })

  local plugins = function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = false}

    use { "joshdick/onedark.vim", opt = false }
    use {'gruvbox-community/gruvbox', opt = false}
    -- use {'folke/tokyonight.nvim', opt = false}

    use {
      "sunjon/shade.nvim",
      opt = false,
      config = function()
        require("shade").setup {
          overlay_opacity = 50,
          opacity_step = 1,
          keys = {
            brightness_up = "<C-Up>",
            brightness_down = "<C-Down>",
            toggle = "<Leader>s",
          },
        }
      end,
    }

    use {
      "folke/lsp-trouble.nvim",
      opt = false,
      config = function() require("trouble").setup {} end,
    }

    use { "windwp/nvim-autopairs", opt = false } -- autopairs brackets, braces etc
    use { "b3nj5m1n/kommentary", opt = false } -- comment stuff easier
    use {
      "mhartington/formatter.nvim",
      opt = false,
      config = function() require("plugins._formatter") end,
    } -- helper for fast formatting
    use {
      "norcalli/nvim-colorizer.lua",
      opt = true,
      ft = {
        "lua", "html", "css", "typescript",
        "javascript", "svelte"
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
      "nvim-treesitter/nvim-treesitter",
      opt = false,
      config = function() require("plugins._treesitter") end,
      requires = {
        { "nvim-treesitter/playground" }, -- playground for treesitter
        { "nvim-treesitter/nvim-treesitter-textobjects" }, -- "smart" textobjects
        { "windwp/nvim-ts-autotag" },
        { "JoosepAlviste/nvim-ts-context-commentstring" },
        { "theHamsta/nvim-treesitter-pairs" },
        { 'p00f/nvim-ts-rainbow' },
      },
    } -- mostly for better syntax highlighting, but it has more stuff
    use {
      'hrsh7th/nvim-compe',
      opt = false,
      config = function() require("plugins._compe") end,
      requires = {
        {
          "L3MON4D3/LuaSnip",
          config = function() require("plugins._snippets") end,
        },
      },
    } -- completion framework
    use {
      "junegunn/goyo.vim",
      ft = { "text", "markdown" },
      opt = false,
    } -- no distraction mode a.k.a zen mode
    use {
      "junegunn/vim-easy-align",
      opt = false,
    } -- easy align using delimiter
    use {
      'dhruvasagar/vim-table-mode',
      ft = {'text', 'markdown'},
      opt = false,
    } -- table alignment
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
    use { "jose-elias-alvarez/nvim-lsp-ts-utils", opt = false }
    use { "neovim/nvim-lspconfig", opt = false } -- builtin lsp config
    use { "mfussenegger/nvim-jdtls", opt = false } -- jdtls
    use { "tami5/sql.nvim", opt = false } -- sql bindings in LuaJIT
    use {
      "nvim-telescope/telescope.nvim",
      config = function() require("plugins._telescope") end,
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-media-files.nvim" }, -- media preview
        { "nvim-telescope/telescope-frecency.nvim" }, -- media preview
        { "nvim-telescope/telescope-fzf-native.nvim" },
      },
    } -- extensible fuzzy finder
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
      "rhysd/git-messenger.vim",
      cmd = "GitMessenger",
      opt = false,
      config = function()
        vim.g.git_messenger_no_default_mappings = true
      end
    } -- sort of like git blame but in floating window
    use {
      "mhinz/vim-sayonara",
      cmd = 'Sayonara',
      opt = false
    } -- better window and buffer management
    use { "AndrewRadev/splitjoin.vim", opt = false }
    use { "tjdevries/astronauta.nvim", opt = false } -- temporary stuff before it got merged upstream
    use {
      "phaazon/hop.nvim",
      opt = true,
      cmd = "HopWord",
      config = function() require("hop").setup {} end,
    }
    use { "TimUntersberger/neogit", opt = false }
    use { "plasticboy/vim-markdown", opt = false }
    use { "notomo/curstr.nvim", opt = false }
    use { "windwp/nvim-spectre", opt = false }
    use {
      "kyazdani42/nvim-web-devicons",
      opt = true,
      requires = {
        "yamatsum/nvim-nonicons"
      }
    }

    use { 'tpope/vim-surround', opt = false } -- surround words with symbol
    use { 'ngmy/vim-rubocop', opt = false }
    use { 'tpope/vim-rails', opt = false }
    use { 'thoughtbot/vim-rspec', opt = false }
    use { 'MTDL9/vim-log-highlighting', opt = false }
  end

  packer.startup(plugins)
end
