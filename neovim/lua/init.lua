function Has_Module(name)
  if pcall(function() require(name) end) then
    return true
  else
    return false
  end
end

vim.cmd 'syntax on'
vim.g.mapleader = " "
vim.o.ruler = false
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.o.hidden = true
vim.o.updatetime = 300
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.showmode = false

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'number'
vim.wo.wrap = true

vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.bo.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true

vim.o.showtabline = 4

-- enable tabline
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#buffer_idx_mode'] = 1
vim.g['airline#extensions#tabline#left_sep'] = ''
vim.g['airline#extensions#tabline#left_alt_sep'] = ''
vim.g['airline#extensions#tabline#right_sep'] = ''
vim.g['airline#extensions#tabline#right_alt_sep'] = ''
vim.g['airline#extensions#tabline#formatter'] = 'default'

-- airline config
vim.g['airline_left_sep'] = ''
vim.g['airline_right_sep'] = ''

-- enable powerline fonts
vim.g['airline_powerline_fonts'] = 1

-- Switch to your current theme
vim.g['airline_theme'] = 'onedark'

vim.cmd[[autocmd UiEnter * colorscheme gruvbox]]

require('plugins')
require('lsp')
require('map')
