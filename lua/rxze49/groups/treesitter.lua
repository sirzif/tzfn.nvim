local util = require("rxze49.util")

return function(palette, styles, groups)
	return {
		--- Treesitter
		--- |:help treesitter-highlight-groups|
		["@variable"] = { fg = palette.fg, italic = styles.italic },
		["@variable.builtin"] = { fg = palette.red, italic = styles.italic, bold = styles.bold },
		["@variable.parameter"] = { fg = palette.fg, italic = styles.italic },
		["@variable.parameter.builtin"] = { fg = palette.red, italic = styles.italic, bold = styles.bold },
		["@variable.member"] = { fg = palette.fg },

		["@constant"] = { fg = palette.ylw },
		["@constant.builtin"] = { fg = palette.ylw, bold = styles.bold },
		["@constant.macro"] = { fg = palette.ylw },

		["@module"] = { fg = palette.grn_b },
		["@module.builtin"] = { fg = palette.red, bold = styles.bold },
		["@label"] = { link = "Label" },

		["@string"] = { link = "String" },
		-- ["@string.documentation"] = {},
		["@string.regexp"] = { fg = palette.mgt },
		["@string.escape"] = { fg = palette.ylw },
		["@string.special"] = { fg = palette.blu_b },
		["@string.special.symbol"] = { fg = palette.fg },
		["@string.special.url"] = { fg = palette.fg, underline = true },
		-- ["@string.special.path"] = {},

		["@character"] = { link = "Character" },
		["@character.special"] = { link = "Character" },

		["@boolean"] = { link = "Boolean" },
		["@number"] = { link = "Number" },
		["@number.float"] = { link = "Number" },
		["@float"] = { link = "Number" },

		["@type"] = { fg = palette.blu },
		["@type.builtin"] = { fg = palette.blu_d, bold = styles.bold },
		-- ["@type.definition"] = {},

		["@attribute"] = { fg = palette.blu_b },
		["@attribute.builtin"] = { fg = palette.blu_b, bold = styles.bold },
		["@property"] = { fg = palette.fg, italic = styles.italic },

		["@function"] = { fg = palette.mgt },
		["@function.builtin"] = { fg = palette.mgt, bold = styles.bold },
		-- ["@function.call"] = {},
		["@function.macro"] = { link = "Function" },

		["@function.method"] = { fg = palette.mgt },
		["@function.method.call"] = { fg = palette.mgt },

		["@constructor"] = { fg = palette.blu },
		["@operator"] = { link = "Operator" },

		["@keyword"] = { link = "Keyword" },
		-- ["@keyword.coroutine"] = {},
		-- ["@keyword.function"] = {},
		["@keyword.operator"] = { fg = palette.subtle },
		["@keyword.import"] = { fg = palette.red },
		["@keyword.storage"] = { fg = palette.red },
		["@keyword.repeat"] = { fg = palette.red },
		["@keyword.return"] = { fg = palette.red },
		["@keyword.debug"] = { fg = palette.ylw },
		["@keyword.exception"] = { fg = palette.red },

		["@keyword.conditional"] = { fg = palette.red },
		["@keyword.conditional.ternary"] = { fg = palette.red },

		["@keyword.directive"] = { fg = palette.mgt },
		["@keyword.directive.define"] = { fg = palette.mgt },

		--- Punctuation
		["@punctuation.delimiter"] = { fg = palette.subtle },
		["@punctuation.bracket"] = { fg = palette.subtle },
		["@punctuation.special"] = { fg = palette.subtle },

		--- Comments
		["@comment"] = { link = "Comment" },
		-- ["@comment.documentation"] = {},

		["@comment.error"] = { fg = groups.error },
		["@comment.warning"] = { fg = groups.warn },
		["@comment.todo"] = { fg = groups.todo, bg = groups.todo, blend = 15 },
		["@comment.hint"] = { fg = groups.hint, bg = groups.hint, blend = 15 },
		["@comment.info"] = { fg = groups.info, bg = groups.info, blend = 15 },
		["@comment.note"] = { fg = groups.note, bg = groups.note, blend = 15 },

		--- Markup
		["@markup.strong"] = { bold = styles.bold },
		["@markup.italic"] = { italic = styles.italic },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },

		["@markup.heading"] = { fg = palette.blu, bold = styles.bold },

		["@markup.quote"] = { fg = palette.fg },
		["@markup.math"] = { link = "Special" },
		["@markup.environment"] = { link = "Macro" },
		["@markup.environment.name"] = { link = "@type" },

		-- ["@markup.link"] = {},
		["@markup.link.markdown_inline"] = { fg = palette.subtle },
		["@markup.link.label.markdown_inline"] = { fg = palette.blu },
		["@markup.link.url"] = { fg = groups.link },

		-- ["@markup.raw"] = { bg = palette.surface },
		-- ["@markup.raw.block"] = { bg = palette.surface },
		["@markup.raw.delimiter.markdown"] = { fg = palette.subtle },

		["@markup.list"] = { fg = palette.grn },
		["@markup.list.checked"] = { fg = palette.blu, bg = palette.blu, blend = 10 },
		["@markup.list.unchecked"] = { fg = palette.fg },

		-- Markdown headings
		["@markup.heading.1.markdown"] = { link = "markdownH1" },
		["@markup.heading.2.markdown"] = { link = "markdownH2" },
		["@markup.heading.3.markdown"] = { link = "markdownH3" },
		["@markup.heading.4.markdown"] = { link = "markdownH4" },
		["@markup.heading.5.markdown"] = { link = "markdownH5" },
		["@markup.heading.6.markdown"] = { link = "markdownH6" },
		["@markup.heading.1.marker.markdown"] = { link = "markdownH1Delimiter" },
		["@markup.heading.2.marker.markdown"] = { link = "markdownH2Delimiter" },
		["@markup.heading.3.marker.markdown"] = { link = "markdownH3Delimiter" },
		["@markup.heading.4.marker.markdown"] = { link = "markdownH4Delimiter" },
		["@markup.heading.5.marker.markdown"] = { link = "markdownH5Delimiter" },
		["@markup.heading.6.marker.markdown"] = { link = "markdownH6Delimiter" },

		["@diff.plus"] = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
		["@diff.minus"] = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
		["@diff.delta"] = { bg = groups.git_change, blend = 20 },

		["@tag"] = { link = "Tag" },
		["@tag.attribute"] = { fg = palette.fg },
		["@tag.delimiter"] = { fg = palette.fg },

		--- Non-highlighting captures
		-- ["@none"] = {},
		["@conceal"] = { link = "Conceal" },
		["@conceal.markdown"] = { fg = palette.subtle },

		-- ["@spell"] = {},
		-- ["@nospell"] = {},
	}
end
