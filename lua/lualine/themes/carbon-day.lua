-- Lualine theme for Carbon Day (light variant)

local palette = require("carbon.palette")
local colors = palette.setup({ style = "carbon_day" })

return {
	normal = {
		a = { fg = colors.bg, bg = colors.string, gui = "bold" },
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
		a = { fg = colors.bg, bg = colors.variable, gui = "bold" },
		b = { fg = colors.fg, bg = colors.cursor_line_bg },
		c = { fg = colors.fg, bg = colors.cursor_line_bg },
	},
	inactive = {
		a = { fg = colors.fg, bg = colors.cursor_line_bg },
		b = { fg = colors.fg, bg = colors.cursor_line_bg },
		c = { fg = colors.fg, bg = colors.cursor_line_bg },
	},
}
