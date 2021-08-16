if has_module('lspconfig') then
  local nvim_lsp = require('lspconfig')

  --local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
  local servers = { 'gopls', 'pyright', 'terraformls', 'yamlls', 'dockerls' }

  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end
end
