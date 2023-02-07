if vim.g.neovide then
	vim.opt.guifont = { "SauceCodePro Nerd Font:h16:i" }
	vim.g.neovide_scale_factor = 1

	-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
	-- vim.g.neovide_transparency = 0.0
	-- vim.g.transparency = 0.8
	-- vim.g.neovide_background_color = "rgba(0, 0, 0, 0.8)"

	-- vim.g.neovide_floating_blur_amount_x = 12.0
	-- vim.g.neovide_floating_blur_amount_y = 12.0

	vim.g.neovide_hide_mouse_when_typing = true
end
