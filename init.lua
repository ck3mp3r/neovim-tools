Nvim = {
  colorscheme = "gruvbox",
  options = {},
  plugins = {},
  mappings = {
    whichkey = {},
  },
}

local ok, err = pcall(dofile, vim.fn.stdpath("config") .. "/config.lua")
if not ok then
  print(err)
end

require("core")
