local ok, _ = pcall(vim.cmd, "colorscheme " .. Nvim.colorscheme)
if not ok then
  -- vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
