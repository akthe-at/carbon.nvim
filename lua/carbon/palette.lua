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
---@field parameter string
---@field string_literal_fg string
---@field string_literal_bg string
---@field gutter string
---@field line_nr string
---@field info string
---@field diff_add_bg string
---@field diff_remove_bg string
---@field diff_change_bg string
---@field cursor_line_fg string
---@field cursor_line_bg string
---@field html_tag string
---@field html_attr string
---@field html_attr_alt string
---@field css_attr string
---@field error string
---@field link string
---@field git_add string
---@field git_change string
---@field git_delete string
---@field diff_add string
---@field diff_change string
---@field diff_delete string
---@field indent_guide string

local M = {}

-- Dark variant (default)
---@type CarbonPalette
M.carbon = {
	none = "NONE",

	-- Base colors
	bg = "#172030",
	bg_dark = "#0F1520",
	fg = "#BAC8CB",
	fg_dark = "#657778",

	-- Syntax colors
	keyword = "#DB6E89", -- keyword, operation
	variable = "#c9cccd", -- variable, constant identifier, doc comment param
	--variable = "#9876AA", -- variable, constant identifier, doc comment param
	--identifier = "#B87EA2", -- identifier
	identifier = "#9ccccd", -- identifier
	string = "#73A7A7", -- string
	func = "#F9B5AC", -- function call, instance method
	number = "#F2C4B3", -- number
	class = "#C9CCCD", -- class name, static field, doc comment type
	comment = "#5D6976", -- comment, doc comment tag (bold), doc comment text

	-- String literals
	string_literal_fg = "#A5C25C", -- string literal foreground (backticks)
	string_literal_bg = "#5E6465", -- string literal background

	-- UI colors
	gutter = "#172030", -- gutter, sign background (intelliJ)
	line_nr = "#465063", -- line number (intelliJ)
	cursor_line_fg = "#A4A3A3", -- caret line
	cursor_line_bg = "#1E2A3E", -- caret line background (inactiveBackground)
	cursor = "#305e80", -- cursor block color

	-- Diff colors
	diff_add_bg = "#082f3b", -- diff add background
	diff_remove_bg = "#4B2234", -- diff remove background
	diff_change_bg = "#1e2a3e", -- diff change background
	diff_add = "#52b455", -- diff add
	diff_change = "#43698D", -- diff change
	diff_delete = "#DB7090", -- diff delete

	-- HTML colors
	html_tag = "#ffae8f", -- html tags
	html_attr = "#c9cccd", -- html tag attributes
	html_attr_alt = "#CDD3D3", -- html tag attributes
	css_attr = "#a3e0de", -- css attributes
	css_class_name = "#f9b5ac",
	css_color = "#db7090",
	css_function = "#d0d6b5",
	css_hash = "#02858e",
	css_indent = "#d0d6b5",
	css_tag = "#ffae8f",
	css_braces = "#f9b5ac",

	-- Semantic colors
	error = "#af304a", -- error text
	warning = "#e1d89f", -- warning (from IntelliJ version)
	info = "#bac8cb", -- info (information foreground from IntelliJ version)
	hint = "#7e8796", -- hint (from IntelliJ version)
	link = "#02858E", -- links (original teal accent)
	parameter = "#D0D6B5", -- function parameters (from IntelliJ version)
	constant = "#716994", -- constants (from IntelliJ version)
	bracket = "#DB6378", -- brackets, semicolons, delimiters (from IntelliJ version)

	-- Git/VCS
	git_add = "#57a464",
	git_change = "#43698d",
	git_delete = "#db7090",

	-- Selection/Visual
	selection = "#0A677A",
	search = "#E1E797",

	-- Popup menu
	pmenu_bg = "#1E2A3E",
	pmenu_fg = "#BAC8CB",
	pmenu_sel_bg = "#074855",
	pmenu_sel_fg = "#FDF6E3",

	-- Borders and separators
	border = "#bac8cb",
	win_separator = "#213047",
	indent_guide = "#02858e",

	-- Accent colors (from IntelliJ version)
	accent = "#02858E",
	focus = "#0C9294",
}

-- Light/Day variant
---@type CarbonPalette
M.carbon_day = {
	none = "NONE",

	-- Base colors (warm paper/cream tint)
	bg = "#F0E0D0",
	bg_dark = "#E5D5C5",
	fg = "#2E3440",
	fg_dark = "#8A9199",

	-- Syntax colors (darkened for light background)
	keyword = "#C04D6B", -- keyword, operation
	variable = "#7B5E99", -- variable, constant identifier, doc comment param
	identifier = "#9E5E8A", -- identifier
	string = "#4D8A8A", -- string
	func = "#D08770", -- function call, instance method
	number = "#BF7449", -- number
	class = "#4C566A", -- class name, static field, doc comment type
	comment = "#8A9199", -- comment

	-- String literals
	string_literal_fg = "#7B9E3A", -- string literal foreground
	string_literal_bg = "#E0D0C0", -- string literal background (warm tint)

	-- UI colors
	gutter = "#F0E0D0", -- gutter, sign background
	line_nr = "#9BA3AF", -- line number
	cursor_line_fg = "#2E3440", -- caret line
	cursor_line_bg = "#C5B5A0", -- caret line background (stronger contrast)
	cursor = "#D08770", -- cursor block color (salmon accent)

	-- Diff colors
	diff_add_bg = "#D8F0D8", -- diff add background
	diff_remove_bg = "#F5D8D8", -- diff remove background
	diff_change_bg = "#FFF0D0", -- diff change background
	diff_add = "#3D8C48", -- diff add
	diff_change = "#3366A0", -- diff change
	diff_delete = "#C04D6B", -- diff delete

	-- HTML colors
	html_tag = "#D08770", -- html tags
	html_attr = "#8A7B40", -- html tag attributes
	html_attr_alt = "#5E6976", -- html tag attributes

	-- Semantic colors
	error = "#D32F2F", -- error text
	warning = "#D08770", -- warning
	info = "#0A7285", -- info (teal accent darkened for light bg)
	hint = "#7B5E99", -- hint
	link = "#0A7285", -- links (teal accent darkened for light bg)
	parameter = "#BF7449", -- function parameters

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
	indent_guide = "#0A7285",

	-- CSS colors (matching dark theme)
	css_attr = "#6B9A9A",
	css_class_name = "#D08770",
	css_color = "#C04D6B",
	css_function = "#BF7449",
	css_hash = "#0A7285",
	css_indent = "#BF7449",
	css_tag = "#D08770",
	css_braces = "#D08770",
}

-- High contrast dark variant
---@type CarbonPalette
M.carbon_contrast = {
	none = "NONE",

	-- Base colors (higher contrast)
	bg = "#0D1520",
	bg_dark = "#050A10",
	fg = "#D5E5E8",
	fg_dark = "#758890",

	-- Syntax colors (more vibrant)
	keyword = "#F07899",
	variable = "#E0A0C0",
	identifier = "#B0E0E0",
	string = "#85C0C0",
	func = "#FFB8AC",
	number = "#FFD4C3",
	class = "#E0E5E8",
	comment = "#6D7985",

	-- String literals
	string_literal_fg = "#B5D86C",
	string_literal_bg = "#6E7475",

	-- UI colors
	gutter = "#0D1520",
	line_nr = "#566073",
	cursor_line_fg = "#B4B3B3",
	cursor_line_bg = "#253548",
	cursor = "#4080B0",

	-- Diff colors
	diff_add_bg = "#0A3F4B",
	diff_remove_bg = "#5B2844",
	diff_change_bg = "#253548",
	diff_add = "#62C465",
	diff_change = "#5389BD",
	diff_delete = "#FB80A0",

	-- HTML colors
	html_tag = "#FFBE9F",
	html_attr = "#D9DCDD",
	html_attr_alt = "#DDD3D3",
	css_attr = "#B3F0EE",
	css_class_name = "#FFB8AC",
	css_color = "#FB80A0",
	css_function = "#E0E6C5",
	css_hash = "#1295A0",
	css_indent = "#E0E6C5",
	css_tag = "#FFBE9F",
	css_braces = "#FFB8AC",

	-- Semantic colors
	error = "#CF4060",
	warning = "#F1E8AF",
	info = "#D5E5E8",
	hint = "#8E97A6",
	link = "#1295A0",
	parameter = "#E0E6C5",
	constant = "#8179A4",
	bracket = "#FB7388",

	-- Git/VCS
	git_add = "#67B474",
	git_change = "#5389BD",
	git_delete = "#FB80A0",

	-- Selection/Visual
	selection = "#1A7788",
	search = "#F1F7A7",

	-- Popup menu
	pmenu_bg = "#253548",
	pmenu_fg = "#D5E5E8",
	pmenu_sel_bg = "#0A5865",
	pmenu_sel_fg = "#FFF8F5",

	-- Borders and separators
	border = "#D5E5E8",
	win_separator = "#314057",
	indent_guide = "#1295A0",

	-- Accent colors
	accent = "#1295A0",
	focus = "#1CA2A4",
}

-- Cool neutral light variant
---@type CarbonPalette
M.carbon_day_neutral = {
	none = "NONE",

	-- Base colors (cool neutral)
	bg = "#FAFAFA",
	bg_dark = "#F0F0F0",
	fg = "#2E3440",
	fg_dark = "#8A9199",

	-- Syntax colors
	keyword = "#C04D6B",
	variable = "#7B5E99",
	identifier = "#9E5E8A",
	string = "#4D8A8A",
	func = "#D08770",
	number = "#BF7449",
	class = "#4C566A",
	comment = "#8A9199",

	-- String literals
	string_literal_fg = "#7B9E3A",
	string_literal_bg = "#F0F0F0",

	-- UI colors
	gutter = "#FAFAFA",
	line_nr = "#9BA3AF",
	cursor_line_fg = "#2E3440",
	cursor_line_bg = "#E8E8E8",
	cursor = "#D08770",

	-- Diff colors
	diff_add_bg = "#E0F5E0",
	diff_remove_bg = "#FFE0E0",
	diff_change_bg = "#FFF8E0",
	diff_add = "#3D8C48",
	diff_change = "#3366A0",
	diff_delete = "#C04D6B",

	-- HTML colors
	html_tag = "#D08770",
	html_attr = "#8A7B40",
	html_attr_alt = "#5E6976",

	-- CSS colors
	css_attr = "#4D8A8A",
	css_class_name = "#D08770",
	css_color = "#C04D6B",
	css_function = "#BF7449",
	css_hash = "#0A7285",
	css_indent = "#BF7449",
	css_tag = "#D08770",
	css_braces = "#D08770",

	-- Semantic colors
	error = "#D32F2F",
	warning = "#D08770",
	info = "#0A7285",
	hint = "#7B5E99",
	link = "#0A7285",
	parameter = "#BF7449",

	-- Git/VCS
	git_add = "#3D8C48",
	git_change = "#3366A0",
	git_delete = "#C04D6B",

	-- Selection/Visual
	selection = "#E0E0E0",
	search = "#FFEBB0",

	-- Popup menu
	pmenu_bg = "#F0F0F0",
	pmenu_fg = "#2E3440",
	pmenu_sel_bg = "#E0E0E0",
	pmenu_sel_fg = "#D08770",

	-- Borders and separators
	border = "#D0D0D0",
	win_separator = "#E8E8E8",
	indent_guide = "#0A7285",
}

-- High contrast light variant
---@type CarbonPalette
M.carbon_day_contrast = {
	none = "NONE",

	-- Base colors (maximum contrast)
	bg = "#FFFFFF",
	bg_dark = "#F5F5F5",
	fg = "#000000",
	fg_dark = "#606060",

	-- Syntax colors (darker, more saturated)
	keyword = "#A03050",
	variable = "#5B3E79",
	identifier = "#7E3E6A",
	string = "#2D6A6A",
	func = "#B06750",
	number = "#9F5429",
	class = "#2C3640",
	comment = "#6A7179",

	-- String literals
	string_literal_fg = "#5B7E1A",
	string_literal_bg = "#F8F8F8",

	-- UI colors
	gutter = "#FFFFFF",
	line_nr = "#7B838F",
	cursor_line_fg = "#000000",
	cursor_line_bg = "#E0E0E0",
	cursor = "#B06750",

	-- Diff colors
	diff_add_bg = "#D0F0D0",
	diff_remove_bg = "#FFD0D0",
	diff_change_bg = "#FFF0C0",
	diff_add = "#2D7C38",
	diff_change = "#235690",
	diff_delete = "#A03050",

	-- HTML colors
	html_tag = "#B06750",
	html_attr = "#6A5B20",
	html_attr_alt = "#4E5966",

	-- CSS colors
	css_attr = "#2D6A6A",
	css_class_name = "#B06750",
	css_color = "#A03050",
	css_function = "#9F5429",
	css_hash = "#0A6275",
	css_indent = "#9F5429",
	css_tag = "#B06750",
	css_braces = "#B06750",

	-- Semantic colors
	error = "#C01010",
	warning = "#B06750",
	info = "#0A6275",
	hint = "#5B3E79",
	link = "#0A6275",
	parameter = "#9F5429",

	-- Git/VCS
	git_add = "#2D7C38",
	git_change = "#235690",
	git_delete = "#A03050",

	-- Selection/Visual
	selection = "#D0D0D0",
	search = "#FFE090",

	-- Popup menu
	pmenu_bg = "#F5F5F5",
	pmenu_fg = "#000000",
	pmenu_sel_bg = "#D0D0D0",
	pmenu_sel_fg = "#B06750",

	-- Borders and separators
	border = "#B0B0B0",
	win_separator = "#E0E0E0",
	indent_guide = "#0A6275",
}

---@param style? string "carbon", "carbon_day", "carbon_contrast", "carbon_day_neutral", or "carbon_day_contrast"
function M.setup(opts)
	opts = opts or {}
	local style = opts.style or "carbon"
	local base = M[style] or M.carbon
	local palette = vim.tbl_deep_extend("force", {}, base, opts.palette or {})
	return palette
end

return M
