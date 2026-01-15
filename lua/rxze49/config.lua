---@alias Variant "main" | "light"
---@alias Palette { bg: string, surface: string, overlay: string, muted: string, subtle: string, fg: string, red: string, ylw: string, mgt: string, grn: string, blu: string, blu_b: string, grn_b: string}
---@alias PaletteColor "bg" | "surface" | "overlay" | "muted" | "subtle" | "fg" | "red" | "ylw" | "mgt" | "grn" | "blu" | "blu_b" | "grn_b" | "hl_low" | "hl_med" | "hl_high"
---@alias Highlight { link: string, inherit: boolean } | { fg: string, bg: string, sp: string, bold: boolean, italic: boolean, undercurl: boolean, underline: boolean, underdouble: boolean, underdotted: boolean, underdashed: boolean, strikethrough: boolean, inherit: boolean }

local config = {}

---@class Options
config.options = {
	---Set the desired variant: "auto" will follow the vim background,
	---defaulting to `dark_variant` or "main" for dark and "light" for, well, light.
	---@type "auto" | Variant
	variant = "auto",

	---Set the desired dark variant when `options.variant` is set to "auto".
	---@type Variant
	dark_variant = "main",

	---Differentiate between active and inactive windows and panels.
	dim_inactive_windows = false,

	---Extend background behind borders. Appearance differs based on which
	---border characters you are using.
	extend_background_behind_borders = true,

	enable = {
		terminal = true,
	},

	styles = {
		bold = false,
		italic = false,
		transparency = false,
	},

	---@type table<string, table<string, string>>
	palette = {},

	---@type table<string, string | PaletteColor>
	groups = {
		border = "red_d",
		link = "blu_b",
		panel = "surface",

		error = "red",
		hint = "blu_b",
		info = "blu",
		ok = "grn",
		warn = "ylw",
		note = "blu",
		todo = "grn",

		git_add = "grn",
		git_change = "ylw",
		git_delete = "red",
		git_dirty = "mgt",
		git_ignore = "muted",
		git_merge = "grn_b",
		git_rename = "grn",
		git_stage = "grn_b",
		git_text = "mgt",
		git_untracked = "subtle",

		---@type string | PaletteColor
		h1 = "blu_b",
		h2 = "blu",
		h3 = "mgt",
		h4 = "ylw",
		h5 = "grn",
		h6 = "grn_b",
	},

	---@type table<string, Highlight>
	highlight_groups = {},

	---Called before each highlight group, before setting the highlight.
	---@param group string
	---@param highlight Highlight
	---@param palette Palette
	---@diagnostic disable-next-line: unused-local
	before_highlight = function(group, highlight, palette) end,
}

---@param options Options | nil
function config.extend_options(options)
	config.options = vim.tbl_deep_extend("force", config.options, options or {})
end

return config
