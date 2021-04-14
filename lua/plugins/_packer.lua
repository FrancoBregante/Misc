vim.cmd[[packadd packer.nvim]]

local ok, packer = pcall(require, "packer")

if ok then
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

    use {'gruvbox-community/gruvbox', opt = false}
    use { "windwp/nvim-autopairs", opt = false } -- autopairs brackets, braces etc
    use { "b3nj5m1n/kommentary", opt = false } -- comment stuff easier
    use {
      "mhartington/formatter.nvim",
      opt = false,
      cmd = "Format",
    } -- helper for fast formatting
    use {'norcalli/nvim-colorizer.lua', opt = false} -- colorize hex/rgb/hsl value
    use {
      "nvim-treesitter/nvim-treesitter",
      requires = {
        { "nvim-treesitter/playground" }, -- playground for treesitter
        { "nvim-treesitter/nvim-treesitter-textobjects" }, -- "smart" textobjects
        { "windwp/nvim-ts-autotag" },
        { "JoosepAlviste/nvim-ts-context-commentstring" },
        { "theHamsta/nvim-treesitter-pairs" },
      },
      opt = false,
    } -- mostly for better syntax highlighting, but it has more stuff
    use {
      'hrsh7th/nvim-compe',
      opt = false,
      requires = {
        {'L3MON4D3/LuaSnip'},
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
    use { "kyazdani42/nvim-web-devicons", opt = false } -- fancy icons
    use { "kyazdani42/nvim-tree.lua", opt = false } -- super fast file tree viewer
    use { "akinsho/nvim-bufferline.lua", opt = false } -- snazzy bufferline
    use { "jose-elias-alvarez/nvim-lsp-ts-utils", opt = false }
    use { "neovim/nvim-lspconfig", opt = false } -- builtin lsp config
    use { "mfussenegger/nvim-jdtls", opt = false } -- jdtls
    use { "tami5/sql.nvim", opt = false } -- sql bindings in LuaJIT
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzy-native.nvim" }, -- fast search algo
        { "nvim-telescope/telescope-media-files.nvim" }, -- media preview
        { "nvim-telescope/telescope-frecency.nvim" }, -- media preview
      },
    } -- extensible fuzzy finder
    use { "lewis6991/gitsigns.nvim", opt = false } -- show git stuff in signcolumn
    use {
      "rhysd/git-messenger.vim",
      cmd = "GitMessenger",
      opt = false
    } -- sort of like git blame but in floating window
    use {
      "mhinz/vim-sayonara",
      cmd = 'Sayonara',
      opt = false
    } -- better window and buffer management
    use { "AndrewRadev/splitjoin.vim", opt = false }
    use { "tjdevries/astronauta.nvim", opt = false } -- temporary stuff before it got merged upstream
    use { "phaazon/hop.nvim", opt = false } -- easymotion but better
    use { "notomo/curstr.nvim", opt = false }

    use {'TimUntersberger/neogit', opt = false}
    use { 'tpope/vim-surround', opt = false } -- surround words with symbol
    use { 'ngmy/vim-rubocop', opt = false }
    use { 'tpope/vim-rails', opt = false }
    use { 'thoughtbot/vim-rspec', opt = false }
  end

  packer.startup(plugins)
end
