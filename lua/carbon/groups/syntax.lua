local M = {}

function M.get(ctx)
	local colors = ctx.colors
	local styles = ctx.styles
	local groups = ctx.groups
	local gutter_bg = ctx.gutter_bg
	local keyword_style = ctx.keyword_style
	local identifier_style = ctx.identifier_style
	return {
		-- Syntax (matching IntelliJ Carbon theme)
		Comment = { fg = colors.comment, italic = styles.comments.italic },
		Constant = { fg = colors.constant or colors.variable },
		String = { fg = colors.string },
		Character = { fg = colors.string },
		Number = { fg = colors.number },
		Boolean = keyword_style,
		Float = { fg = colors.number },

		Identifier = identifier_style,
		Function = vim.tbl_extend("force", { fg = colors.func }, styles.functions),

		Statement = keyword_style,
		Conditional = keyword_style,
		Repeat = keyword_style,
		Label = { fg = groups.info },
		Operator = { fg = colors.bracket or colors.fg },
		Keyword = keyword_style,
		Exception = keyword_style,

		PreProc = keyword_style,
		Include = keyword_style,
		Define = keyword_style,
		Macro = { fg = colors.func },
		PreCondit = keyword_style,

		Type = { fg = colors.class },
		StorageClass = keyword_style,
		Structure = { fg = colors.class },
		Typedef = { fg = colors.class },

		Special = { fg = colors.identifier },
		SpecialChar = { fg = colors.string },
		Tag = { fg = colors.html_tag },
		Delimiter = { fg = colors.bracket or colors.fg },
		SpecialComment = { fg = colors.comment },
		Debug = { fg = groups.warning },

		Underlined = { fg = groups.link, underline = true },
		Ignore = { fg = colors.html_attr_alt, bg = gutter_bg, bold = true },
		Error = { bg = colors.diff_remove_bg },
		Todo = { fg = groups.todo, bg = gutter_bg, bold = true },


	}
end

return M
