local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "ellisonleao/gruvbox.nvim" -- defaulting to gruvbox

   -- cmp plugins
  use  "hrsh7th/nvim-cmp" -- The completion plugin
  use  "hrsh7th/cmp-buffer" -- buffer completions
  use  "hrsh7th/cmp-path" -- path completions
  use  "hrsh7th/cmp-cmdline" -- cmdline completions
  use  "saadparwaiz1/cmp_luasnip" -- snippet completions
  use  "hrsh7th/cmp-nvim-lsp"
  use  "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  -- use "nvim-telescope/telescope-media-files.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      {"p00f/nvim-ts-rainbow"}
    }
  }

  -- Easily comment stuff
  use "numToStr/Comment.nvim"
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- NVIM Tree
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- Buffer line
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- Lualine
  use 'nvim-lualine/lualine.nvim'

  -- Toggleterm
  use "akinsho/toggleterm.nvim"

  -- Project
  use "ahmedkhalf/project.nvim"

  -- Impatient
  use "lewis6991/impatient.nvim"

  -- Indent Blank Line
  use "lukas-reineke/indent-blankline.nvim"

  -- Alpha
  use 'goolord/alpha-nvim'

  -- Whichkey
  use "folke/which-key.nvim"

  -- Trouble
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    config = function()
      require("trouble").setup({
        auto_open = true,
        auto_close = true,
        use_diagnostic_signs = true,
      })
    end,
  }

  -- load user plugins
  for _, v in ipairs(Nvim.plugins) do
    use(v)
  end

  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
