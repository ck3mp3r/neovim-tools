
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerInstall'
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

for n in "bash" \
  "dockerfile" \
  "go" \
  "hcl" \
  "java" \
  "javascript" \
  "json" \
  "kotlin" \
  "lua" \
  "python" \
  "yaml"; \
  do nvim --headless -c "TSInstallSync ${n}" -c 'q'; done

for n in "bashls" \
  "dockerls" \
  "gopls" \
  "jsonnet_ls" \
  "jsonls" \
  # "sumneko_lua" \ not supported on arm64 for alpine... yet
  "yamlls"; \
  do nvim --headless -c "LspInstall --sync ${n}" -c 'q'; done
