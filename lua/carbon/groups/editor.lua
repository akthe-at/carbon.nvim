local M = {}

function M.get(ctx)
	local colors = ctx.colors
	local config = ctx.config
	local groups = ctx.groups
	local base_bg = ctx.base_bg
	local gutter_bg = ctx.gutter_bg
	local panel_bg = ctx.panel_bg
	local float_bg = ctx.float_bg
	local pmenu_bg = ctx.pmenu_bg
	local pmenu_sel_bg = ctx.pmenu_sel_bg
	local search_bg = ctx.search_bg
	local search_fg = ctx.search_fg
	local cursor_color = ctx.cursor_color
	return {
		-- Editor
		ColorColumn = { bg = panel_bg },
		Conceal = { fg = colors.comment },
		CurSearch = { bg = search_bg, fg = search_fg, bold = true, underline = true },
		Cursor = { fg = colors.bg, bg = cursor_color },
		lCursor = { fg = colors.bg, bg = cursor_color },
		CursorIM = { fg = colors.bg, bg = cursor_color },
		TermCursor = { fg = colors.bg, bg = cursor_color },
		TermCursorNC = { fg = colors.bg, bg = cursor_color },
		CursorColumn = { bg = colors.cursor_line_bg },
		CursorLine = { bg = colors.cursor_line_bg },
		CursorLineNr = { fg = colors.cursor_line_fg },
		CursorLineSign = { bg = colors.cursor_line_bg },
		CursorLineFold = { bg = colors.cursor_line_bg },
		Directory = { fg = groups.link },
		DiffAdd = { bg = colors.diff_add_bg },
		DiffChange = { bg = colors.diff_change_bg },
		DiffDelete = { bg = colors.diff_remove_bg, fg = colors.diff_delete },
		DiffText = { bg = colors.diff_change_bg, fg = colors.diff_change },
		EndOfBuffer = { fg = colors.bg },
		ErrorMsg = { bg = gutter_bg, fg = groups.error },
		VertSplit = { fg = groups.border, bg = base_bg },
		WinSeparator = { fg = groups.border, bg = colors.none },
		Folded = { fg = colors.comment, bg = panel_bg },
		FoldColumn = { fg = colors.comment, bg = gutter_bg },
		SignColumn = { fg = groups.link, bg = gutter_bg },
		IncSearch = { bg = search_bg, fg = search_fg, bold = true, underline = true },
		Substitute = { bg = search_bg, fg = search_fg },
		LineNr = { fg = colors.line_nr, bg = gutter_bg },
		LineNrAbove = { fg = colors.line_nr },
		LineNrBelow = { fg = colors.line_nr },
		MatchParen = { fg = colors.fg, bg = colors.match_bg, bold = true },
		ModeMsg = { fg = colors.fg, bold = true },
		MsgArea = { fg = colors.fg },
		MoreMsg = { fg = colors.cursor_line_fg },
		NonText = { fg = colors.comment },
		Normal = { fg = colors.fg, bg = base_bg },
		NormalFloat = { fg = colors.fg, bg = float_bg },
		FloatBorder = { fg = groups.border, bg = float_bg },
		FloatTitle = { fg = colors.identifier, bg = float_bg },
		FloatShadow = { bg = colors.bg_dark or colors.bg },
		FloatShadowThrough = { bg = colors.bg },
		NormalNC = {
			fg = config.dim_inactive and (colors.fg_dark or colors.comment) or colors.fg,
			bg = config.transparent and colors.none
				or (config.dim_inactive and (colors.bg_dark or colors.bg) or colors.bg),
		},
		Pmenu = { fg = colors.pmenu_fg, bg = pmenu_bg },
		PmenuSel = { fg = colors.pmenu_sel_fg, bg = pmenu_sel_bg },
		PmenuSbar = { bg = pmenu_bg },
		PmenuThumb = { bg = groups.border },
		PmenuKind = { fg = colors.identifier, bg = pmenu_bg },
		PmenuKindSel = { fg = colors.pmenu_sel_fg, bg = pmenu_sel_bg },
		PmenuExtra = { fg = colors.comment, bg = pmenu_bg },
		PmenuExtraSel = { fg = colors.pmenu_sel_fg, bg = pmenu_sel_bg },
		Question = { fg = colors.cursor_line_fg },
		QuickFixLine = { bg = colors.cursor_line_bg, bold = true },
		Search = { bg = search_bg, fg = search_fg },
		HlSearchLens = { fg = colors.comment, bg = colors.cursor_line_bg },
		HlSearchLensNear = { fg = search_fg, bg = search_bg, bold = true },
		HlSearchLensBorder = { fg = groups.border, bg = colors.cursor_line_bg },
		HlSearchLensLabel = { fg = colors.keyword, bold = true },
		HlSearchLensLabelOverlapped = { fg = groups.warning, bold = true },
		HlSearchLensMatch = { fg = colors.keyword, bold = true },
		SpecialKey = { fg = groups.link },
		SpellBad = { sp = groups.error, undercurl = true },
		SpellCap = { sp = groups.warning, undercurl = true },
		SpellLocal = { sp = groups.info, undercurl = true },
		SpellRare = { sp = groups.hint, undercurl = true },
		StatusLine = { fg = colors.fg, bg = base_bg },
		StatusLineNC = { fg = colors.comment, bg = base_bg },
		StatusLineTerm = { fg = colors.bg, bg = groups.info, bold = true },
		StatusLineTermNC = { fg = colors.bg, bg = groups.info },
		TabLine = { fg = colors.comment, bg = panel_bg },
		TabLineFill = { bg = base_bg },
		TabLineSel = { fg = colors.fg, bg = base_bg },
		Title = { fg = colors.identifier, bold = true },
		Visual = { bg = colors.selection, fg = colors.fg },
		VisualNOS = { link = "Visual" },
		WarningMsg = { fg = groups.warning },
		Whitespace = { fg = colors.comment },
		WildMenu = { fg = colors.comment, bg = panel_bg },
		WinBar = { link = "StatusLine" },
		WinBarNC = { link = "StatusLineNC" },


	}
end

return M
