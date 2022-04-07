local opts = {
  filetypes = { "yml", "yaml", "yaml.gotexttmpl", "yaml.docker-compose", "config" },
  settings = {
    yaml = {
      schemas = {
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["https://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
      },
    },
  },
}

return opts
