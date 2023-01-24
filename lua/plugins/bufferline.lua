require("bufferline").setup({
	options = {
		show_close_icon = false,
		diagnostics = "coc",
		diagnostics_indicator = function(count)
			return "<" .. count .. ">"
		end,
		numbers = function(opts)
			return string.format("%s", opts.raise(opts.ordinal))
		end,
	},
})
