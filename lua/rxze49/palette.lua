local options = require("rxze49.config").options
local variants = {
	main = {
		_nc = "#141414",
		base = "#181818",
		surface = "#222222",
		overlay = "#2a2a2a",
		muted = "#5f6377",
		subtle = "#767a90",
		text = "#f8eaea",
		love = "#fc5f72",
		gold = "#ffb703",
		rose = "#ff80ab",
		pine = "#00606d",
		foam = "#00a7a3",
		iris = "#01c4bb",
		leaf = "#4dffe6",
		highlight_low = "#242428",
		highlight_med = "#34363d",
		highlight_high = "#5e5a7a",
		none = "NONE",
	},
	faded = {
		_nc = "#141414",
		base = "#181818",
		surface = "#242424",
		overlay = "#2c2c2c",
		muted = "#6a6f86",
		subtle = "#8a90a8",
		text = "#f6e4e4",
		love = "#e06a76",
		gold = "#d9b15a",
		rose = "#d98faf",
		pine = "#1f8f8a",
		foam = "#4fb0ad",
		iris = "#6fa9a6",
		leaf = "#4fc7b6",
		highlight_low = "#2a2a2a",
		highlight_med = "#353535",
		highlight_high = "#505060",

		none = "NONE",
	},
	light = {
		_nc = "#f4f4f4",
		base = "#fafafa",
		surface = "#f1f1f1",
		overlay = "#e6e6e6",
		muted = "#6b6b6b",
		subtle = "#8a8a8a",
		text = "#2a2a2a",
		love = "#c8475d",
		gold = "#c99228",
		rose = "#c05a82",
		pine = "#1b8f84",
		foam = "#3f6f8f",
		iris = "#566fa6",
		leaf = "#2f7f6c",
		highlight_low = "#e2e2e2",
		highlight_med = "#d2d2d2",
		highlight_high = "#bdbdbd",
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
