local M = {}

---@class CarbonConfig
---@field style string Theme style: "carbon" (dark) or "carbon_day" (light)
---@field transparent boolean Enable transparent background
---@field terminal_colors boolean Enable terminal colors
---@field dim_inactive boolean Dim inactive windows
---@field styles CarbonStyles
---@field on_colors fun(colors: CarbonPalette): nil
---@field on_highlights fun(highlights: table, colors: CarbonPalette): nil

---@class CarbonStyles
---@field comments table Style for comments
---@field keywords table Style for keywords
---@field functions table Style for functions
---@field variables table Style for variables
---@field properties table Style for properties

---@type CarbonConfig
M.defaults = {
  style = "carbon",
  transparent = false,
  terminal_colors = true,
  dim_inactive = false,
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = { bold = true },
    variables = {},
    properties = { bold = true },
  },
  on_colors = function(colors) end,
  on_highlights = function(highlights, colors) end,
}

---@type CarbonConfig
M.options = {}

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
end

function M.extend(opts)
  return vim.tbl_deep_extend("force", {}, M.options, opts or {})
end

return M
