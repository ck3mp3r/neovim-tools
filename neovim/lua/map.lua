-- Telescope key bindings
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', {noremap = true})

-- mapping for handling vim-ariline tablines
for i=0,9 do
  vim.api.nvim_set_keymap('n', string.format('<Leader>%d', i ), string.format('<Plug>AirlineSelectTab%d', i), {noremap = false})
end
