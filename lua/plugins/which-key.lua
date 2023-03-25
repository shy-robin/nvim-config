local wk = require("which-key")

vim.g.tmux_navigator_no_mappings = 1

-- Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use gh to show documentation in preview window
function _G.show_docs()
	local cw = vim.fn.expand("<cword>")
	if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
		vim.api.nvim_command("h " .. cw)
	elseif vim.api.nvim_eval("coc#rpc#ready()") then
		vim.fn.CocActionAsync("doHover")
	else
		vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
	end
end

function toggle_floaterm_size()
	local w = vim.g.floaterm_width
	if w == 0.9 then
		vim.api.nvim_command("FloatermUpdate --height=0.6 --width=0.6")
		vim.g.floaterm_width = 0.6
		vim.g.floaterm_height = 0.6
	else
		vim.api.nvim_command("FloatermUpdate --height=0.9 --width=0.9")
		vim.g.floaterm_width = 0.9
		vim.g.floaterm_height = 0.9
	end
end

local is_background_transparent = 0
function toggle_transparent_background()
	if is_background_transparent == 0 then
		vim.api.nvim_command("highlight Normal ctermbg=NONE guibg=NONE")
		is_background_transparent = 1
	else
		vim.api.nvim_command("set background=dark")
		is_background_transparent = 0
	end
end

-- NORMAL mode
wk.register({
	d = { '"_d', "Delete with no register" },
	dd = { '"_dd', "Delete a line with no register" },
	D = { '"_D', "Delete backward with no register" },
	c = { '"_c', "Change with no register" },
	cc = { '"_cc', "Change a line with no register" },
	C = { '"_C', "Change backward with no register" },
	s = { '"_s', "Replace with no register" },
	S = { '"_S', "Replace whole line with no register" },
	X = { "yydd", "Cut whole line with register" },
	J = { "5j", "Move 5 lines down" },
	K = { "5k", "Move 5 lines up" },
	H = { ":bprevious<CR>", "Previous Buffer" },
	L = { ":bnext<CR>", "Next Buffer" },
	tt = { ":enew<CR>", "New Buffer" },
	tw = { ":Bdelete this<CR>", "Delete Buffer" },
	tW = { ":bd!<CR>", "Delete buffer force" },
	to = { ":Bdelete other<CR>", "Delete All Buffers Except Current" },
	td = { ":Dashboard<CR>", "Open dashboard page" },
	f = { ":HopChar1<CR>", "Hop Char1" },
	F = { ":HopChar1CurrentLine<CR>", "Hop Char1 in current line" },
	g = {
		d = { "<Plug>(coc-definition)", "Go to definition" },
		D = { "<Plug>(coc-type-definition)", "Go to type definition" },
		i = { "<Plug>(coc-implementation)", "Go to type implementation" },
		r = { "<Plug>(coc-references)", "Go to type references" },
		n = { "<Plug>(coc-diagnostic-next)", "Go to next diagnostic" },
		N = { "<Plug>(coc-diagnostic-prev)", "Go to previous diagnostic" },
		l = { "<cmd>CocDiagnostics<CR>", "Diagnostic list" },
		h = { "<cmd>lua _G.show_docs()<CR>", "Show docs" },
	},
	-- ["<C-h>"] = { "<C-w>h", "Move to left window" },
	-- ["<C-j>"] = { "<C-w>j", "Move to below window" },
	-- ["<C-k>"] = { "<C-w>k", "Move to above window" },
	-- ["<C-l>"] = { "<C-w>l", "Move to right window" },
	["<C-o>"] = { "<cmd>FloatermToggle<CR>", "Toggle floaterm" },
	-- ["<C-p>"] = { "<cmd>FloatermNew<CR>", "New floaterm" },
	-- ["<C-z>"] = { "<cmd>FloatermPrev<CR>", "Prev floaterm" },
	-- ["<C-]>"] = { "<cmd>FloatermNext<CR>", "Next floaterm" },
	-- ["<C-q>"] = { "<cmd>FloatermKill<CR>", "Kill floaterm" },
	["<ESC>"] = { "<ESC>", "Not show floaterm" },
	["<C-h>"] = { "<cmd>TmuxNavigateLeft<CR>", "Tmux navigate left" },
	["<C-l>"] = { "<cmd>TmuxNavigateRight<CR>", "Tmux navigate right" },
	["<C-j>"] = { "<cmd>TmuxNavigateDown<CR>", "Tmux navigate down" },
	["<C-k>"] = { "<cmd>TmuxNavigateUp<CR>", "Tmux navigate up" },
})

-- VISUAL mode
wk.register({
	d = { '"_d', "delete with no register" },
	dd = { '"_dd', "delete a line with no register" },
	D = { '"_d', "delete backward with no register" },
	c = { '"_c', "change with no register" },
	cc = { '"_cc', "change a line with no register" },
	C = { '"_c', "change backward with no register" },
	s = { '"_s', "Replace with no register" },
	S = { '"_S', "Replace whole line with no register" },
	["<"] = { "<gv", "keep insert mode after indent" },
	[">"] = { ">gv", "keep insert mode after indent" },
	p = { '"_dp', "paste with no register" },
}, {
	mode = "v",
})

--VISUAL_BLOCK mode
wk.register({
	J = { ":move '>+1<CR>gv-gv", "Move text down" },
	K = { ":move '<-2<CR>gv-gv", "Move text up" },
}, {
	mode = "x",
})

-- INSERT mode
wk.register({
	jj = { "<ESC>", "Exit insert mode" },
	["<C-o>"] = { "<cmd>FloatermToggle<CR>", "Toggle floaterm" },
	-- ["<C-p>"] = { "<cmd>FloatermNew<CR>", "New floaterm" },
	-- ["<C-z>"] = { "<cmd>FloatermPrev<CR>", "Prev floaterm" },
	-- ["<C-]>"] = { "<cmd>FloatermNext<CR>", "Next floaterm" },
	-- ["<C-q>"] = { "<cmd>FloatermKill<CR>", "Kill floaterm" },
	["<ESC>"] = { "<ESC>", "Not show floaterm" },
}, {
	mode = "i",
})

-- TERMINAL mode
wk.register({
	["<C-o>"] = { "<C-\\><C-n><cmd>FloatermToggle<CR>", "Toggle floaterm" },
	["<C-k>"] = { "<cmd>FloatermNew<CR>", "New floaterm" },
	["<C-h>"] = { "<cmd>FloatermPrev<CR>", "Prev floaterm" },
	["<C-l>"] = { "<cmd>FloatermNext<CR>", "Next floaterm" },
	["<C-q>"] = { "<cmd>FloatermKill<CR>", "Kill floaterm" },
	["<ESC>"] = { "<ESC>", "Make ESC work" },
	["<C-j>"] = {
		"<cmd>lua toggle_floaterm_size()<CR>",
		"Maximize floaterm",
	},
	["<C-n>"] = { "<C-\\><C-n>", "Enter normal mode" },
	["<Tab>"] = { "<Tab>", "Make Tab work" },
}, {
	mode = "t",
})

-- OPERATOR_PENDING mode
wk.register({
	-- use y/c/d operators in Hop
	f = { ":HopChar1<CR>", "Hop Char1" },
	F = { ":HopChar1CurrentLine<CR>", "Hop Char1 in current line" },
}, {
	mode = "o", -- means Operator Pending Mode
})

-- NORMAL mode with <leader>
wk.register({
	n = {
		h = { ":nohl<CR>", "No highlight" },
	},
	e = { ":CocCommand explorer --toggle --quit-on-open<CR>", "File explorer" },
	q = { ":q<CR>", "Quit" },
	Q = { ":q!<CR>", "Quit Force" },
	w = {
		name = "Save file",
		w = { ":w!<CR>", "Save and format" },
		q = { ":wq<CR>", "Save format and quit" },
		n = { ":noa w!<CR>", "Save but not format" },
	},
	l = {
		g = { "<cmd>FloatermNew lazygit<CR>", "New lazygit floaterm" },
	},
	f = {
		name = "Telescope",
		f = {
			":Telescope find_files find_command=rg,--ignore,--hidden,--files,-u,--glob,!**/.git/*,--glob,!**/node_modules/*<cr>",
			-- ":Telescope find_files<cr>",
			"Find files",
		},
		s = { "<cmd>:lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", "Search text" },
		b = { ":Telescope buffers<cr>", "Search buffers" },
		o = { ":Telescope oldfiles<cr>", "Old files" },
		h = { ":Telescope help_tags<cr>", "Help tags" },
		c = { ":Telescope colorscheme<cr>", "Color scheme" },
		t = { ":TodoTelescope<cr>", "Show todo list" },
		r = { ":Telescope resume<cr>", "Rerun old finders" },
	},
	z = {
		name = "Focus mode",
		z = { ":ZenMode<cr>", "Zen mode" },
		t = { ":Twilight<cr>", "Twilight" },
	},
	b = {
		name = "Bufferline",
		b = { ":BufferLinePick<cr>", "Go to buffer" },
		w = { ":BufferLinePickClose<cr>", "Close buffer" },
		p = { ":BufferLineTogglePin<cr>", "Toggle buffer pin" },
	},
	c = {
		d = { ":CocList diagnostics<CR>", "Show all diagnostics" },
		e = { ":CocList extensions<CR>", "Manage extensions" },
		c = { ":CocList commands<CR>", "Show commands" },
		o = { ":CocList outline<CR>", "Find symbol of current document" },
		s = { ":CocList -I symbols<CR>", "Search workspace symbols" },
		l = { "<Plug>(coc-codelens-action)", "Run the Code Lens actions on the current line" },
	},
	a = {
		name = "Code action",
		a = { "<Plug>(coc-codeaction-selected)", "Apply codeAction to the selected region" },
		c = { "<Plug>(coc-codeaction-cursor)", "Apply codeAction at the cursor position" },
		s = { "<Plug>(coc-codeaction-source)", "Apply codeAction affect whole buffer" },
		b = { "<Plug>(coc-codeaction)", "Apply codeAction to the current buffer" },
		f = { "<Plug>(coc-fix-current)", "Apply the most preferred quickfix action on the current line" },
		R = { "<Plug>(coc-codeaction-refactor)", "Apply refactor code actions" },
		r = { "<Plug>(coc-codeaction-refactor-selected)", "Apply refactor code actions" },
	},
	s = {
		name = "Split window",
		s = { "<C-w>v", "Split window vertically" },
		S = { "<C-w>s", "Split window horizontally" },
		e = { "<C-w>=", "Make split windows equal width" },
		x = { ":close<CR>", "Close current split window" },
		k = { "5<C-w>+", "Resize split window" },
		j = { "5<C-w>-", "Resize split window" },
		l = { "5<C-w><", "Resize split window" },
		h = { "5<C-w>>", "Resize split window" },
	},
	r = {
		n = { "<Plug>(coc-rename)", "Rename symbol" },
		h = { ":syntax sync fromstart<CR>", "Reload syntax highlight" },
		-- h = { ":syn off | syn on<CR>", "Reload syntax highlight" },
		c = { ":call VrcQuery()<CR>", "Rest console" },
	},
	m = { "'", "Move to mark" },
	["+"] = { "<C-a>", "Number increase" },
	["-"] = { "<C-x>", "Number decrease" },
	t = {
		-- j = { ":TmuxNavigateDown<CR>", "TmuxNavigateDown" },
		-- k = { ":TmuxNavigateUp<CR>", "TmuxNavigateUp" },
		-- h = { ":TmuxNavigateLeft<CR>", "TmuxNavigateLeft" },
		-- l = { ":TmuxNavigateRight<CR>", "TmuxNavigateRight" },
		-- p = { ":TmuxNavigatePrevious<CR>", "TmuxNavigatePrevious" },
		t = { "<cmd>lua toggle_transparent_background()<CR>", "Toggle transparent background" },
	},
}, {
	prefix = "<leader>",
})

wk.register({
	f = { "<Plug>(coc-format-selected)", "Format selected code" },
	a = { "<Plug>(coc-codeaction-selected)", "Apply codeAction to the selected region" },
}, {
	prefix = "<leader>",
	mode = "x",
})
