local plugins = {
  "wbthomason/packer.nvim", -- Have packer manage itself
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  "ellisonleao/gruvbox.nvim", -- defaulting to gruvbox
  "rcarriga/nvim-notify", -- notifications

  -- cmp plugins
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",

  -- snippets
  "L3MON4D3/LuaSnip", --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  "williamboman/nvim-lsp-installer", -- simple to ,language server installer
  "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
  "antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlight
  -- "gbrlsnchs/telescope-lsp-handlers.nvim", -- telescope integration

  -- DAP
  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
  },
  "leoluz/nvim-dap-go",

  -- Telescope
  "nvim-telescope/telescope.nvim",
  -- ,"nvim-telescope/telescope-media-files.nvim"

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      { "p00f/nvim-ts-rainbow" },
    },
  },

  -- Easily comment stuff
  "numToStr/Comment.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- Git
  "lewis6991/gitsigns.nvim",

  -- NVIM Tree
  "kyazdani42/nvim-web-devicons",
  "kyazdani42/nvim-tree.lua",

  -- Buffer line
  "akinsho/bufferline.nvim",
  "moll/vim-bbye",

  -- Lualine
  "nvim-lualine/lualine.nvim",

  -- Toggleterm
  "akinsho/toggleterm.nvim",

  -- Project
  "ahmedkhalf/project.nvim",

  -- Impatient
  "lewis6991/impatient.nvim",

  -- Indent Blank Line
  "lukas-reineke/indent-blankline.nvim",

  -- Alpha
  "goolord/alpha-nvim",

  -- Whichkey
  "folke/which-key.nvim",

  -- Trouble
  "folke/trouble.nvim",
}

for _, v in pairs(plugins) do
  table.insert(Nvim.plugins, v)
end
