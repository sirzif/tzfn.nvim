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
		blu = "#017d83",
		mgt = "#ff80ab",

		red_b = "#ff8a98",
		grn_b = "#00f5d4",
		ylw_b = "#ffd75a",
		blu_b = "#00a7a3",

		red_d = "#d44f60",
		grn_d = "#00a88f",
		ylw_d = "#cc9600",
		blu_d = "#006475",

		hl_low = "#242428",
		hl_med = "#34363d",
		hl_high = "#5e5a7a",

		none = "NONE",
	},
	light = {
		_nc = "#f7f8fa",
		bg = "#f5f6f8",
		surface = "#eceef2",
		overlay = "#e3e6ec",

		muted = "#7b8195",
		subtle = "#8f95aa",
		fg = "#1e1f24",

		black = "#1e1f24",
		white = "#f5f6f8",

		red = "#c84a5a",
		grn = "#2aa39a",
		ylw = "#caa200",
		blu = "#2b7a8c",
		mgt = "#c85c8a",

		red_b = "#e06474",
		grn_b = "#3dbdb1",
		ylw_b = "#e0b93a",
		blu_b = "#3aa0b4",

		red_d = "#a43a48",
		grn_d = "#1f8078",
		ylw_d = "#a48a00",
		blu_d = "#215f6b",

		hl_low = "#e6e9ef",
		hl_med = "#d9dde6",
		hl_high = "#bfc6d6",

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
