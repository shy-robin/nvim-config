-- local db = require("dashboard")
--
-- db.custom_header = {
-- 	[[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
-- 	[[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
-- 	[[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
-- 	[[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
-- 	[[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
-- 	[[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
-- }
-- db.custom_center = {
-- 	{
-- 		icon = "  ",
-- 		desc = "Find files                 ",
-- 		shortcut = "SPC f f",
-- 		action = "Telescope find_files",
-- 	},
-- 	{
-- 		icon = "  ",
-- 		desc = "Search text                ",
-- 		shortcut = "SPC f s",
-- 		action = "Telescope live_grep",
-- 	},
-- 	{
-- 		icon = "  ",
-- 		desc = "Recent files               ",
-- 		shortcut = "SPC f o",
-- 		action = "Telescope oldfiles",
-- 	},
-- 	{
-- 		icon = "  ",
-- 		desc = "Open config                ",
-- 		shortcut = "SPC f c",
-- 		action = "edit ~/.config/nvim/init.lua",
-- 	},
-- 	{
-- 		icon = "  ",
-- 		desc = "Open help                  ",
-- 		shortcut = "SPC f h",
-- 		action = "Telescope help_tags",
-- 	},
-- }
-- db.header_pad = 15
-- db.center_pad = 2
-- db.footer_pad = 2

local db = require("dashboard")

db.setup({
	theme = "hyper",
	config = {
		week_header = {
			enable = true,
		},
		header = {
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
			[[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
			[[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
			[[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
			[[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
			[[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
		},
		shortcut = {
			{ desc = " Plugins", group = "@property", action = "PackerStatus", key = "p" },
			{
				desc = " Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = " Text",
				group = "DiagnosticHint",
				action = "Telescope live_grep",
				key = "t",
			},
			{
				desc = " Scheme",
				group = "Number",
				action = "Telescope colorscheme",
				key = "s",
			},
		},
	},
})
