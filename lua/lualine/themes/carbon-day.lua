-- Lualine theme for Carbon Day (light variant)

local palette = require("carbon.palette")
local config = require("carbon.config")

local function resolve_style()
	local name = (vim.g.colors_name or ""):gsub("-", "_")
	if name == "" then
		return config.STYLES.CARBON_DAY
	end
	return name
end

local colors = palette.setup({ style = resolve_style() })

return {
	normal = {
		a = { fg = colors.bg, bg = colors.selection, gui = "bold" },
		b = { fg = colors.fg, bg = colors.cursor_line_bg },
		c = { fg = colors.fg, bg = colors.cursor_line_bg },
	},
	insert = {
		a = { fg = colors.bg, bg = colors.git_add, gui = "bold" },
		b = { fg = colors.fg, bg = colors.cursor_line_bg },
		c = { fg = colors.fg, bg = colors.cursor_line_bg },
	},
	visual = {
		a = { fg = colors.bg, bg = colors.func, gui = "bold" },
		b = { fg = colors.fg, bg = colors.cursor_line_bg },
		c = { fg = colors.fg, bg = colors.cursor_line_bg },
	},
	replace = {
		a = { fg = colors.bg, bg = colors.keyword, gui = "bold" },
		b = { fg = colors.fg, bg = colors.cursor_line_bg },
		c = { fg = colors.fg, bg = colors.cursor_line_bg },
	},
	command = {
		a = { fg = colors.bg, bg = colors.info, gui = "bold" },
		b = { fg = colors.fg, bg = colors.cursor_line_bg },
		c = { fg = colors.fg, bg = colors.cursor_line_bg },
	},
	inactive = {
		a = { fg = colors.fg, bg = colors.cursor_line_bg },
		b = { fg = colors.fg, bg = colors.cursor_line_bg },
		c = { fg = colors.fg, bg = colors.cursor_line_bg },
	},
}
