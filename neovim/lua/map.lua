-- Telescope key bindings
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', {noremap = true})
