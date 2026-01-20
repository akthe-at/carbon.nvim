-- Lualine theme for Carbon

local palette = require("carbon.palette")
local config = require("carbon.config")
local style = vim.o.background == "light" and config.STYLES.CARBON_DAY or config.STYLES.CARBON
local colors = palette.setup({ style = style })

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
		a = { fg = colors.bg, bg = colors.html_tag, gui = "bold" },
		b = { fg = colors.fg, bg = colors.cursor_line_bg },
		c = { fg = colors.fg, bg = colors.cursor_line_bg },
	},
	replace = {
		a = { fg = colors.bg, bg = colors.keyword, gui = "bold" },
		b = { fg = colors.fg, bg = colors.cursor_line_bg },
		c = { fg = colors.fg, bg = colors.cursor_line_bg },
	},
	command = {
		a = { fg = colors.bg, bg = colors.identifier, gui = "bold" },
		b = { fg = colors.fg, bg = colors.cursor_line_bg },
		c = { fg = colors.fg, bg = colors.cursor_line_bg },
	},
	inactive = {
		a = { fg = colors.fg, bg = colors.cursor_line_bg },
		b = { fg = colors.fg, bg = colors.cursor_line_bg },
		c = { fg = colors.fg, bg = colors.cursor_line_bg },
	},
}
