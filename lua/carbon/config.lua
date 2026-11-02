local M = {}

M._configured = false

M.STYLES = {
	AUTO = "auto",
	CARBON = "carbon",
	CARBON_DAY = "carbon_day",
	CARBON_CONTRAST = "carbon_contrast",
	CARBON_DAY_NEUTRAL = "carbon_day_neutral",
	CARBON_DAY_CONTRAST = "carbon_day_contrast",
}

---@class CarbonConfig
---@field style string Theme style: "auto", "carbon" (dark), "carbon_day" (light), "carbon_contrast" (high contrast dark), "carbon_day_neutral" (cool neutral light), "carbon_day_contrast" (high contrast light)
---@field dark_variant string Dark variant when style is "auto"
---@field light_variant string Light variant when style is "auto"
---@field transparent boolean Enable transparent background
---@field terminal_colors boolean Enable terminal colors
---@field dim_inactive boolean Dim inactive windows
---@field styles CarbonStyles
---@field groups CarbonGroups
---@field on_colors fun(colors: CarbonPalette): nil
---@field on_highlights fun(highlights: table, colors: CarbonPalette): nil
---@field before_highlight fun(group: string, highlight: table, colors: CarbonPalette): nil

---@class CarbonStyles
---@field comments table Style for comments
---@field keywords table Style for keywords
---@field functions table Style for functions
---@field variables table Style for variables
---@field properties table Style for properties

---@class CarbonGroups
---@field border string
---@field panel string
---@field link string
---@field error string
---@field warning string
---@field info string
---@field hint string
---@field ok string
---@field todo string
---@field git_add string
---@field git_change string
---@field git_delete string
---@field git_dirty string
---@field git_ignore string
---@field git_untracked string
---@field h1 string
---@field h2 string
---@field h3 string
---@field h4 string
---@field h5 string
---@field h6 string

---@type CarbonConfig
M.defaults = {
	style = M.STYLES.CARBON,
	dark_variant = M.STYLES.CARBON,
	light_variant = M.STYLES.CARBON_DAY,
	transparent = false,
	terminal_colors = true,
	dim_inactive = false,
	styles = {
		comments = { italic = true },
		keywords = {},
		functions = { bold = true },
		variables = {},
		properties = {},
	},
	groups = {
		border = "border",
		panel = "panel_bg",
		link = "link",
		error = "error",
		warning = "warning",
		info = "info",
		hint = "hint",
		ok = "git_add",
		todo = "html_tag",
		git_add = "git_add",
		git_change = "git_change",
		git_delete = "git_delete",
		git_dirty = "git_change",
		git_ignore = "comment",
		git_untracked = "git_add",
		h1 = "keyword",
		h2 = "html_tag",
		h3 = "git_add",
		h4 = "info",
		h5 = "identifier",
		h6 = "variable",
	},
	on_colors = function(colors) end,
	on_highlights = function(highlights, colors) end,
	before_highlight = function(group, highlight, colors) end,
}

---@type CarbonConfig
M.options = {}

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
	M._configured = true
end

function M.extend(opts)
	return vim.tbl_deep_extend("force", {}, M.defaults, M.options, opts or {})
end

return M
