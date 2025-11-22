-- Lualine theme for Carbon Day (light variant)

local colors = {
	bg = "#F0E0D0",
	fg = "#2E3440",
	keyword = "#C04D6B",
	variable = "#7B5E99",
	string = "#4D8A8A",
	func = "#D08770",
	git_add = "#3D8C48",
	inactive = "#E0D0C0",
}

return {
	normal = {
		a = { fg = colors.bg, bg = colors.string, gui = "bold" },
		b = { fg = colors.fg, bg = colors.inactive },
		c = { fg = colors.fg, bg = colors.inactive },
	},
	insert = {
		a = { fg = colors.bg, bg = colors.git_add, gui = "bold" },
		b = { fg = colors.fg, bg = colors.inactive },
		c = { fg = colors.fg, bg = colors.inactive },
	},
	visual = {
		a = { fg = colors.bg, bg = colors.func, gui = "bold" },
		b = { fg = colors.fg, bg = colors.inactive },
		c = { fg = colors.fg, bg = colors.inactive },
	},
	replace = {
		a = { fg = colors.bg, bg = colors.keyword, gui = "bold" },
		b = { fg = colors.fg, bg = colors.inactive },
		c = { fg = colors.fg, bg = colors.inactive },
	},
	command = {
		a = { fg = colors.bg, bg = colors.variable, gui = "bold" },
		b = { fg = colors.fg, bg = colors.inactive },
		c = { fg = colors.fg, bg = colors.inactive },
	},
	inactive = {
		a = { fg = colors.fg, bg = colors.inactive },
		b = { fg = colors.fg, bg = colors.inactive },
		c = { fg = colors.fg, bg = colors.inactive },
	},
}
