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

-- Dark variant (default)
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
  cursor_line_bg = "#2D3F55", -- caret line background

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
  link = "#5AC4C4",           -- links (brightened for visibility)
  parameter = "#F2C4B3",      -- function parameters (using number color)

  -- Git/VCS
  git_add = "#57A464",
  git_change = "#43698D",
  git_delete = "#DB7090",

  -- Selection/Visual
  selection = "#2D3F55",
  search = "#F2C4B3",

  -- Popup menu
  pmenu_bg = "#1E2A3E",
  pmenu_fg = "#C9CCCD",
  pmenu_sel_bg = "#2D3F55",
  pmenu_sel_fg = "#F9B5AC",

  -- Borders and separators
  border = "#465063",
  win_separator = "#1E2A3E",
}

-- Light/Day variant
---@type CarbonPalette
M.carbon_day = {
  none = "NONE",

  -- Base colors (warm paper/cream tint)
  bg = "#F0E0D0",
  fg = "#2E3440",

  -- Syntax colors (darkened for light background)
  keyword = "#C04D6B",        -- keyword, operation
  variable = "#7B5E99",       -- variable, constant identifier, doc comment param
  identifier = "#9E5E8A",     -- identifier
  string = "#4D8A8A",         -- string
  func = "#D08770",           -- function call, instance method
  number = "#BF7449",         -- number
  class = "#4C566A",          -- class name, static field, doc comment type
  comment = "#8A9199",        -- comment

  -- String literals
  string_literal_fg = "#7B9E3A",  -- string literal foreground
  string_literal_bg = "#E0D0C0",  -- string literal background (warm tint)

  -- UI colors
  gutter = "#F0E0D0",         -- gutter, sign background
  line_nr = "#9BA3AF",        -- line number
  cursor_line_fg = "#2E3440", -- caret line
  cursor_line_bg = "#D5C5B0", -- caret line background (stronger contrast)

  -- Diff colors
  diff_add_bg = "#D8F0D8",    -- diff add background
  diff_remove_bg = "#F5D8D8", -- diff remove background
  diff_change_bg = "#FFF0D0", -- diff change background
  diff_add = "#3D8C48",       -- diff add
  diff_change = "#3366A0",    -- diff change
  diff_delete = "#C04D6B",    -- diff delete

  -- HTML colors
  html_tag = "#D08770",       -- html tags
  html_attr = "#8A7B40",      -- html tag attributes
  html_attr_alt = "#5E6976",  -- html tag attributes

  -- Semantic colors
  error = "#D32F2F",          -- error text
  warning = "#D08770",        -- warning
  info = "#4D8A8A",           -- info
  hint = "#7B5E99",           -- hint
  link = "#0277BD",           -- links
  parameter = "#BF7449",      -- function parameters

  -- Git/VCS
  git_add = "#3D8C48",
  git_change = "#3366A0",
  git_delete = "#C04D6B",

  -- Selection/Visual
  selection = "#D5C5B5",
  search = "#FFE0A0",

  -- Popup menu
  pmenu_bg = "#E5D5C5",
  pmenu_fg = "#2E3440",
  pmenu_sel_bg = "#D5C5B5",
  pmenu_sel_fg = "#D08770",

  -- Borders and separators
  border = "#C0B0A0",
  win_separator = "#DDD0C0",
}

---@param style? string "carbon" or "carbon_day"
function M.setup(opts)
  opts = opts or {}
  local style = opts.style or "carbon"
  local base = M[style] or M.carbon
  local palette = vim.tbl_deep_extend("force", {}, base, opts.palette or {})
  return palette
end

return M
