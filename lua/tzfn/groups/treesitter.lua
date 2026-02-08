return function(palette, styles, groups)
	return {
		--- Treesitter
		--- |:help treesitter-highlight-groups|
		["@variable"] = { link = "Identifier" },
		["@variable.builtin"] = { fg = palette.mgt, italic = styles.italic, bold = styles.bold },
		["@variable.parameter"] = { link = "Identifier" },
		["@variable.parameter.builtin"] = { fg = palette.mgt, italic = styles.italic, bold = styles.bold },
		["@variable.member"] = { fg = palette.fg },

		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { fg = palette.mgt, bold = styles.bold },
		["@constant.macro"] = { fg = palette.grn_b },

		["@module"] = { fg = palette.blu_b },
		["@module.builtin"] = { fg = palette.mgt, bold = styles.bold },
		["@label"] = { link = "Label" },

		["@string"] = { link = "String" },
		["@string.documentation"] = { fg = palette.ylw_d },
		["@string.regexp"] = { fg = palette.red },
		["@string.escape"] = { fg = palette.red },
		["@string.special"] = { fg = palette.mgt },
		["@string.special.symbol"] = { link = "@constant" },
		["@string.special.url"] = { fg = palette.fg, underline = true },
		["@string.special.path"] = { fg = palette.mgt },

		["@character"] = { link = "Character" },
		["@character.special"] = { fg = palette.mgt },

		["@boolean"] = { link = "Boolean" },
		["@number"] = { link = "Number" },
		["@number.float"] = { link = "Float" },
		["@float"] = { link = "Float" },

		["@type"] = { link = "Type" },
		["@type.builtin"] = { fg = palette.blu, bold = styles.bold },
		["@type.definition"] = { link = "Identifier" },

		["@attribute"] = { link = "Constant" },
		["@attribute.builtin"] = { fg = palette.blu, bold = styles.bold },
		["@property"] = { link = "Identifier" },

		["@function"] = { link = "Function" },
		["@function.builtin"] = { fg = palette.grn, bold = styles.bold },
		["@function.call"] = { link = "Function" },
		["@function.macro"] = { fg = palette.grn_b },

		["@function.method"] = { link = "Function" },
		["@function.method.call"] = { link = "Function" },

		["@constructor"] = { fg = palette.mgt },
		["@operator"] = { link = "Operator" },

		["@keyword"] = { link = "Keyword" },
		["@keyword.function"] = { link = "Statement" },
		["@keyword.coroutine"] = { link = "Statement" },
		["@keyword.operator"] = { link = "Operator" },
		["@keyword.import"] = { link = "Include" },
		["@keyword.type"] = { fg = palette.red },
		["@keyword.modifier"] = { fg = palette.red },
		["@keyword.repeat"] = { link = "Repeat" },
		["@keyword.return"] = { link = "Statement" },
		["@keyword.debug"] = { link = "Debug" },
		["@keyword.exception"] = { link = "Exception" },

		["@keyword.conditional"] = { link = "Conditional" },
		["@keyword.conditional.ternary"] = { link = "Conditional" },

		["@keyword.directive"] = { link = "PreProc" },
		["@keyword.directive.define"] = { link = "Define" },

		--- Punctuation
		["@punctuation.delimiter"] = { link = "Delimiter" },
		["@punctuation.bracket"] = { link = "Delimiter" },
		["@punctuation.special"] = { link = "Delimiter" },

		--- Comments
		["@comment"] = { link = "Comment" },
		["@comment.documentation"] = { link = "Comment" },

		["@comment.error"] = { fg = groups.error },
		["@comment.warning"] = { fg = groups.warn },
		["@comment.todo"] = { fg = groups.todo, bg = groups.todo, blend = 15 },
		["@comment.hint"] = { fg = groups.hint, bg = groups.hint, blend = 15 },
		["@comment.info"] = { fg = groups.info, bg = groups.info, blend = 15 },
		["@comment.note"] = { fg = groups.note, bg = groups.note, blend = 15 },

		--- Markup
		["@markup.strong"] = { bold = true },
		["@markup.italic"] = { italic = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },

		-- ["@markup.heading"] = { fg = palette.grn, bold = styles.bold },

		["@markup.quote"] = { fg = palette.fg },
		["@markup.math"] = { fg = palette.blu_b },
		["@markup.environment"] = { link = "Macro" },
		["@markup.environment.name"] = { link = "@type" },

		["@markup.link"] = { fg = palette.fg, underline = true },
		["@markup.link.markdown_inline"] = { fg = palette.fg, underline = false },
		["@markup.link.label"] = { fg = palette.grn_b },
		["@markup.link.url"] = { fg = groups.link, underline = true },

		["@markup.raw"] = { fg = palette.ylw },
		["@markup.raw.block"] = { fg = palette.fg },

		["@markup.list"] = { fg = palette.subtle },
		["@markup.list.checked"] = { fg = palette.grn, bg = palette.grn_d, blend = 10 },
		["@markup.list.unchecked"] = { fg = palette.subtle },

		-- Markdown headings

		["@markup.heading"] = { link = "Title" },
		["@markup.heading.1"] = { fg = groups.h1, bold = true },
		["@markup.heading.2"] = { fg = groups.h2, bold = true },
		["@markup.heading.3"] = { fg = groups.h3, bold = true },
		["@markup.heading.4"] = { fg = groups.h4, bold = true },
		["@markup.heading.5"] = { fg = groups.h5, bold = true },
		["@markup.heading.6"] = { fg = groups.h6, bold = true },

		["@diff.plus"] = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
		["@diff.minus"] = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
		["@diff.delta"] = { fg = groups.git_change, bg = groups.git_change, blend = 20 },

		["@tag"] = { link = "Tag" },
		["@tag.attribute"] = { fg = palette.subtle },
		["@tag.delimiter"] = { fg = palette.fg },

		--- Non-highlighting captures
		-- ["@none"] = {},
		["@conceal"] = { link = "Conceal" },
		["@conceal.markdown"] = { fg = palette.subtle },

		-- ["@spell"] = {},
		-- ["@nospell"] = {},
	}
end
