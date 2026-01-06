local options = require("rxze49.config").options
local variants = {
	main = {
		_nc = "#141414",
		bg = "#181818",
		surface = "#222222",
		overlay = "#2a2a2a",

		muted = "#5f6377",
		subtle = "#767a90",
		fg = "#d6d9e0",

		black = "#181818",
		white = "#d6d9e0",

		red = "#fc5f72",
		grn = "#00c9ad",
		ylw = "#ffb703",
		blu = "#00a7a3",
		mgt = "#ff80ab",

		red_b = "#ff8a98",
		grn_b = "#00f5d4",
		ylw_b = "#ffd75a",
		blu_b = "#01c4bb",
		mgt_b = "#ffd1d7",

		red_d = "#d44f60",
		grn_d = "#00a88f",
		ylw_d = "#cc9600",
		blu_d = "#017d83",
		mgt_d = "#e1959f",

		hl_low = "#242428",
		hl_med = "#34363d",
		hl_high = "#5e5a7a",

		none = "NONE",
	},
	faded = {
		_nc = "#141414",
		bg = "#181818",
		surface = "#242424",
		overlay = "#2c2c2c",
		muted = "#6a6f86",
		subtle = "#8a90a8",
		fg = "#bfc4cf",
		red = "#e06a76",
		ylw = "#d9b15a",
		mgt = "#d98faf",
		grn = "#1f8f8a",
		blu = "#4fb0ad",
		blu_b = "#6fa9a6",
		grn_b = "#4fc7b6",
		hl_low = "#2a2a2a",
		hl_med = "#353535",
		hl_high = "#505060",
		none = "NONE",
	},
	light = {
		_nc = "#f4f4f4",
		bg = "#fafafa",
		surface = "#f1f1f1",
		overlay = "#e6e6e6",
		muted = "#6b6b6b",
		subtle = "#8a8a8a",
		fg = "#2a2a2a",
		red = "#c8475d",
		ylw = "#c99228",
		mgt = "#c05a82",
		grn = "#1b8f84",
		blu = "#3f6f8f",
		blu_b = "#566fa6",
		grn_b = "#2f7f6c",
		hl_low = "#e2e2e2",
		hl_med = "#d2d2d2",
		hl_high = "#bdbdbd",
		none = "NONE",
	},
}

if options.palette ~= nil and next(options.palette) then
	-- handle variant specific overrides
	for variant_name, override_palette in pairs(options.palette) do
		if variants[variant_name] then
			variants[variant_name] = vim.tbl_extend("force", variants[variant_name], override_palette or {})
		end
	end
end

if variants[options.variant] ~= nil then
	return variants[options.variant]
end

return vim.o.background == "light" and variants.light or variants[options.dark_variant or "main"]
