local p = require("rxze49.palette")
local config = require("rxze49.config")

local bg_base = p.bg
if config.options.styles.transparency then
	bg_base = "NONE"
end

return {
	normal = {
		a = { bg = p.surface, fg = p.mgt, gui = "bold" },
		b = { bg = p.surface, fg = p.fg },
		c = { bg = p.surface, fg = p.subtle, gui = "italic" },
	},
	insert = {
		a = { bg = p.surface, fg = p.blu, gui = "bold" },
	},
	visual = {
		a = { bg = p.surface, fg = p.blu_b, gui = "bold" },
	},
	replace = {
		a = { bg = p.surface, fg = p.grn, gui = "bold" },
	},
	command = {
		a = { bg = p.surface, fg = p.red, gui = "bold" },
	},
	inactive = {
		a = { bg = bg_base, fg = p.subtle, gui = "bold" },
		b = { bg = bg_base, fg = p.subtle },
		c = { bg = bg_base, fg = p.subtle, gui = "italic" },
	},
}
