local use = require('packer').use
return require('packer').startup(
  function()
    use '9mm/vim-closer'
    use 'arcticicestudio/nord-vim'
    use 'dracula/vim'
--    use 'hashivim/vim-terraform'
    use {
      'glepnir/lspsaga.nvim',
      config = function()
        require'lspsaga'.init_lsp_saga()
      end
    }
    use 'joshdick/onedark.vim'
    use {
      'kdheepak/tabline.nvim',
      config = function()
        require'tabline'.setup {enable = false}
      end,
    }
    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'
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
    use {
     'shadmansaleh/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      config = function()
        require('lualine').setup {
         tabline = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { require'tabline'.tabline_buffers },
            lualine_x = { require'tabline'.tabline_tabs },
            lualine_y = {},
            lualine_z = {},
          }
        }
      end
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'wbthomason/packer.nvim'
    use 'wbthomason/lsp-status.nvim'
  end
)
