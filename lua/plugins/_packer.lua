vim.cmd [[ packadd packer.nvim ]]

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.cmd [[packadd packer.nvim]]
end

local packer_ok, packer = pcall(require, "packer")

if packer_ok then
  local use = packer.use

  packer.init({
    transitive_opt = false,
    git = {
      clone_timeout = 150
    },
    display = {
      open_fn = function()
        return require("packer.util").float({ border = Util.borders })
      end,
    }
  })

  local plugins = function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    use { "joshdick/onedark.vim", opt = false }
    use {'gruvbox-community/gruvbox', opt = false}
    -- use {'folke/tokyonight.nvim', opt = false}

    use { "sindrets/diffview.nvim", opt = false }

    use {
      "folke/lsp-trouble.nvim",
      opt = false,
      config = function() require("trouble").setup {} end,
    }

    -- Highlight, list and search todo comments in your projects
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

    use { "editorconfig/editorconfig-vim", opt = false }

    -- Sooon...
    -- use {
    --   "vhyrro/neorg",
    --   config = function()
    --     require("neorg").setup {
    --       load = { ["core.defaults"] = {} },
    --     }
    --   end,
    --   requires = { "nvim-lua/plenary.nvim" },
    -- }

    use {
      "mattn/emmet-vim",
      opt = false,
      config = function() require("plugins._emmet") end,
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
      "nvim-treesitter/nvim-treesitter",
      opt = false,
      config = function() require("plugins._treesitter") end,
      requires = {
        { "nvim-treesitter/playground" }, -- playground for treesitter
        { "nvim-treesitter/nvim-treesitter-textobjects" }, -- "smart" textobjects
        { "windwp/nvim-ts-autotag" },
        { "JoosepAlviste/nvim-ts-context-commentstring" },
        { 'p00f/nvim-ts-rainbow' },
      },
    } -- mostly for better syntax highlighting, but it has more stuff

    use {
      "andymass/vim-matchup",
      opt = false,
      config = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end
    }

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
      opt = true,
    } -- no distraction mode a.k.a zen mode
    use {
      "junegunn/vim-easy-align",
      opt = false,
    } -- easy align using delimiter
    use {
      'dhruvasagar/vim-table-mode',
      ft = {'text', 'markdown'},
      opt = true,
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
    use { "akinsho/flutter-tools.nvim", opt = false }
    use { "simrat39/rust-tools.nvim", opt = false }
    use { "ray-x/lsp_signature.nvim", opt = false }
    use { "jose-elias-alvarez/nvim-lsp-ts-utils", opt = false }
    use { "neovim/nvim-lspconfig", opt = true } -- builtin lsp config
    use { "tami5/sql.nvim", opt = false } -- sql bindings in LuaJIT
    use {
      "nvim-telescope/telescope.nvim",
      config = function() require("plugins._telescope") end,
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-media-files.nvim" }, -- media preview
        { "nvim-telescope/telescope-frecency.nvim" }, -- media preview
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
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
      "mhinz/vim-sayonara",
      cmd = 'Sayonara',
      opt = true
    } -- better window and buffer management
    use { "AndrewRadev/splitjoin.vim", opt = false }
    use { "tjdevries/astronauta.nvim", opt = false } -- temporary stuff before it got merged upstream
    use {
      "phaazon/hop.nvim",
      opt = true,
      cmd = "HopWord",
      config = function() require("hop").setup {} end,
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
      "plasticboy/vim-markdown",
      opt = false,
      filetype = { "markdown" },
      config = function()
        vim.g.vim_markdown_frontmatter = 1
      end
    }
    use { "notomo/curstr.nvim", opt = false }
    use { "windwp/nvim-spectre", opt = false }
    use {'RRethy/vim-illuminate'} -- wait until treesitter priority issue solved
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
    use {
      "andweeb/presence.nvim",
      opt = false,
      config = function() require("plugins._presence") end,
    }
  end

  packer.startup(plugins)
end
