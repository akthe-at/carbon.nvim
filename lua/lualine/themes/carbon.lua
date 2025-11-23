-- Lualine theme for Carbon

local M = {}

-- Dark theme colors
local dark = {
	bg = "#172030",
	fg = "#BAC8CB",
	yellow = "#E1E797",
	cyan = "#02858E",
	green = "#57A464",
	peach = "#FFAE8F",
	magenta = "#B87EA2",
	blue = "#0A677A",
	red = "#DB6E89",
	inactive = "#1E2A3E",
}

-- Light theme colors (warm paper/cream tint)
local light = {
	bg = "#F0E0D0",
	fg = "#2E3440",
	yellow = "#705A20",
	cyan = "#2B6B6B",
	green = "#2D7040",
	peach = "#D08770",
	magenta = "#6A2A90",
	blue = "#1E4E80",
	red = "#A03050",
	inactive = "#E0D0C0",
}

function M.get_theme()
	local colors = vim.o.background == "light" and light or dark

	return {
		normal = {
			a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
			b = { fg = colors.fg, bg = colors.inactive },
			c = { fg = colors.fg, bg = colors.inactive },
		},
		insert = {
			a = { fg = colors.bg, bg = colors.green, gui = "bold" },
			b = { fg = colors.fg, bg = colors.inactive },
			c = { fg = colors.fg, bg = colors.inactive },
		},
		visual = {
			a = { fg = colors.bg, bg = colors.peach, gui = "bold" },
			b = { fg = colors.fg, bg = colors.inactive },
			c = { fg = colors.fg, bg = colors.inactive },
		},
		replace = {
			a = { fg = colors.bg, bg = colors.red, gui = "bold" },
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
end

return M.get_theme()
