local wk = require("which-key")

wk.register({
	H = { ":bprevious<CR>", "Previous Buffer" },
	L = { ":bnext<CR>", "Next Buffer" },
	tt = { ":enew<CR>", "New Buffer" },
	tw = { ":Bdelete this<CR>", "Delete Buffer" },
	to = { ":Bdelete other<CR>", "Delete All Buffers Except Current" },
	f = { ":HopChar1<CR>", "Hop Char1" },
	F = { ":HopChar1CurrentLine<CR>", "Hop Char1 in current line" },
	["<C-p>"] = { "<cmd>FloatermNew<CR>", "New floaterm" },
	["<C-\\>"] = { "<cmd>FloatermToggle<CR>", "Toggle floaterm" },
	["<C-[>"] = { "<cmd>FloatermPrev<CR>", "Prev floaterm" },
	["<C-]>"] = { "<cmd>FloatermNext<CR>", "Next floaterm" },
	["<C-q>"] = { "<cmd>FloatermKill<CR>", "Kill floaterm" },
	["<ESC>"] = { "<ESC>", "Not show floaterm" },
})

wk.register({
	["<C-p>"] = { "<cmd>FloatermNew<CR>", "New floaterm" },
	["<C-\\>"] = { "<cmd>FloatermToggle<CR>", "Toggle floaterm" },
	["<C-[>"] = { "<cmd>FloatermPrev<CR>", "Prev floaterm" },
	["<C-]>"] = { "<cmd>FloatermNext<CR>", "Next floaterm" },
	["<C-q>"] = { "<cmd>FloatermKill<CR>", "Kill floaterm" },
}, {
	mode = "i",
})

wk.register({
	["<C-p>"] = { "<cmd>FloatermNew<CR>", "New floaterm" },
	["<C-\\>"] = { "<cmd>FloatermToggle<CR>", "Toggle floaterm" },
	["<C-[>"] = { "<cmd>FloatermPrev<CR>", "Prev floaterm" },
	["<C-]>"] = { "<cmd>FloatermNext<CR>", "Next floaterm" },
	["<C-q>"] = { "<cmd>FloatermKill<CR>", "Kill floaterm" },
	["<ESC>"] = { "<ESC>", "Make ESC work" },
}, {
	mode = "t",
})

wk.register({
	-- use y/c/d operators in Hop
	f = { ":HopChar1<CR>", "Hop Char1" },
	F = { ":HopChar1CurrentLine<CR>", "Hop Char1 in current line" },
}, {
	mode = "o", -- means Operator Pending Mode
})

wk.register({
	e = { ":CocCommand explorer --toggle --quit-on-open --position floating<CR>", "File explorer" },
	q = { ":q<CR>", "Quit" },
	Q = { ":q!<CR>", "Quit Force" },
	w = {
		name = "Save file",
		w = { ":w<CR>", "Save and format" },
		q = { ":wq<CR>", "Save format and quit" },
		n = { ":noa w<CR>", "Save but not format" },
	},
	l = {
		name = "LSP",
		i = { ":LspInfo<cr>", "Connected Language Servers" },
		k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
		K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
		w = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
		W = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
		l = {
			"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
			"List Workspace Folders",
		},
		t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
		r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
		R = { "<cmd>Lspsaga rename<cr>", "Rename" },
		a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
		e = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
		n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Go To Next Diagnostic" },
		N = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Go To Previous Diagnostic" },
		g = { "<cmd>FloatermNew lazygit<CR>", "New lazygit floaterm" },
	},
	f = {
		name = "Telescope",
		f = { ":Telescope find_files<cr>", "Find files" },
		s = { ":Telescope live_grep<cr>", "Search text" },
		b = { ":Telescope buffers<cr>", "Search buffers" },
		o = { ":Telescope oldfiles<cr>", "Old files" },
		h = { ":Telescope help_tags<cr>", "Help tags" },
		c = { ":e ~/.config/nvim/init.lua<cr>", "Open nvim config" },
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
	m = { "'", "Move to mark" },
}, {
	prefix = "<leader>",
})
