local M = {}

---@param colors CarbonPalette
---@param config CarbonConfig
function M.setup(colors, config)
	local styles = config.styles or {}
	styles.comments = styles.comments or { italic = true }
	styles.keywords = styles.keywords or {}
	styles.functions = styles.functions or { bold = true }
	styles.variables = styles.variables or {}
	styles.properties = styles.properties or {}

	local function resolve_group(value)
		if type(value) == "string" and colors[value] then
			return colors[value]
		end
		return value
	end

	local groups_config = config.groups or {}
	local groups = {
		border = resolve_group(groups_config.border) or colors.border,
		panel = resolve_group(groups_config.panel) or colors.panel_bg,
		link = resolve_group(groups_config.link) or colors.link,
		error = resolve_group(groups_config.error) or colors.error,
		warning = resolve_group(groups_config.warning) or colors.warning,
		info = resolve_group(groups_config.info) or colors.info,
		hint = resolve_group(groups_config.hint) or colors.hint,
		ok = resolve_group(groups_config.ok) or colors.git_add,
		todo = resolve_group(groups_config.todo) or colors.html_tag,
		git_add = resolve_group(groups_config.git_add) or colors.git_add,
		git_change = resolve_group(groups_config.git_change) or colors.git_change,
		git_delete = resolve_group(groups_config.git_delete) or colors.git_delete,
		git_dirty = resolve_group(groups_config.git_dirty) or colors.git_change,
		git_ignore = resolve_group(groups_config.git_ignore) or colors.comment,
		git_untracked = resolve_group(groups_config.git_untracked) or colors.git_add,
		h1 = resolve_group(groups_config.h1) or colors.keyword,
		h2 = resolve_group(groups_config.h2) or colors.html_tag,
		h3 = resolve_group(groups_config.h3) or colors.git_add,
		h4 = resolve_group(groups_config.h4) or colors.info,
		h5 = resolve_group(groups_config.h5) or colors.identifier,
		h6 = resolve_group(groups_config.h6) or colors.variable,
	}

	local base_bg = config.transparent and colors.none or colors.bg
	local gutter_bg = config.transparent and colors.none or colors.gutter
	local panel_bg = config.transparent and colors.none or groups.panel
	local float_bg = config.transparent and colors.none or (groups_config.panel == "panel_bg" and colors.float_bg or groups.panel)
	local pmenu_bg = config.transparent and colors.none or colors.pmenu_bg
	local pmenu_sel_bg = config.transparent and colors.selection or colors.pmenu_sel_bg
	local search_bg = colors.search or colors.selection
	local search_fg = vim.o.background == "light" and colors.fg or colors.bg

	local keyword_style = vim.tbl_extend("force", { fg = colors.keyword }, styles.keywords)
	local identifier_style = vim.tbl_extend("force", { fg = colors.identifier }, styles.variables)
	local variable_style = vim.tbl_extend("force", { fg = colors.variable }, styles.variables)

	local cursor_color = colors.cursor or colors.link or colors.keyword or colors.fg

	local ctx = {
		colors = colors,
		config = config,
		styles = styles,
		groups = groups,
		base_bg = base_bg,
		gutter_bg = gutter_bg,
		panel_bg = panel_bg,
		float_bg = float_bg,
		pmenu_bg = pmenu_bg,
		pmenu_sel_bg = pmenu_sel_bg,
		search_bg = search_bg,
		search_fg = search_fg,
		keyword_style = keyword_style,
		identifier_style = identifier_style,
		variable_style = variable_style,
		cursor_color = cursor_color,
	}
	local highlights = {}
	for _, name in ipairs({ "editor", "syntax", "treesitter", "lsp", "integrations" }) do
		highlights = vim.tbl_extend("force", highlights, require("carbon.groups." .. name).get(ctx))
	end

	-- Surface transparency must not remove selection, cursor-line or diff emphasis.
	if config.transparent then
		for _, name in ipairs({
			"Normal", "NormalNC", "NormalFloat", "SignColumn", "FoldColumn",
			"LineNr", "StatusLine", "StatusLineNC", "TabLine", "TabLineFill", "TabLineSel",
			"FloatBorder", "FloatTitle", "VertSplit", "WinSeparator", "MsgArea",
			"NeoTreeNormal", "NeoTreeNormalNC", "NeoTreeWinSeparator", "NeoTreeEndOfBuffer",
			"NvimTreeNormal", "NvimTreeNormalNC", "NvimTreeEndOfBuffer",
			"SnacksNormal", "SnacksNormalNC", "SnacksDashboardNormal", "SnacksDashboardTerminal",
			"SnacksPickerNormal", "SnacksPickerBorder", "SnacksPickerTitle",
			"SnacksPickerInputBorder", "SnacksPickerInputTitle", "SnacksPickerBoxTitle",
			"SnacksPickerList", "SnacksPickerPreview", "TroubleNormal", "DiffviewNormal",
			"DiffviewWinSeparator", "TreesitterContext", "TreesitterContextLineNumber",
		}) do
			if highlights[name] then
				highlights[name].bg = colors.none
			end
		end
	end

	config.on_highlights(highlights, colors)
	return { highlights = highlights }
end

return M
