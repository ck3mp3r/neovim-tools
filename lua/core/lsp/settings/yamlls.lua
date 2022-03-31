local opts = {
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://json.schemastore.org/chart.json"] = "*/templates/**.yaml"
      },
    },
  },
}

return opts
