local util = require("tzfn.util")

return function(palette, styles, groups)
	return {
		--- Treesitter
		--- |:help treesitter-highlight-groups|
		["@variable"] = { link = "Identifier" },
		["@variable.builtin"] = { fg = util.blend(palette.mgt2, palette.mgt, 0.3) },
		["@variable.parameter"] = { link = "Identifier" },
		["@variable.parameter.builtin"] = { fg = util.blend(palette.mgt2, palette.mgt, 0.3) },
		["@variable.member"] = { fg = palette.fg },

		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { fg = util.blend(palette.mgt2, util.blend(palette.mgt2, palette.mgt, 0.3), 0.3) },
		["@constant.macro"] = { fg = palette.mgt2 },

		["@module"] = { fg = palette.mgt2 },
		["@module.builtin"] = { fg = palette.mgt2 },
		["@label"] = { link = "Label" },

		["@string"] = { link = "String" },
		["@string.documentation"] = { link = "String" },
		["@string.regexp"] = { link = "@constant" },
		["@string.escape"] = { link = "@constant" },
		["@string.special"] = { link = "@constant" },
		["@string.special.symbol"] = { link = "@constant" },
		["@string.special.path"] = { link = "@constant" },
		["@string.special.url"] = { fg = palette.fg, underline = true },

		["@character"] = { link = "Character" },
		["@character.special"] = { fg = util.blend(palette.red2, palette.red, 0.3) },

		["@boolean"] = { link = "Boolean" },
		["@number"] = { link = "Number" },
		["@number.float"] = { link = "Float" },
		["@float"] = { link = "Float" },

		["@type"] = { link = "Type" },
		["@type.builtin"] = { fg = util.blend(palette.mgt2, palette.mgt, 0.3) },
		["@type.definition"] = { link = "Type" },

		["@attribute"] = { fg = util.blend(palette.red2, palette.red, 0.3) },
		["@attribute.builtin"] = { fg = util.blend(palette.mgt2, palette.mgt, 0.3) },
		["@property"] = { fg = palette.fg },

		["@function"] = { link = "Function" },
		["@function.builtin"] = { fg = palette.cyn },
		["@function.call"] = { fg = palette.cyn2 },
		["@function.macro"] = { fg = util.blend(palette.mgt2, palette.mgt, 0.3) },

		["@function.method"] = { link = "Function" },
		["@function.method.call"] = { fg = palette.cyn2 },

		["@constructor"] = { fg = palette.cyn },
		["@operator"] = { link = "Operator" },

		["@keyword"] = { link = "Keyword" },
		["@keyword.function"] = { fg = util.blend(palette.blu2, palette.blu, 0.5) },
		["@keyword.coroutine"] = { fg = palette.blu, italic = styles.italic },
		["@keyword.operator"] = { link = "Operator" },
		["@keyword.import"] = { link = "Include" },
		["@keyword.type"] = { fg = palette.blu, italic = styles.italic },
		["@keyword.modifier"] = { fg = palette.blu, italic = styles.italic },
		["@keyword.repeat"] = { fg = util.blend(palette.blu2, palette.blu, 0.5) },
		["@keyword.return"] = { fg = util.blend(palette.blu2, palette.blu, 0.5), italic = styles.italic },
		["@keyword.debug"] = { link = "Debug" },
		["@keyword.exception"] = { link = "Exception" },

		["@keyword.conditional"] = { fg = util.blend(palette.blu2, palette.blu, 0.5) },
		["@keyword.conditional.ternary"] = { fg = util.blend(palette.blu2, palette.blu, 0.5) },

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

		["@markup.quote"] = { fg = palette.fg },
		["@markup.math"] = { fg = palette.blu2 },
		["@markup.environment"] = { link = "Macro" },
		["@markup.environment.name"] = { link = "@type" },

		["@markup.link"] = { fg = palette.fg, underline = true },
		["@markup.link.markdown_inline"] = { fg = palette.fg, underline = false },
		["@markup.link.label"] = { fg = palette.grn2 },
		["@markup.link.url"] = { fg = groups.link, underline = true },

		["@markup.raw"] = { fg = palette.ylw },
		["@markup.raw.block"] = { fg = palette.fg },

		["@markup.list"] = { fg = palette.subtle },
		["@markup.list.checked"] = { fg = palette.grn, bg = palette.grn3, blend = 10 },
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
