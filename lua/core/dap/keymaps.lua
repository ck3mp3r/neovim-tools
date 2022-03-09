local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- debugging
keymap("n", "<F4>", ":lua require('dapui').toggle()<CR>", opts)
keymap("n", "<F5>", ":lua require('dap').toggle_breakpoint()<CR>", opts)
keymap("n", "<F9>", ":lua require('dap').continue()<CR>", opts)

keymap("n", "<F1>", ":lua require('dap').step_over()<CR>", opts)
keymap("n", "<F2>", ":lua require('dap').step_into()<CR>", opts)
keymap("n", "<F3>", ":lua require('dap').step_out()<CR>", opts)

keymap("n", "<Leader>dsc", ":lua require('dap').continue()<CR>", opts)
keymap("n", "<Leader>dsv", ":lua require('dap').step_over()<CR>", opts)
keymap("n", "<Leader>dsi", ":lua require('dap').step_into()<CR>", opts)
keymap("n", "<Leader>dso", ":lua require('dap').step_out()<CR>", opts)

keymap("n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>", opts)
keymap("v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>", opts)

keymap("n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>", opts)
keymap(
  "n",
  "<Leader>duf",
  ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>",
  opts
)

keymap("n", "<Leader>dro", ":lua require('dap').repl.open()<CR>", opts)
keymap("n", "<Leader>drl", ":lua require('dap').repl.run_last()<CR>", opts)

keymap("n", "<Leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap(
  "n",
  "<Leader>dbm",
  ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') )<CR>",
  opts
)
keymap("n", "<Leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>", opts)

keymap("n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>", opts)
keymap("n", "<Leader>di", ":lua require('dapui').toggle()<CR>", opts)
