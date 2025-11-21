local M = {}

M.config = require("carbon.config")

---Setup carbon colorscheme
---@param opts? CarbonConfig
function M.setup(opts)
  M.config.setup(opts)
end

---Load the colorscheme
---@param opts? CarbonConfig
function M.load(opts)
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "carbon"
  vim.o.background = "dark"

  local config = M.config.extend(opts)
  local palette = require("carbon.palette")
  local colors = palette.setup({ palette = config.palette })

  -- Allow user to customize colors
  config.on_colors(colors)

  local theme = require("carbon.theme").setup(colors, config)

  -- Apply highlights
  for group, hl in pairs(theme.highlights) do
    if type(hl) == "string" then
      vim.api.nvim_set_hl(0, group, { link = hl })
    else
      vim.api.nvim_set_hl(0, group, hl)
    end
  end

  -- Set terminal colors
  if config.terminal_colors then
    M.terminal(colors)
  end
end

---Set terminal colors
---@param colors CarbonPalette
function M.terminal(colors)
  -- Black
  vim.g.terminal_color_0 = colors.bg
  vim.g.terminal_color_8 = colors.comment

  -- Red
  vim.g.terminal_color_1 = colors.keyword
  vim.g.terminal_color_9 = colors.error

  -- Green
  vim.g.terminal_color_2 = colors.git_add
  vim.g.terminal_color_10 = colors.string_literal_fg

  -- Yellow
  vim.g.terminal_color_3 = colors.html_tag
  vim.g.terminal_color_11 = colors.html_attr

  -- Blue
  vim.g.terminal_color_4 = colors.git_change
  vim.g.terminal_color_12 = colors.info

  -- Magenta
  vim.g.terminal_color_5 = colors.identifier
  vim.g.terminal_color_13 = colors.variable

  -- Cyan
  vim.g.terminal_color_6 = colors.string
  vim.g.terminal_color_14 = colors.link

  -- White
  vim.g.terminal_color_7 = colors.fg
  vim.g.terminal_color_15 = colors.class
end

return M
