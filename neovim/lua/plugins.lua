local use = require('packer').use
return require('packer').startup(
  function()
    use '9mm/vim-closer'
    use 'arcticicestudio/nord-vim'
    use 'dracula/vim'
--    use 'hashivim/vim-terraform'
    use 'joshdick/onedark.vim'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-vinegar'
    use 'mhinz/vim-startify'
    use 'morhetz/gruvbox'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'nvim-lua/diagnostic-nvim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'}
      }
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'wbthomason/packer.nvim'
    use 'wbthomason/lsp-status.nvim'
  end
)
