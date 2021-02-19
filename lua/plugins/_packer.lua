vim.cmd[[packadd packer.nvim]]

local ok, packer = pcall(require, "packer")

if ok then
  local use = packer.use

  packer.init({
    git = {
      clone_timeout = 100
    },
    display = {
      open_cmd = '80vnew [packer]',
    }
  })

  local plugins = function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    use {'lifepillar/vim-gruvbox8', opt = false} -- nice colorscheme
    use {'windwp/nvim-autopairs', opt = false} -- autopairs brackets, braces etc
    use {'b3nj5m1n/kommentary', opt = true } -- comment stuff easier
    use {'tpope/vim-fugitive', opt = false} -- git helpers inside neovim
    use {
      'neoclide/jsonc.vim',
      ft = {'jsonc'},
      opt = true
    } -- jsonc highlighting
    use {'norcalli/nvim-colorizer.lua', opt = false} -- colorize hex/rgb/hsl value
    use {
      'dhruvasagar/vim-table-mode',
      ft = {'txt', 'markdown'},
      opt = false,
    } -- table alignment
    use {
      'akinsho/nvim-bufferline.lua',
      opt = false,
      requires = {
        {'kyazdani42/nvim-web-devicons', opt = false}
      }
    } -- snazzy bufferline
    use {'neovim/nvim-lspconfig', opt = false} -- builtin lsp config
    use {'glepnir/lspsaga.nvim', opt = true} -- better UI for builtin LSP
    use {
      'mattn/emmet-vim',
      cmd = 'EmmetInstall',
      opt = false
    } -- less typing for html code
    use {
      '~/repos/telescope.nvim',
      opt = false,
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzy-native.nvim'}, -- fast search algo
        {'nvim-telescope/telescope-media-files.nvim'}, -- media preview
        {'nvim-telescope/telescope-frecency.nvim'}, -- media preview
        {'nvim-telescope/telescope-cheat.nvim'}, -- im cheating
      },
    } -- extensible fuzzy finder
    use {
      'kyazdani42/nvim-tree.lua',
      opt = false,
      requires = {
        {'kyazdani42/nvim-web-devicons', opt = false}
      },
    } -- super fast file tree viewer
    use {
      'hrsh7th/nvim-compe',
      opt = false,
      requires = {
        {'hrsh7th/vim-vsnip'}, -- integration with vim-vsnip
        {'hrsh7th/vim-vsnip-integ'} -- integration with vim-vsnip
      },
    } -- completion framework
    use {'lewis6991/gitsigns.nvim', opt = false} -- show git stuff in signcolumn
    use {
      'rhysd/git-messenger.vim',
      cmd = 'GitMessenger',
      opt = false
    } -- sort of like git blame but in floating window
    use { 'machakann/vim-sandwich', opt = false } -- surround words with symbol
    use {
      'mhinz/vim-sayonara',
      cmd = 'Sayonara',
      opt = false
    } -- better window and buffer management
    use { 'brooth/far.vim', opt = false } -- project wide search and replace
    use { 'tpope/vim-surround', opt = false }
    use { 'dense-analysis/ale', opt = false }
    use { 'ngmy/vim-rubocop', opt = false }
    use { 'tpope/vim-rails', opt = false }
    use {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        {'nvim-treesitter/playground'}, -- playground for treesitter
        {'nvim-treesitter/nvim-treesitter-textobjects'}, -- "smart" textobjects
      },
      opt = true
    } -- mostly for better syntax highlighting, but it has more stuff
    use {'Shougo/deoplete.nvim', opt = false}
    use {'Shougo/deoplete-lsp', opt = false}
    vim.cmd('let g:deoplete#enable_at_startup = 1')
    -- use {'tjdevries/astronauta.nvim', opt = false} -- temporary stuff before it got merged upstream
    use {'phaazon/hop.nvim', opt = false} -- easymotion but better
    use {'tami5/sql.nvim', opt = false}
    use {'AndrewRadev/splitjoin.vim', opt = false}
    use {'TimUntersberger/neogit', opt = false}
  end


  return packer.startup(plugins)
end

