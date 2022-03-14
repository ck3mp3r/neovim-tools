local ok, trouble = pcall(require, "trouble")
if not ok then
  return
end

trouble.setup {
  auto_open = false,
  auto_close = true,
  auto_preview = false,
  use_diagnostic_signs = true,
}
