vim.cmd[[packadd packer.nvim]]

local ok, packer = pcall(require, "packer")

if ok then
  local use = packer.use

  packer.init({
    git = {
      clone_timeout = 300 -- 5 minutes, I have horrible internet
    },
    display = {
      open_cmd = '80vnew [packer]',
    }
  })

  local plugins = function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = false}

    use {'gruvbox-community/gruvbox', opt = false} -- nice colorscheme
    use {'cohama/lexima.vim', opt = false} -- autopairs brackets, braces etc
    use {'tpope/vim-commentary', opt = false} -- comment stuff easier
    use {
      'neoclide/jsonc.vim',
      ft = {'jsonc'},
      opt = false
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
    use {
      'mattn/emmet-vim',
      cmd = 'EmmetInstall',
      opt = false
    } -- less typing for html code
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
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
      'nvim-telescope/telescope-fzy-native.nvim',
      opt = false,
      requires = {
        {'nvim-telescope/telescope.nvim'}
      }
    } -- faster sorter algo for telescope
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
    use { 'tpope/vim-fugitive', opt = false } -- git helpers inside neovim
    use { 'honza/vim-snippets', opt = false }
    use { 'SirVer/ultisnips', opt = false }
    use { 'tpope/vim-surround', opt = false }
    use {'Shougo/deoplete.nvim', opt = false}
    use {'Shougo/deoplete-lsp', opt = false}
    use {'dense-analysis/ale', opt = false}
    use {'tpope/vim-rails', opt = false}
    vim.cmd('let g:deoplete#enable_at_startup = 1')
    use {'nvim-treesitter/nvim-treesitter', opt = false} -- better syntax highlighting
    use {'nvim-treesitter/playground', opt = false} -- playground for treesitter
  end


  return packer.startup(plugins)
end

