return function(palette, styles, make_border)
	return {
		-- nvim-telescope/telescope.nvim
		TelescopeBorder = make_border(),
		TelescopeMatching = { fg = palette.grn_b },
		TelescopeNormal = { link = "NormalFloat" },
		TelescopePromptNormal = { link = "TelescopeNormal" },
		TelescopePromptPrefix = { fg = palette.grn_b },
		TelescopeSelection = { fg = palette.fg, bg = palette.overlay },
		TelescopeSelectionCaret = { fg = palette.grn_b, bg = palette.overlay },
		TelescopeTitle = { fg = palette.grn_b, bold = styles.bold },
	}
end
