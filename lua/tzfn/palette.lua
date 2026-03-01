local options = require("tzfn.config").options
local variants = {
	main = {
		_nc = "#141216",
		bg = "#201822",
		surface = "#2c232e",
		overlay = "#3d3340",

		fg = "#d6d9e0",
		muted = "#646266",
		subtle = "#969399",

		red = "#f84a12",
		grn = "#36994e",
		ylw = "#ffaf0a",
		blu = "#558ba6",
		mgt = "#a82a5f",
		cyn = "#1da89d",

		red2 = "#fa835c",
		grn2 = "#5ecc79",
		ylw2 = "#ffb724",
		blu2 = "#79b9d9",
		mgt2 = "#db4282",
		cyn2 = "#30dbcd",

		red3 = "#330f04",
		grn3 = "#12331a",
		ylw3 = "#332302",
		blu3 = "#1a2b33",

		err = "#d93b55",

		hl1 = "#291f2b",
		hl2 = "#372a3b",
		hl3 = "#45324a",

		none = "NONE",
	},
	light = {
		-- idk anything about light themes
		-- need elp with this perhaps idk
		_nc = "#e6e3e8",
		bg = "#f8f2fa",
		surface = "#d4cbd6",
		overlay = "#c4b1c9",

		fg = "#26242b",
		muted = "#a6a4ab",
		subtle = "#716f75",

		red = "#f84a12",
		grn = "#36994e",
		ylw = "#ffaf0a",
		blu = "#558ba6",
		mgt = "#a82a5f",
		cyn = "#1da89d",

		red2 = "#fa835c",
		grn2 = "#5ecc79",
		ylw2 = "#ffb724",
		blu2 = "#79b9d9",
		mgt2 = "#db4282",
		cyn2 = "#30dbcd",

		red3 = "#330f04",
		grn3 = "#12331a",
		ylw3 = "#332302",
		blu3 = "#1a2b33",

		err = "#d93b55",

		hl1 = "#f1e4f5",
		hl2 = "#ddc5e3",
		hl3 = "#c499cf",

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
