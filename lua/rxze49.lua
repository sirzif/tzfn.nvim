local M = {}
local config = require("rxze49.config")

local function set_highlights()
	local util = require("rxze49.util")
	local palette = require("rxze49.palette")
	local styles = config.options.styles

	local groups = {}
	for group, color in pairs(config.options.groups) do
		groups[group] = util.parse_color(color)
	end

	local function make_border(fg)
		fg = fg or groups.border
		return {
			fg = fg,
			bg = (config.options.extend_background_behind_borders and not styles.transparency) and palette.surface
				or "NONE",
		}
	end

	local highlights = {}
	local sources = {
		require("rxze49.groups.base")(palette, groups, styles, config, make_border),
		require("rxze49.groups.treesitter")(palette, styles, groups),
		require("rxze49.groups.semantic_tokens")(palette, styles, groups),
		require("rxze49.groups.telescope")(palette, groups, make_border),
	}
	for _, s in ipairs(sources) do
		highlights = vim.tbl_deep_extend("force", highlights, s)
	end
	local default_highlights = {
		htmlArg = { fg = palette.blu_b },
		htmlBold = { bold = styles.bold },
		htmlEndTag = { fg = palette.subtle },
		htmlH1 = { link = "markdownH1" },
		htmlH2 = { link = "markdownH2" },
		htmlH3 = { link = "markdownH3" },
		htmlH4 = { link = "markdownH4" },
		htmlH5 = { link = "markdownH5" },
		htmlItalic = { italic = styles.italic },
		htmlLink = { link = "markdownUrl" },
		htmlTag = { fg = palette.subtle },
		htmlTagN = { fg = palette.fg },
		htmlTagName = { fg = palette.blu },

		markdownDelimiter = { fg = palette.subtle },
		markdownH1 = { fg = groups.h1, bold = styles.bold },
		markdownH1Delimiter = { link = "markdownH1" },
		markdownH2 = { fg = groups.h2, bold = styles.bold },
		markdownH2Delimiter = { link = "markdownH2" },
		markdownH3 = { fg = groups.h3, bold = styles.bold },
		markdownH3Delimiter = { link = "markdownH3" },
		markdownH4 = { fg = groups.h4, bold = styles.bold },
		markdownH4Delimiter = { link = "markdownH4" },
		markdownH5 = { fg = groups.h5, bold = styles.bold },
		markdownH5Delimiter = { link = "markdownH5" },
		markdownH6 = { fg = groups.h6, bold = styles.bold },
		markdownH6Delimiter = { link = "markdownH6" },
		markdownLinkText = { link = "markdownUrl" },
		markdownUrl = { fg = groups.link, sp = groups.link, underline = true },

		mkdCode = { fg = palette.blu, italic = styles.italic },
		mkdCodeDelimiter = { fg = palette.mgt },
		mkdCodeEnd = { fg = palette.blu },
		mkdCodeStart = { fg = palette.blu },
		mkdFootnotes = { fg = palette.blu },
		mkdID = { fg = palette.blu, underline = true },
		mkdInlineURL = { link = "markdownUrl" },
		mkdLink = { link = "markdownUrl" },
		mkdLinkDef = { link = "markdownUrl" },
		mkdListItemLine = { fg = palette.fg },
		mkdRule = { fg = palette.subtle },
		mkdURL = { link = "markdownUrl" },

		--- Plugins
		-- lewis6991/gitsigns.nvim
		GitSignsAdd = { fg = groups.git_add, bg = "NONE" },
		GitSignsChange = { fg = groups.git_change, bg = "NONE" },
		GitSignsDelete = { fg = groups.git_delete, bg = "NONE" },
		SignAdd = { fg = groups.git_add, bg = "NONE" },
		SignChange = { fg = groups.git_change, bg = "NONE" },
		SignDelete = { fg = groups.git_delete, bg = "NONE" },

		-- kyazdani42/nvim-tree.lua
		NvimTreeEmptyFolderName = { fg = palette.muted },
		NvimTreeFileDeleted = { fg = groups.git_delete },
		NvimTreeFileDirty = { fg = groups.git_dirty },
		NvimTreeFileMerge = { fg = groups.git_merge },
		NvimTreeFileNew = { fg = palette.blu },
		NvimTreeFileRenamed = { fg = groups.git_rename },
		NvimTreeFileStaged = { fg = groups.git_stage },
		NvimTreeFolderIcon = { fg = palette.subtle },
		NvimTreeFolderName = { fg = palette.blu },
		NvimTreeGitDeleted = { fg = groups.git_delete },
		NvimTreeGitDirty = { fg = groups.git_dirty },
		NvimTreeGitIgnored = { fg = groups.git_ignore },
		NvimTreeGitMerge = { fg = groups.git_merge },
		NvimTreeGitNew = { fg = groups.git_add },
		NvimTreeGitRenamed = { fg = groups.git_rename },
		NvimTreeGitStaged = { fg = groups.git_stage },
		NvimTreeImageFile = { fg = palette.fg },
		NvimTreeNormal = { link = "Normal" },
		NvimTreeOpenedFile = { fg = palette.fg, bg = palette.overlay },
		NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },
		NvimTreeRootFolder = { fg = palette.blu, bold = styles.bold },
		NvimTreeSpecialFile = { link = "NvimTreeNormal" },
		NvimTreeWindowPicker = { link = "StatusLineTerm" },

		-- nvim-neotest/neotest
		NeotestAdapterName = { fg = palette.blu_b },
		NeotestBorder = { fg = palette.hl_med },
		NeotestDir = { fg = palette.blu },
		NeotestExpandMarker = { fg = palette.hl_med },
		NeotestFailed = { fg = palette.red },
		NeotestFile = { fg = palette.fg },
		NeotestFocused = { fg = palette.ylw, bg = palette.hl_med },
		NeotestIndent = { fg = palette.hl_med },
		NeotestMarked = { fg = palette.mgt, bold = styles.bold },
		NeotestNamespace = { fg = palette.ylw },
		NeotestPassed = { fg = palette.grn },
		NeotestRunning = { fg = palette.ylw },
		NeotestWinSelect = { fg = palette.muted },
		NeotestSkipped = { fg = palette.subtle },
		NeotestTarget = { fg = palette.red },
		NeotestTest = { fg = palette.ylw },
		NeotestUnknown = { fg = palette.subtle },
		NeotestWatching = { fg = palette.blu_b },

		-- nvim-neo-tree/neo-tree.nvim
		NeoTreeGitAdded = { fg = groups.git_add },
		NeoTreeGitConflict = { fg = groups.git_merge },
		NeoTreeGitDeleted = { fg = groups.git_delete },
		NeoTreeGitIgnored = { fg = groups.git_ignore },
		NeoTreeGitModified = { fg = groups.git_dirty },
		NeoTreeGitRenamed = { fg = groups.git_rename },
		NeoTreeGitUntracked = { fg = groups.git_untracked },
		NeoTreeTabActive = { fg = palette.fg, bg = palette.overlay },
		NeoTreeTabInactive = { fg = palette.subtle },
		NeoTreeTabSeparatorActive = { link = "WinSeparator" },
		NeoTreeTabSeparatorInactive = { link = "WinSeparator" },
		NeoTreeTitleBar = { link = "StatusLineTerm" },

		-- folke/flash.nvim
		FlashLabel = { fg = palette.bg, bg = palette.red },

		-- folke/which-key.nvim
		WhichKey = { fg = palette.blu_b },
		WhichKeyBorder = make_border(),
		WhichKeyDesc = { fg = palette.ylw },
		WhichKeyFloat = { bg = groups.panel },
		WhichKeyGroup = { fg = palette.blu },
		WhichKeyIcon = { fg = palette.grn },
		WhichKeyIconAzure = { fg = palette.grn },
		WhichKeyIconBlue = { fg = palette.grn },
		WhichKeyIconCyan = { fg = palette.blu },
		WhichKeyIconGreen = { fg = palette.grn_b },
		WhichKeyIconGrey = { fg = palette.subtle },
		WhichKeyIconOrange = { fg = palette.mgt },
		WhichKeyIconPurple = { fg = palette.blu_b },
		WhichKeyIconRed = { fg = palette.red },
		WhichKeyIconYellow = { fg = palette.ylw },
		WhichKeyNormal = { link = "NormalFloat" },
		WhichKeySeparator = { fg = palette.subtle },
		WhichKeyTitle = { link = "FloatTitle" },
		WhichKeyValue = { fg = palette.mgt },

		-- lukas-reineke/indent-blankline.nvim
		IblIndent = { fg = palette.overlay },
		IblScope = { fg = palette.blu },
		IblWhitespace = { fg = palette.overlay },

		-- hrsh7th/nvim-cmp
		CmpItemAbbr = { fg = palette.subtle },
		CmpItemAbbrDeprecated = { fg = palette.subtle, strikethrough = true },
		CmpItemAbbrMatch = { fg = palette.fg, bold = styles.bold },
		CmpItemAbbrMatchFuzzy = { fg = palette.fg, bold = styles.bold },
		CmpItemKind = { fg = palette.subtle },
		CmpItemKindClass = { link = "StorageClass" },
		CmpItemKindFunction = { link = "Function" },
		CmpItemKindInterface = { link = "Type" },
		CmpItemKindMethod = { link = "PreProc" },
		CmpItemKindSnippet = { link = "String" },
		CmpItemKindVariable = { link = "Identifier" },

		-- NeogitOrg/neogit
		-- https://github.com/NeogitOrg/neogit/blob/master/lua/neogit/lib/hl.lua#L109-L198
		NeogitChangeAdded = { fg = groups.git_add, bold = styles.bold, italic = styles.italic },
		NeogitChangeBothModified = { fg = groups.git_change, bold = styles.bold, italic = styles.italic },
		NeogitChangeCopied = { fg = groups.git_untracked, bold = styles.bold, italic = styles.italic },
		NeogitChangeDeleted = { fg = groups.git_delete, bold = styles.bold, italic = styles.italic },
		NeogitChangeModified = { fg = groups.git_change, bold = styles.bold, italic = styles.italic },
		NeogitChangeNewFile = { fg = groups.git_stage, bold = styles.bold, italic = styles.italic },
		NeogitChangeRenamed = { fg = groups.git_rename, bold = styles.bold, italic = styles.italic },
		NeogitChangeUpdated = { fg = groups.git_change, bold = styles.bold, italic = styles.italic },
		NeogitDiffAddHighlight = { link = "DiffAdd" },
		NeogitDiffContextHighlight = { bg = palette.surface },
		NeogitDiffDeleteHighlight = { link = "DiffDelete" },
		NeogitFilePath = { fg = palette.blu, italic = styles.italic },
		NeogitHunkHeader = { bg = groups.panel },
		NeogitHunkHeaderHighlight = { bg = groups.panel },

		-- vimwiki/vimwiki
		VimwikiHR = { fg = palette.subtle },
		VimwikiHeader1 = { link = "markdownH1" },
		VimwikiHeader2 = { link = "markdownH2" },
		VimwikiHeader3 = { link = "markdownH3" },
		VimwikiHeader4 = { link = "markdownH4" },
		VimwikiHeader5 = { link = "markdownH5" },
		VimwikiHeader6 = { link = "markdownH6" },
		VimwikiHeaderChar = { fg = palette.subtle },
		VimwikiLink = { link = "markdownUrl" },
		VimwikiList = { fg = palette.blu_b },
		VimwikiNoExistsLink = { fg = palette.red },

		-- phaazon/hop.nvim
		-- smoka7/hop.nvim
		HopNextKey = { fg = palette.red, bg = palette.red, blend = 20 },
		HopNextKey1 = { fg = palette.blu, bg = palette.red, blend = 20 },
		HopNextKey2 = { fg = palette.grn, bg = palette.red, blend = 20 },
		HopUnmatched = { fg = palette.muted },

		-- ibhagwan/fzf-lua
		FzfLuaBorder = make_border(),
		FzfLuaBufFlagAlt = { fg = palette.subtle },
		FzfLuaBufFlagCur = { fg = palette.subtle },
		FzfLuaCursorLine = { fg = palette.fg, bg = palette.overlay },
		FzfLuaFilePart = { fg = palette.fg },
		FzfLuaHeaderBind = { fg = palette.mgt },
		FzfLuaHeaderText = { fg = palette.red },
		FzfLuaNormal = { link = "NormalFloat" },
		FzfLuaTitle = { link = "FloatTitle" },

		-- rcarriga/nvim-notify
		NotifyBackground = { link = "NormalFloat" },
		NotifyDEBUGBody = { link = "NormalFloat" },
		NotifyDEBUGBorder = make_border(),
		NotifyDEBUGIcon = { link = "NotifyDEBUGTitle" },
		NotifyDEBUGTitle = { fg = palette.muted },
		NotifyERRORBody = { link = "NormalFloat" },
		NotifyERRORBorder = make_border(groups.error),
		NotifyERRORIcon = { link = "NotifyERRORTitle" },
		NotifyERRORTitle = { fg = groups.error },
		NotifyINFOBody = { link = "NormalFloat" },
		NotifyINFOBorder = make_border(groups.info),
		NotifyINFOIcon = { link = "NotifyINFOTitle" },
		NotifyINFOTitle = { fg = groups.info },
		NotifyTRACEBody = { link = "NormalFloat" },
		NotifyTRACEBorder = make_border(palette.blu_b),
		NotifyTRACEIcon = { link = "NotifyTRACETitle" },
		NotifyTRACETitle = { fg = palette.blu_b },
		NotifyWARNBody = { link = "NormalFloat" },
		NotifyWARNBorder = make_border(groups.warn),
		NotifyWARNIcon = { link = "NotifyWARNTitle" },
		NotifyWARNTitle = { fg = groups.warn },

		-- glepnir/dashboard-nvim
		DashboardCenter = { fg = palette.ylw },
		DashboardFooter = { fg = palette.blu_b },
		DashboardHeader = { fg = palette.grn },
		DashboardShortcut = { fg = palette.red },

		-- folke/noice.nvim
		NoiceCursor = { fg = palette.hl_high, bg = palette.fg },

		-- folke/trouble.nvim
		TroubleText = { fg = palette.subtle },
		TroubleCount = { fg = palette.blu_b, bg = palette.surface },
		TroubleNormal = { fg = palette.fg, bg = groups.panel },

		-- echasnovski/mini.nvim
		MiniAnimateCursor = { reverse = true, nocombine = true },
		MiniAnimateNormalFloat = { link = "NormalFloat" },

		MiniClueBorder = { link = "FloatBorder" },
		MiniClueDescGroup = { link = "DiagnosticFloatingWarn" },
		MiniClueDescSingle = { link = "NormalFloat" },
		MiniClueNextKey = { link = "DiagnosticFloatingHint" },
		MiniClueNextKeyWithPostkeys = { link = "DiagnosticFloatingError" },
		MiniClueSeparator = { link = "DiagnosticFloatingInfo" },
		MiniClueTitle = { bg = groups.panel, bold = styles.bold },

		MiniCompletionActiveParameter = { underline = true },

		MiniCursorword = { underline = true },
		MiniCursorwordCurrent = { underline = true },

		MiniDepsChangeAdded = { fg = groups.git_add },
		MiniDepsChangeRemoved = { fg = groups.git_delete },
		MiniDepsHint = { link = "DiagnosticHint" },
		MiniDepsInfo = { link = "DiagnosticInfo" },
		MiniDepsMsgBreaking = { link = "DiagnosticWarn" },
		MiniDepsPlaceholder = { link = "Comment" },
		MiniDepsTitle = { link = "Title" },
		MiniDepsTitleError = { link = "DiffDelete" },
		MiniDepsTitleSame = { link = "DiffText" },
		MiniDepsTitleUpdate = { link = "DiffAdd" },

		MiniDiffOverAdd = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
		MiniDiffOverChange = { fg = groups.git_change, bg = groups.git_change, blend = 20 },
		MiniDiffOverContext = { bg = palette.surface },
		MiniDiffOverDelete = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
		MiniDiffSignAdd = { fg = groups.git_add },
		MiniDiffSignChange = { fg = groups.git_change },
		MiniDiffSignDelete = { fg = groups.git_delete },

		MiniFilesBorder = { link = "FloatBorder" },
		MiniFilesBorderModified = { link = "DiagnosticFloatingWarn" },
		MiniFilesCursorLine = { link = "CursorLine" },
		MiniFilesDirectory = { link = "Directory" },
		MiniFilesFile = { fg = palette.fg },
		MiniFilesNormal = { link = "NormalFloat" },
		MiniFilesTitle = { link = "FloatTitle" },
		MiniFilesTitleFocused = { fg = palette.mgt, bg = groups.panel, bold = styles.bold },

		MiniHipatternsFixme = { fg = palette.bg, bg = groups.error, bold = styles.bold },
		MiniHipatternsHack = { fg = palette.bg, bg = groups.warn, bold = styles.bold },
		MiniHipatternsNote = { fg = palette.bg, bg = groups.info, bold = styles.bold },
		MiniHipatternsTodo = { fg = palette.bg, bg = groups.hint, bold = styles.bold },

		MiniIconsAzure = { fg = palette.blu },
		MiniIconsBlue = { fg = palette.grn },
		MiniIconsCyan = { fg = palette.blu },
		MiniIconsGreen = { fg = palette.grn_b },
		MiniIconsGrey = { fg = palette.subtle },
		MiniIconsOrange = { fg = palette.mgt },
		MiniIconsPurple = { fg = palette.blu_b },
		MiniIconsRed = { fg = palette.red },
		MiniIconsYellow = { fg = palette.ylw },

		MiniIndentscopeSymbol = { fg = palette.muted },
		MiniIndentscopeSymbolOff = { fg = palette.ylw },

		MiniJump = { sp = palette.ylw, undercurl = true },

		MiniJump2dDim = { fg = palette.subtle },
		MiniJump2dSpot = { fg = palette.ylw, bold = styles.bold, nocombine = true },
		MiniJump2dSpotAhead = { fg = palette.blu, bg = palette.surface, nocombine = true },
		MiniJump2dSpotUnique = { fg = palette.mgt, bold = styles.bold, nocombine = true },

		MiniMapNormal = { link = "NormalFloat" },
		MiniMapSymbolCount = { link = "Special" },
		MiniMapSymbolLine = { link = "Title" },
		MiniMapSymbolView = { link = "Delimiter" },

		MiniNotifyBorder = { link = "FloatBorder" },
		MiniNotifyNormal = { link = "NormalFloat" },
		MiniNotifyTitle = { link = "FloatTitle" },

		MiniOperatorsExchangeFrom = { link = "IncSearch" },

		MiniPickBorder = { link = "FloatBorder" },
		MiniPickBorderBusy = { link = "DiagnosticFloatingWarn" },
		MiniPickBorderText = { bg = groups.panel },
		MiniPickIconDirectory = { link = "Directory" },
		MiniPickIconFile = { link = "MiniPickNormal" },
		MiniPickHeader = { link = "DiagnosticFloatingHint" },
		MiniPickMatchCurrent = { link = "CursorLine" },
		MiniPickMatchMarked = { link = "Visual" },
		MiniPickMatchRanges = { fg = palette.blu },
		MiniPickNormal = { link = "NormalFloat" },
		MiniPickPreviewLine = { link = "CursorLine" },
		MiniPickPreviewRegion = { link = "IncSearch" },
		MiniPickPrompt = { bg = groups.panel, bold = styles.bold },

		MiniStarterCurrent = { nocombine = true },
		MiniStarterFooter = { fg = palette.subtle },
		MiniStarterHeader = { link = "Title" },
		MiniStarterInactive = { link = "Comment" },
		MiniStarterItem = { link = "Normal" },
		MiniStarterItemBullet = { link = "Delimiter" },
		MiniStarterItemPrefix = { link = "WarningMsg" },
		MiniStarterSection = { fg = palette.mgt },
		MiniStarterQuery = { link = "MoreMsg" },

		MiniStatuslineDevinfo = { fg = palette.subtle, bg = palette.overlay },
		MiniStatuslineFileinfo = { link = "MiniStatuslineDevinfo" },
		MiniStatuslineFilename = { fg = palette.muted, bg = palette.surface },
		MiniStatuslineInactive = { link = "MiniStatuslineFilename" },
		MiniStatuslineModeCommand = { fg = palette.bg, bg = palette.red, bold = styles.bold },
		MiniStatuslineModeInsert = { fg = palette.bg, bg = palette.blu, bold = styles.bold },
		MiniStatuslineModeNormal = { fg = palette.bg, bg = palette.mgt, bold = styles.bold },
		MiniStatuslineModeOther = { fg = palette.bg, bg = palette.mgt, bold = styles.bold },
		MiniStatuslineModeReplace = { fg = palette.bg, bg = palette.grn, bold = styles.bold },
		MiniStatuslineModeVisual = { fg = palette.bg, bg = palette.blu_b, bold = styles.bold },

		MiniSurround = { link = "IncSearch" },

		MiniTablineCurrent = { fg = palette.fg, bg = palette.overlay, bold = styles.bold },
		MiniTablineFill = { link = "TabLineFill" },
		MiniTablineHidden = { fg = palette.subtle, bg = groups.panel },
		MiniTablineModifiedCurrent = { fg = palette.overlay, bg = palette.fg, bold = styles.bold },
		MiniTablineModifiedHidden = { fg = groups.panel, bg = palette.subtle },
		MiniTablineModifiedVisible = { fg = groups.panel, bg = palette.fg },
		MiniTablineTabpagesection = { link = "Search" },
		MiniTablineVisible = { fg = palette.fg, bg = groups.panel },

		MiniTestEmphasis = { bold = styles.bold },
		MiniTestFail = { fg = palette.red, bold = styles.bold },
		MiniTestPass = { fg = palette.blu, bold = styles.bold },

		MiniTrailspace = { bg = palette.red },

		-- goolord/alpha-nvim
		AlphaButtons = { fg = palette.blu },
		AlphaFooter = { fg = palette.ylw },
		AlphaHeader = { fg = palette.grn },
		AlphaShortcut = { fg = palette.mgt },

		-- github/copilot.vim
		CopilotSuggestion = { fg = palette.muted, italic = styles.italic },

		-- nvim-treesitter/nvim-treesitter-context
		TreesitterContext = { bg = palette.overlay },
		TreesitterContextLineNumber = { fg = palette.mgt, bg = palette.overlay },

		-- RRethy/vim-illuminate
		IlluminatedWordRead = { link = "LspReferenceRead" },
		IlluminatedWordText = { link = "LspReferenceText" },
		IlluminatedWordWrite = { link = "LspReferenceWrite" },

		-- Saghen/blink.cmp
		BlinkCmpDoc = { bg = palette.hl_low },
		BlinkCmpDocSeparator = { bg = palette.hl_low },
		BlinkCmpDocBorder = { fg = palette.hl_high },
		BlinkCmpGhostText = { fg = palette.muted },

		BlinkCmpLabel = { fg = palette.muted },
		BlinkCmpLabelDeprecated = { fg = palette.muted, strikethrough = true },
		BlinkCmpLabelMatch = { fg = palette.fg, bold = styles.bold },

		BlinkCmpDefault = { fg = palette.hl_med },
		BlinkCmpKindText = { fg = palette.grn },
		BlinkCmpKindMethod = { fg = palette.blu },
		BlinkCmpKindFunction = { fg = palette.blu },
		BlinkCmpKindConstructor = { fg = palette.blu },
		BlinkCmpKindField = { fg = palette.grn },
		BlinkCmpKindVariable = { fg = palette.mgt },
		BlinkCmpKindClass = { fg = palette.ylw },
		BlinkCmpKindInterface = { fg = palette.ylw },
		BlinkCmpKindModule = { fg = palette.blu },
		BlinkCmpKindProperty = { fg = palette.blu },
		BlinkCmpKindUnit = { fg = palette.grn },
		BlinkCmpKindValue = { fg = palette.red },
		BlinkCmpKindKeyword = { fg = palette.blu_b },
		BlinkCmpKindSnippet = { fg = palette.mgt },
		BlinkCmpKindColor = { fg = palette.red },
		BlinkCmpKindFile = { fg = palette.blu },
		BlinkCmpKindReference = { fg = palette.red },
		BlinkCmpKindFolder = { fg = palette.blu },
		BlinkCmpKindEnum = { fg = palette.blu },
		BlinkCmpKindEnumMember = { fg = palette.blu },
		BlinkCmpKindConstant = { fg = palette.ylw },
		BlinkCmpKindStruct = { fg = palette.blu },
		BlinkCmpKindEvent = { fg = palette.blu },
		BlinkCmpKindOperator = { fg = palette.blu },
		BlinkCmpKindTypeParameter = { fg = palette.blu_b },
		BlinkCmpKindCodeium = { fg = palette.blu },
		BlinkCmpKindCopilot = { fg = palette.blu },
		BlinkCmpKindSupermaven = { fg = palette.blu },
		BlinkCmpKindTabNine = { fg = palette.blu },

		-- folke/snacks.nvim
		SnacksIndent = { fg = palette.overlay },
		SnacksIndentChunk = { fg = palette.overlay },
		SnacksIndentBlank = { fg = palette.overlay },
		SnacksIndentScope = { fg = palette.blu },

		SnacksPickerMatch = { fg = palette.mgt, bold = styles.bold },

		-- justinmk/vim-sneak
		Sneak = { fg = palette.bg, bg = palette.red },
		SneakCurrent = { link = "StatusLineTerm" },
		SneakScope = { link = "IncSearch" },
	}
	local transparency_highlights = {
		DiagnosticVirtualTextError = { fg = groups.error },
		DiagnosticVirtualTextHint = { fg = groups.hint },
		DiagnosticVirtualTextInfo = { fg = groups.info },
		DiagnosticVirtualTextOk = { fg = groups.ok },
		DiagnosticVirtualTextWarn = { fg = groups.warn },

		FloatBorder = { fg = groups.border, bg = "NONE" },
		FloatTitle = { fg = palette.grn_b, bg = "NONE", bold = styles.bold },
		Folded = { fg = palette.fg, bg = "NONE" },
		NormalFloat = { bg = "NONE" },
		Normal = { fg = palette.fg, bg = "NONE" },
		NormalNC = { fg = palette.fg, bg = config.options.dim_inactive_windows and palette._nc or "NONE" },
		Pmenu = { fg = palette.subtle, bg = "NONE" },
		PmenuExtra = { fg = palette.fg, bg = "NONE" },
		PmenuKind = { fg = palette.blu, bg = "NONE" },
		SignColumn = { fg = palette.fg, bg = "NONE" },
		StatusLine = { fg = palette.subtle, bg = "NONE" },
		StatusLineNC = { fg = palette.muted, bg = "NONE" },
		TabLine = { bg = "NONE", fg = palette.subtle },
		TabLineFill = { bg = "NONE" },
		TabLineSel = { fg = palette.fg, bg = "NONE", bold = styles.bold },

		-- ["@markup.raw"] = { bg = "none" },
		["@markup.raw.markdown_inline"] = { fg = palette.ylw },
		-- ["@markup.raw.block"] = { bg = "none" },

		TelescopeNormal = { fg = palette.subtle, bg = "NONE" },
		TelescopePromptNormal = { fg = palette.fg, bg = "NONE" },
		TelescopeSelection = { fg = palette.fg, bg = "NONE", bold = styles.bold },
		TelescopeSelectionCaret = { fg = palette.grn_b },

		TroubleNormal = { bg = "NONE" },

		WhichKeyFloat = { bg = "NONE" },
		WhichKeyNormal = { bg = "NONE" },

		IblIndent = { fg = palette.overlay, bg = "NONE" },
		IblScope = { fg = palette.blu, bg = "NONE" },
		IblWhitespace = { fg = palette.overlay, bg = "NONE" },

		TreesitterContext = { bg = "NONE" },
		TreesitterContextLineNumber = { fg = palette.mgt, bg = "NONE" },

		MiniFilesTitleFocused = { fg = palette.mgt, bg = "NONE", bold = styles.bold },

		MiniPickPrompt = { bg = "NONE", bold = styles.bold },
		MiniPickBorderText = { bg = "NONE" },
	}

	for group, highlight in pairs(default_highlights) do
		highlights[group] = highlight
	end
	if styles.transparency then
		for group, highlight in pairs(transparency_highlights) do
			highlights[group] = highlight
		end
	end

	-- Reconcile highlights with config
	if config.options.highlight_groups ~= nil and next(config.options.highlight_groups) ~= nil then
		for group, highlight in pairs(config.options.highlight_groups) do
			local existing = highlights[group] or {}
			-- Traverse link due to
			-- "If link is used in combination with other attributes; only the link will take effect"
			-- see: https://neovim.io/doc/user/api.html#nvim_set_hl()
			while existing.link ~= nil do
				existing = highlights[existing.link] or {}
			end
			local parsed = vim.tbl_extend("force", {}, highlight)

			if highlight.fg ~= nil then
				parsed.fg = util.parse_color(highlight.fg) or highlight.fg
			end
			if highlight.bg ~= nil then
				parsed.bg = util.parse_color(highlight.bg) or highlight.bg
			end
			if highlight.sp ~= nil then
				parsed.sp = util.parse_color(highlight.sp) or highlight.sp
			end

			if (highlight.inherit == nil or highlight.inherit) and existing ~= nil then
				parsed.inherit = nil
				highlights[group] = vim.tbl_extend("force", existing, parsed)
			else
				parsed.inherit = nil
				highlights[group] = parsed
			end
		end
	end

	for group, highlight in pairs(highlights) do
		if config.options.before_highlight ~= nil then
			config.options.before_highlight(group, highlight, palette)
		end

		if highlight.blend ~= nil and (highlight.blend >= 0 and highlight.blend <= 100) and highlight.bg ~= nil then
			highlight.bg = util.blend(highlight.bg, highlight.blend_on or palette.bg, highlight.blend / 100)
		end

		highlight.blend = nil
		highlight.blend_on = nil

		if highlight._nvim_blend ~= nil then
			highlight.blend = highlight._nvim_blend
		end

		vim.api.nvim_set_hl(0, group, highlight)
	end

	--- Terminal
	if config.options.enable.terminal then
		vim.g.terminal_color_0 = palette.overlay -- black
		vim.g.terminal_color_8 = palette.subtle -- bright black
		vim.g.terminal_color_1 = palette.red -- red
		vim.g.terminal_color_9 = palette.red -- bright red
		vim.g.terminal_color_2 = palette.grn -- green
		vim.g.terminal_color_10 = palette.grn -- bright green
		vim.g.terminal_color_3 = palette.ylw -- yellow
		vim.g.terminal_color_11 = palette.ylw -- bright yellow
		vim.g.terminal_color_4 = palette.blu -- blue
		vim.g.terminal_color_12 = palette.blu -- bright blue
		vim.g.terminal_color_5 = palette.blu_b -- magenta
		vim.g.terminal_color_13 = palette.blu_b -- bright magenta
		vim.g.terminal_color_6 = palette.mgt -- cyan
		vim.g.terminal_color_14 = palette.mgt -- bright cyan
		vim.g.terminal_color_7 = palette.fg -- white
		vim.g.terminal_color_15 = palette.fg -- bright white

		-- Support StatusLineTerm & StatusLineTermNC from vim
		vim.cmd([[
		augroup rxze49
			autocmd!
			autocmd TermOpen * if &buftype=='terminal'
				\|setlocal winhighlight=StatusLine:StatusLineTerm,StatusLineNC:StatusLineTermNC
				\|else|setlocal winhighlight=|endif
			autocmd ColorSchemePre * autocmd! rxze49
		augroup END
		]])
	end
end

---@param variant Variant | nil
function M.colorscheme(variant)
	config.extend_options({ variant = variant })

	vim.opt.termguicolors = true
	if vim.g.colors_name then
		vim.cmd("hi clear")
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = "rxze49"

	if variant == "light" then
		vim.o.background = "light"
	elseif variant == "main" then
		vim.o.background = "dark"
	end

	set_highlights()
end

---@param options Options
function M.setup(options)
	config.extend_options(options or {})
end

return M
