local use = require('packer').use
return require('packer').startup(
  function()
    use 'wbthomason/packer.nvim'
    use "wbthomason/lsp-status.nvim"
    use 'dracula/vim'
    use 'morhetz/gruvbox'
    use 'joshdick/onedark.vim'
    use {
      "mhinz/vim-startify",
      cmd = { "SLoad", "SSave" },
      config = function()
        vim.g.startify_disable_at_vimenter = true
      end,
    }
    use 'arcticicestudio/nord-vim'
--    use 'hashivim/vim-terraform'
    use '9mm/vim-closer'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-vinegar'
    use 'nvim-treesitter/nvim-treesitter'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'nvim-lua/diagnostic-nvim'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'}
      }
    }
  end
)
