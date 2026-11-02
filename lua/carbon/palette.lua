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
	fg_dark = "#859494",

	-- Syntax colors
	keyword = "#DB6E89", -- keyword, operation
	variable = "#C9CCCD", -- variable, constant identifier, doc comment param
	--variable = "#9876AA", -- variable, constant identifier, doc comment param
	--identifier = "#B87EA2", -- identifier
	identifier = "#9ccccd", -- identifier
	string = "#73a7a7", -- string
	func = "#F9B5AC", -- function call, instance method
	number = "#f2c4b3", -- number
	class = "#8EB4DF", -- class name, static field, doc comment type
	comment = "#687480", -- comment, doc comment tag (bold), doc comment text

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
	diff_add_bg = "#072E3A", -- diff add background
	diff_remove_bg = "#451C2E", -- diff remove background
	diff_change_bg = "#1e2a3e", -- diff change background
	diff_add = "#52b455", -- diff add
	diff_change = "#9BBBDD", -- diff change
	diff_delete = "#DB7090", -- diff delete

	-- HTML colors
	html_tag = "#ffae8f", -- html tags
	html_attr = "#d79b82", -- html tag attributes
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
	error = "#FF7670", -- error text
	warning = "#C7AE70", -- warning (from IntelliJ version)
	info = "#75B9D1", -- info (information foreground from IntelliJ version)
	hint = "#88919e", -- hint (from IntelliJ version)
	link = "#379fa6", -- links (original teal accent)
	parameter = "#d79b82", -- function parameters (from IntelliJ version)
	constant = "#928cad", -- constants (from IntelliJ version)
	bracket = "#8C9BAA", -- brackets, semicolons, delimiters (from IntelliJ version)

	-- Git/VCS
	git_add = "#57a464",
	git_change = "#7893ad",
	git_delete = "#db7090",

	-- Selection/Visual
	selection = "#174859",
	search = "#E1E797",

	-- Popup menu
	pmenu_bg = "#1E2A3E",
	pmenu_fg = "#BAC8CB",
	pmenu_sel_bg = "#074855",
	pmenu_sel_fg = "#FDF6E3",

	-- Borders and separators
	border = "#465A70",
	win_separator = "#213047",
	indent_guide = "#02858e",

	-- Accent colors (from IntelliJ version)
	accent = "#02858E",
	focus = "#0C9294",
	panel_bg = "#1E2A3E",
	float_bg = "#111A28",
	match_bg = "#304158",
}

-- Light/Day variant
---@type CarbonPalette
M.carbon_day = {
	none = "NONE",

	-- Base colors (warm paper/cream tint)
	bg = "#F0E0D0",
	bg_dark = "#E5D5C5",
	fg = "#2E3440",
	fg_dark = "#5a5e63",

	-- Syntax colors (darkened for light background)
	keyword = "#C04D6B", -- keyword, operation
	variable = "#7B5E99", -- variable, constant identifier, doc comment param
	identifier = "#9E5E8A", -- identifier
	string = "#326666", -- string
	func = "#8C4535", -- function call, instance method
	number = "#8d4e2a", -- number
	class = "#355B85", -- class name, static field, doc comment type
	comment = "#777a80", -- comment

	-- String literals
	string_literal_fg = "#7B9E3A", -- string literal foreground
	string_literal_bg = "#E0D0C0", -- string literal background (warm tint)

	-- UI colors
	gutter = "#F0E0D0", -- gutter, sign background
	line_nr = "#9BA3AF", -- line number
	cursor_line_fg = "#2E3440", -- caret line
	cursor_line_bg = "#E8D8C8", -- caret line background (stronger contrast)
	cursor = "#0A4F65", -- cursor block color (darker teal for stronger contrast)

	-- Diff colors
	diff_add_bg = "#F2FFF2", -- diff add background
	diff_remove_bg = "#FFFBFB", -- diff remove background
	diff_change_bg = "#FFFDDD", -- diff change background
	diff_add = "#3D8C48", -- diff add
	diff_change = "#3366A0", -- diff change
	diff_delete = "#C04D6B", -- diff delete

	-- HTML colors
	html_tag = "#8C4535", -- html tags
	html_attr = "#7e3d25", -- html tag attributes
	html_attr_alt = "#5E6976", -- html tag attributes

	-- Semantic colors
	error = "#B50000", -- error text
	warning = "#76520F", -- warning
	info = "#0A7285", -- info (teal accent darkened for light bg)
	hint = "#6c5387", -- hint
	link = "#096778", -- links (teal accent darkened for light bg)
	parameter = "#7e3d25", -- function parameters

	-- Git/VCS
	git_add = "#2e6a37",
	git_change = "#306096",
	git_delete = "#C04D6B",

	-- Selection/Visual
	selection = "#D5C5B5",
	search = "#FFE0A0",

	-- Popup menu
	pmenu_bg = "#E5D5C5",
	pmenu_fg = "#2E3440",
	pmenu_sel_bg = "#D5C5B5",
	pmenu_sel_fg = "#703B2D",

	-- Borders and separators
	border = "#A29385",
	win_separator = "#DDD0C0",
	indent_guide = "#0A7285",

	-- CSS colors (matching dark theme)
	css_attr = "#6B9A9A",
	css_class_name = "#8C4535",
	css_color = "#C04D6B",
	css_function = "#BF7449",
	css_hash = "#0A7285",
	css_indent = "#BF7449",
	css_tag = "#8C4535",
	css_braces = "#8C4535",
	bracket = "#656874",

	panel_bg = "#FFFCEC",
	float_bg = "#FFFCEE",
	match_bg = "#D5C5B5",
}

-- High contrast dark variant
---@type CarbonPalette
M.carbon_contrast = {
	none = "NONE",

	-- Base colors (higher contrast)
	bg = "#0D1520",
	bg_dark = "#050A10",
	fg = "#D5E5E8",
	fg_dark = "#8f9fa5",

	-- Syntax colors (more vibrant)
	keyword = "#F07899",
	variable = "#DFE3E5",
	identifier = "#B0E0E0",
	string = "#85c0c0",
	func = "#FFB8AC",
	number = "#ffd4c3",
	class = "#A1C9F5",
	comment = "#737e8a",

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
	diff_add_bg = "#063B47",
	diff_remove_bg = "#572440",
	diff_change_bg = "#253548",
	diff_add = "#62C465",
	diff_change = "#A8CEF2",
	diff_delete = "#FB80A0",

	-- HTML colors
	html_tag = "#FFBE9F",
	html_attr = "#e3b299",
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
	error = "#FF9180",
	warning = "#DBC181",
	info = "#8ACDE5",
	hint = "#949caa",
	link = "#41aab3",
	parameter = "#e3b299",
	constant = "#9e98b9",
	bracket = "#A2B3C2",

	-- Git/VCS
	git_add = "#67b474",
	git_change = "#75a1ca",
	git_delete = "#FB80A0",

	-- Selection/Visual
	selection = "#205568",
	search = "#F1F7A7",

	-- Popup menu
	pmenu_bg = "#253548",
	pmenu_fg = "#D5E5E8",
	pmenu_sel_bg = "#0A5865",
	pmenu_sel_fg = "#FFF8F5",

	-- Borders and separators
	border = "#5B7188",
	win_separator = "#314057",
	indent_guide = "#1295A0",

	-- Accent colors
	accent = "#1295A0",
	focus = "#1CA2A4",
	panel_bg = "#1B293B",
	float_bg = "#080F19",
	match_bg = "#304158",
}

-- Cool neutral light variant
---@type CarbonPalette
M.carbon_day_neutral = {
	none = "NONE",

	-- Base colors (cool neutral)
	bg = "#FAFAFA",
	bg_dark = "#F0F0F0",
	fg = "#2E3440",
	fg_dark = "#63686e",

	-- Syntax colors
	keyword = "#C04D6B",
	variable = "#7B5E99",
	identifier = "#9E5E8A",
	string = "#3e7070",
	func = "#964E3C",
	number = "#955a39",
	class = "#3C608B",
	comment = "#7f858d",

	-- String literals
	string_literal_fg = "#7B9E3A",
	string_literal_bg = "#F0F0F0",

	-- UI colors
	gutter = "#FAFAFA",
	line_nr = "#9BA3AF",
	cursor_line_fg = "#2E3440",
	cursor_line_bg = "#E8E8E8",
	cursor = "#0A4F65",

	-- Diff colors
	diff_add_bg = "#F2FFF2",
	diff_remove_bg = "#FFFBFB",
	diff_change_bg = "#FFFDE5",
	diff_add = "#3D8C48",
	diff_change = "#3366A0",
	diff_delete = "#C04D6B",

	-- HTML colors
	html_tag = "#964E3C",
	html_attr = "#9b5637",
	html_attr_alt = "#5E6976",

	-- CSS colors
	css_attr = "#4D8A8A",
	css_class_name = "#964E3C",
	css_color = "#C04D6B",
	css_function = "#BF7449",
	css_hash = "#0A7285",
	css_indent = "#BF7449",
	css_tag = "#964E3C",
	css_braces = "#964E3C",

	-- Semantic colors
	error = "#B50000",
	warning = "#805B10",
	info = "#0A7285",
	hint = "#795c96",
	link = "#0a7285",
	parameter = "#9b5637",

	-- Git/VCS
	git_add = "#33763c",
	git_change = "#3366a0",
	git_delete = "#C04D6B",

	-- Selection/Visual
	selection = "#E0E0E0",
	search = "#FFEBB0",

	-- Popup menu
	pmenu_bg = "#F0F0F0",
	pmenu_fg = "#2E3440",
	pmenu_sel_bg = "#E0E0E0",
	pmenu_sel_fg = "#874331",

	-- Borders and separators
	border = "#ACB3BD",
	win_separator = "#E8E8E8",
	indent_guide = "#0A7285",
	bracket = "#737D89",

	panel_bg = "#F9FCFF",
	float_bg = "#FFFFFF",
	match_bg = "#D9DFE6",
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
	string = "#2d6a6a",
	func = "#984E39",
	number = "#975027",
	class = "#234F7D",
	comment = "#6a7179",

	-- String literals
	string_literal_fg = "#5B7E1A",
	string_literal_bg = "#F8F8F8",

	-- UI colors
	gutter = "#FFFFFF",
	line_nr = "#7B838F",
	cursor_line_fg = "#000000",
	cursor_line_bg = "#E0E0E0",
	cursor = "#0A4F65",

	-- Diff colors
	diff_add_bg = "#D0F0D0",
	diff_remove_bg = "#FFD5D5",
	diff_change_bg = "#FFF0C0",
	diff_add = "#2D7C38",
	diff_change = "#235690",
	diff_delete = "#A03050",

	-- HTML colors
	html_tag = "#984E39",
	html_attr = "#934a2c",
	html_attr_alt = "#4E5966",

	-- CSS colors
	css_attr = "#2D6A6A",
	css_class_name = "#984E39",
	css_color = "#A03050",
	css_function = "#9F5429",
	css_hash = "#0A6275",
	css_indent = "#9F5429",
	css_tag = "#984E39",
	css_braces = "#984E39",

	-- Semantic colors
	error = "#B50000",
	warning = "#79520B",
	info = "#0A6275",
	hint = "#5b3e79",
	link = "#0a6275",
	parameter = "#934a2c",

	-- Git/VCS
	git_add = "#297133",
	git_change = "#235690",
	git_delete = "#A03050",

	-- Selection/Visual
	selection = "#D0D0D0",
	search = "#FFE090",

	-- Popup menu
	pmenu_bg = "#F5F5F5",
	pmenu_fg = "#000000",
	pmenu_sel_bg = "#D0D0D0",
	pmenu_sel_fg = "#783B29",

	-- Borders and separators
	border = "#939DA8",
	win_separator = "#E0E0E0",
	indent_guide = "#0A6275",
	bracket = "#576574",

	panel_bg = "#E8EBEF",
	float_bg = "#F5F5F5",
	match_bg = "#D0D8E2",
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
