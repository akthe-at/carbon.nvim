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

  local config = M.config.extend(opts)
  local style = config.style or M.config.STYLES.CARBON
  local is_auto = style == M.config.STYLES.AUTO

  if is_auto then
    if vim.o.background == "light" then
      style = config.light_variant or M.config.STYLES.CARBON_DAY
    else
      style = config.dark_variant or M.config.STYLES.CARBON
    end
  end

  local is_light = style == M.config.STYLES.CARBON_DAY
    or style == M.config.STYLES.CARBON_DAY_NEUTRAL
    or style == M.config.STYLES.CARBON_DAY_CONTRAST

  if is_light then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end

  vim.g.colors_name = style:gsub("_", "-")

  local palette = require("carbon.palette")
  local colors = palette.setup({ style = style, palette = config.palette })

  -- Allow user to customize colors
  local on_colors = config.on_colors or function() end
  on_colors(colors)

  local theme = require("carbon.theme").setup(colors, config)

  local before_highlight = config.before_highlight or function() end

  -- Apply highlights
  for group, hl in pairs(theme.highlights) do
    if type(hl) == "table" then
      before_highlight(group, hl, colors)
    end

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

  -- Lualine owns its ColorScheme refresh and the user's selected theme.
  -- Clear our cached palettes so explicit Carbon themes resolve the new variant.
  package.loaded["lualine.themes.carbon"] = nil
  package.loaded["lualine.themes.carbon-day"] = nil

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
