-- local colorscheme = 'tokyonight'
local colorscheme = "onedark"
vim.cmd("set background=dark")

-- .. is used to connect two strings
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
