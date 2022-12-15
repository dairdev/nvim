vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'williamboman/mason.nvim'
  use "williamboman/mason-lspconfig.nvim"
  use 'neovim/nvim-lspconfig'

  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'

  use 'onsails/lspkind.nvim'

  use({ "glepnir/lspsaga.nvim", branch = "main", })

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- For vsnip users.
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }
  use { 'windwp/nvim-ts-autotag' }

  use { 'kyazdani42/nvim-web-devicons'}

  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  })

  use {'andymass/vim-matchup', event = 'VimEnter'}

  use {
    'dense-analysis/ale',
    ft = { 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'vim', 'tex', 'javascript'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }

  use { 'OmniSharp/omnisharp-vim' }

  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  use { 'nvim-treesitter/nvim-treesitter', run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,}

  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }

  use { 'nvim-lualine/lualine.nvim' }


  use {
    'kyazdani42/nvim-tree.lua',
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use {
    'stevearc/aerial.nvim',
    config = function() require('aerial').setup() end
  }

  use {
    's1n7ax/nvim-window-picker',
    tag = 'v1.*',
    config = function()
      require'window-picker'.setup()
    end,
  }

  use {'akinsho/bufferline.nvim', tag = "v2.*"}

  use 'folke/lsp-colors.nvim'

  use "lukas-reineke/indent-blankline.nvim"

  use {'dracula/vim', as = 'dracula'}


  use 'marko-cerovac/material.nvim'

  use 'folke/tokyonight.nvim'

  use { 'kartikp10/noctis.nvim', requires = { 'rktjmp/lush.nvim' } }

  use 'rmehri01/onenord.nvim'

  use "EdenEast/nightfox.nvim"

  use {'nyoom-engineering/oxocarbon.nvim'}

end)
