-- local keymap = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }

-- debugging
-- keymap("n", "<A-d>", ":lua require('dapui').toggle()<CR>", opts)
-- keymap("n", "<A-b>", ":lua require('dap').toggle_breakpoint()<CR>", opts)
-- keymap("n", "<A-c>", ":lua require('dap').continue()<CR>", opts)
--
-- keymap("n", "<A-o>", ":lua require('dap').step_over()<CR>", opts)
-- keymap("n", "<A-i>", ":lua require('dap').step_into()<CR>", opts)
-- keymap("n", "<A-u>", ":lua require('dap').step_out()<CR>", opts)
--
-- keymap("n", "<A-v>h", ":lua require('dap.ui.variables').hover()<CR>", opts)
-- keymap("v", "<A-v>v", ":lua require('dap.ui.variables').visual_hover()<CR>", opts)
--
-- keymap("n", "<A-v>w", ":lua require('dap.ui.widgets').hover()<CR>", opts)
-- keymap(
--   "n",
--   "<Leader>duf",
--   ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>",
--   opts
-- )
--
-- keymap("n", "<Leader>dro", ":lua require('dap').repl.open()<CR>", opts)
-- keymap("n", "<Leader>drl", ":lua require('dap').repl.run_last()<CR>", opts)
--
-- keymap("n", "<Leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
-- keymap(
--   "n",
--   "<Leader>dbm",
--   ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') )<CR>",
--   opts
-- )
--
-- keymap("n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>", opts)
-- keymap("n", "<Leader>di", ":lua require('dapui').toggle()<CR>", opts)

Nvim.mappings.whichkey["d"] = {
  name = "Debug",
  b = {
    name = "Breakpoints",
    c = {
      "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
      "Breakpoint Condition",
    },
    m = {
      "<cmd>lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>",
      "Log Point Message",
    },
  },
  c = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
  d = { "<cmd>lua require('dapui').toggle()<CR>", "Toggle debugger" },
  g = {
    name = "UI",
    h = { "<cmd>lua require('dap.ui.widgets').hover()<CR>", "Hover" },
    f = { "local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>", "Float" },
  },
  h = {
    name = "Hover",
    h = { "<cmd>lua require('dap.ui.variables').hover()<CR>", "Hover" },
    v = { "<cmd>lua require('dap.ui.variables').visual_hover()<CR>", "Visual Hover" },
  },
  i = { "<cmd>lua require('dap').step_into()<CR>", "Step Into" },
  o = { "<cmd>lua require('dap').step_over()<CR>", "Step Over" },
  r = {
    name = "Repl",
    o = { "<cmd>lua require('dap').repl.open()<CR>", "Open" },
    l = { "<cmd>lua require('dap').repl.run_last()<CR>", "Run Last" },
  },
  s = { "<cmd>lua require('dapui').scopes()<CR>", "Scopes" },
  t = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle breakpoint" },
  u = { "<cmd>lua require('dap').step_out()<CR>", "Step Out" },
}
