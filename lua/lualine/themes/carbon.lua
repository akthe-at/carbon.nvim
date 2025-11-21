-- Lualine theme for Carbon
-- This integrates with the Carbon colorscheme

local colors = {
  bg = "#172030",
  fg = "#C9CCCD",
  yellow = "#D0D6B5",
  cyan = "#73A7A7",
  green = "#57A464",
  orange = "#FFAE8F",
  magenta = "#B87EA2",
  blue = "#43698D",
  red = "#DB6E89",
  inactive = "#1E2A3E",
}

return {
  normal = {
    a = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
    b = { fg = colors.fg, bg = colors.inactive },
    c = { fg = colors.fg, bg = colors.inactive },
  },
  insert = {
    a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
    b = { fg = colors.fg, bg = colors.inactive },
    c = { fg = colors.fg, bg = colors.inactive },
  },
  visual = {
    a = { fg = colors.bg, bg = colors.orange, gui = "bold" },
    b = { fg = colors.fg, bg = colors.inactive },
    c = { fg = colors.fg, bg = colors.inactive },
  },
  replace = {
    a = { fg = colors.orange, bg = "#4B2234", gui = "bold" },
    b = { fg = colors.fg, bg = colors.inactive },
    c = { fg = colors.fg, bg = colors.inactive },
  },
  command = {
    a = { fg = colors.bg, bg = colors.magenta, gui = "bold" },
    b = { fg = colors.fg, bg = colors.inactive },
    c = { fg = colors.fg, bg = colors.inactive },
  },
  inactive = {
    a = { fg = colors.fg, bg = colors.inactive },
    b = { fg = colors.fg, bg = colors.inactive },
    c = { fg = colors.fg, bg = colors.inactive },
  },
}
