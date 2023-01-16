local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-------------------------
-- GENERAL KEYMAPS
-------------------------

---------- Normal ----------

-- no highlight  <CR> means Carriage Return
keymap("n", "<leader>nh", ":nohl<CR>", opts)

-- the content deleted or changed will not put in register
keymap("n", "d", '"_d', opts)
keymap("n", "dd", '"_dd', opts)
keymap("n", "D", '"_D', opts)

keymap("n", "c", '"_c', opts)
keymap("n", "cc", '"_cc', opts)
keymap("n", "C", '"_C', opts)

-- increase or decrease number
keymap("n", "<leader>+", "<C-a>", opts)
keymap("n", "<leader>-", "<C-x>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- split window
keymap("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width
keymap("n", "<leader>sx", ":close<CR>", opts) -- close current split window 

-- tab
keymap("n", "tt", ":tabnew<CR>", opts) -- open new tab
keymap("n", "tw", ":tabclose<CR>", opts) -- close current tab
keymap("n", "tl", ":tabn<CR>", opts) -- go to the next tab
keymap("n", "th", ":tabp<CR>", opts) -- go to the previous tab

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

---------- Insert ----------

-- Press j fast to enter
keymap("i", "jj", "<ESC>", opts)

---------- Visual ----------

-- the content deleted or changed will not put in register
keymap("v", "d", '"_d', opts)
keymap("v", "dd", '"_dd', opts)
keymap("v", "D", '"_D', opts)

keymap("v", "c", '"_c', opts)
keymap("v", "cc", '"_cc', opts)
keymap("v", "C", '"_C', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-------------------------
-- PLUGIN KEYMAPS
-------------------------

-- vim-maximizer
keymap("n", "<leader>sm", ":MaximizerToggle<CR>", opts)

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts) -- find files within current working directory, respects .gitignore
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts) -- find string in current working directory as you type
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", opts) -- find string under cursor in current working directory
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts) -- list open buffers in current neovim instance
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts) -- list available help tags
