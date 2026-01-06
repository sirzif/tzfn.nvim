local p = require("rxze49.palette")
local config = require("rxze49.config")

local bg_base = p.surface
if config.options.styles.transparency then
	bg_base = "NONE"
end

return {
	normal = {
		a = { bg = p.mgt, fg = p.bg, gui = "bold" },
		b = { bg = p.overlay, fg = p.mgt },
		c = { bg = bg_base, fg = p.fg },
	},
	insert = {
		a = { bg = p.blu, fg = p.bg, gui = "bold" },
		b = { bg = p.overlay, fg = p.blu },
		c = { bg = bg_base, fg = p.fg },
	},
	visual = {
		a = { bg = p.blu_b, fg = p.bg, gui = "bold" },
		b = { bg = p.overlay, fg = p.blu_b },
		c = { bg = bg_base, fg = p.fg },
	},
	replace = {
		a = { bg = p.grn, fg = p.bg, gui = "bold" },
		b = { bg = p.overlay, fg = p.grn },
		c = { bg = bg_base, fg = p.fg },
	},
	command = {
		a = { bg = p.red, fg = p.bg, gui = "bold" },
		b = { bg = p.overlay, fg = p.red },
		c = { bg = bg_base, fg = p.fg },
	},
	inactive = {
		a = { bg = bg_base, fg = p.muted, gui = "bold" },
		b = { bg = bg_base, fg = p.muted },
		c = { bg = bg_base, fg = p.muted },
	},
}
