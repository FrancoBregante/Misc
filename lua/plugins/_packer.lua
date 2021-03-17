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
    use {'wbthomason/packer.nvim', opt = true}

    use {'gruvbox-community/gruvbox', opt = false}
    use { "windwp/nvim-autopairs", opt = true } -- autopairs brackets, braces etc
    use { "b3nj5m1n/kommentary", opt = true } -- comment stuff easier
    use { 'brooth/far.vim', opt = false } -- project wide search and replace
    use { 'tpope/vim-fugitive', opt = false } -- git helpers inside neovim
    use {
      "mhartington/formatter.nvim",
      opt = true,
      cmd = "Format",
    } -- helper for fast formatting
    use {'norcalli/nvim-colorizer.lua', opt = false} -- colorize hex/rgb/hsl value
    use {
      "nvim-treesitter/nvim-treesitter",
      requires = {
        { "nvim-treesitter/playground" }, -- playground for treesitter
        { "nvim-treesitter/nvim-treesitter-textobjects" }, -- "smart" textobjects
      },
      opt = true,
    } -- mostly for better syntax highlighting, but it has more stuff
    use {
      'hrsh7th/nvim-compe',
      opt = true,
      requires = {
        {'hrsh7th/vim-vsnip'}, -- integration with vim-vsnip
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
    use { "kyazdani42/nvim-web-devicons", opt = true } -- fancy icons
    use { "kyazdani42/nvim-tree.lua", opt = true } -- super fast file tree viewer
    use { "akinsho/nvim-bufferline.lua", opt = true } -- snazzy bufferline
    use { "neovim/nvim-lspconfig", opt = true } -- builtin lsp config
    use { "mfussenegger/nvim-jdtls", opt = false } -- jdtls
    use { "glepnir/lspsaga.nvim", opt = true } -- builtin lsp config
    use { "windwp/nvim-ts-autotag", opt = true } -- auto-close html tag
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
    use { "lewis6991/gitsigns.nvim", opt = true } -- show git stuff in signcolumn
    use {
      "rhysd/git-messenger.vim",
      cmd = "GitMessenger",
      opt = true
    } -- sort of like git blame but in floating window
    use {
      "mhinz/vim-sayonara",
      cmd = 'Sayonara',
      opt = true
    } -- better window and buffer management
    use { "AndrewRadev/splitjoin.vim", opt = false }
    use { "tjdevries/astronauta.nvim", opt = false } -- temporary stuff before it got merged upstream
    use { "phaazon/hop.nvim", opt = false } -- easymotion but better


    use { 'tpope/vim-surround', opt = false } -- surround words with symbol
    use { 'dense-analysis/ale', opt = false }
    use { 'blackcauldron7/surround.nvim', opt = true }
    use { 'ngmy/vim-rubocop', opt = false }
    use { 'tpope/vim-rails', opt = false }
    use { 'thoughtbot/vim-rspec', opt = false }
    use { 'Shougo/deoplete.nvim', opt = false }
    use { 'Shougo/deoplete-lsp', opt = false }
    vim.cmd('let g:deoplete#enable_at_startup = 1')
    use {'phaazon/hop.nvim', opt = false} -- easymotion but better
    use {'tami5/sql.nvim', opt = false}
    use {'AndrewRadev/splitjoin.vim', opt = false}
    use {'TimUntersberger/neogit', opt = false}
  end


  packer.startup(plugins)
end

