---@class CarbonPalette
---@field none string
---@field bg string
---@field fg string
---@field keyword string
---@field variable string
---@field identifier string
---@field string string
---@field func string
---@field number string
---@field class string
---@field comment string
---@field string_literal_fg string
---@field string_literal_bg string
---@field gutter string
---@field line_nr string
---@field diff_add_bg string
---@field diff_remove_bg string
---@field diff_change_bg string
---@field cursor_line_fg string
---@field cursor_line_bg string
---@field html_tag string
---@field html_attr string
---@field html_attr_alt string
---@field error string
---@field link string
---@field diff_add string
---@field diff_change string
---@field diff_delete string

local M = {}

---@type CarbonPalette
M.carbon = {
  none = "NONE",

  -- Base colors
  bg = "#172030",
  fg = "#C9CCCD",

  -- Syntax colors
  keyword = "#DB6E89",        -- keyword, operation
  variable = "#9876AA",       -- variable, constant identifier, doc comment param
  identifier = "#B87EA2",     -- identifier
  string = "#73A7A7",         -- string
  func = "#F9B5AC",           -- function call, instance method
  number = "#F2C4B3",         -- number
  class = "#C9CCCD",          -- class name, static field, doc comment type
  comment = "#5D6976",        -- comment, doc comment tag (bold), doc comment text

  -- String literals
  string_literal_fg = "#A5C25C",  -- string literal foreground (backticks)
  string_literal_bg = "#5E6465",  -- string literal background

  -- UI colors
  gutter = "#172030",         -- gutter, sign background
  line_nr = "#465063",        -- line number
  cursor_line_fg = "#A4A3A3", -- caret line
  cursor_line_bg = "#1E2A3E", -- caret line background

  -- Diff colors
  diff_add_bg = "#082F3B",    -- diff add background
  diff_remove_bg = "#4B2234", -- diff remove background
  diff_change_bg = "#45302B", -- diff change background
  diff_add = "#57A464",       -- diff add
  diff_change = "#43698D",    -- diff change
  diff_delete = "#DB7090",    -- diff delete

  -- HTML colors
  html_tag = "#FFAE8F",       -- html tags
  html_attr = "#D0D6B5",      -- html tag attributes
  html_attr_alt = "#CDD3D3",  -- html tag attributes

  -- Semantic colors
  error = "#FF4262",          -- error text
  warning = "#FFAE8F",        -- warning (using html_tag color)
  info = "#73A7A7",           -- info (using string color)
  hint = "#9876AA",           -- hint (using variable color)
  link = "#02858E",           -- links

  -- Git/VCS
  git_add = "#57A464",
  git_change = "#43698D",
  git_delete = "#DB7090",

  -- Selection/Visual
  selection = "#1E2A3E",
  search = "#F2C4B3",

  -- Popup menu
  pmenu_bg = "#1E2A3E",
  pmenu_fg = "#C9CCCD",
  pmenu_sel_bg = "#172030",
  pmenu_sel_fg = "#9876AA",

  -- Borders and separators
  border = "#465063",
  win_separator = "#1E2A3E",
}

function M.setup(opts)
  opts = opts or {}
  local palette = vim.tbl_deep_extend("force", {}, M.carbon, opts.palette or {})
  return palette
end

return M
