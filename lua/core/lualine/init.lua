local ok, lualine = pcall(require, "lualine")
if not ok then
  return
end

local colors = require("core.lualine.colors")
local config = require("core.lualine.config")
local conditions = require("core.lualine.conditions")

table.insert(config.sections.lualine_a, {
  function()
    return " "
  end,
  padding = { left = 0, right = 0 },
  color = {},
  cond = nil,
})

table.insert(config.sections.lualine_b, {
  "b:gitsigns_head",
  icon = " ",
  color = { gui = "bold" },
  cond = conditions.check_git_workspace,
})

table.insert(config.sections.lualine_b, {
  "filename",
  color = {},
})

table.insert(config.sections.lualine_c, {
  "diff",
  function()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed,
      }
    end
  end,
  symbols = { added = "  ", modified = " ", removed = " " },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.yellow },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width and conditions.check_git_workspace,
})

table.insert(config.sections.lualine_x, {
  "diagnostics",
  sources = { "nvim_lsp" },
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
  color = {},
  cond = conditions.hide_in_width,
})

table.insert(config.sections.lualine_x, {
  -- treesitter
  function()
    local b = vim.api.nvim_get_current_buf()
    if next(vim.treesitter.highlighter.active[b]) then
      return ""
    end
    return ""
  end,
  color = { fg = colors.green },
  cond = conditions.hide_in_width,
})

table.insert(config.sections.lualine_x, {
  -- Lsp server name .
  function(msg)
    msg = "LS Inactive" or msg

    local buf_clients = vim.lsp.buf_get_clients()

    if next(buf_clients) == nil then
      -- TODO: clean up this if statement
      if type(msg) == "boolean" or #msg == 0 then
        return "LS Inactive"
      end
      return msg
    end
    local buf_client_names = {}

    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" then
        table.insert(buf_client_names, client.name)
      end
    end
    if not next(buf_client_names) then
      return msg
    else
      return "[" .. table.concat(buf_client_names, ", ") .. "]"
    end
  end,
  icon = "",
  color = { gui = "bold" },
  cond = conditions.hide_in_width,
})

table.insert(config.sections.lualine_x, {
  "filetype",
  cond = conditions.hide_in_width,
})

table.insert(config.sections.lualine_z, {
  function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  padding = { left = 0, right = 0 },
  color = { fg = colors.yellow, bg = colors.bg },
  cond = nil,
})

lualine.setup(config)
