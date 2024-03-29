local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost setupPlugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	-- All plugins will live in ~/.local/share/nvim/site/pack/packer/start
	-- "user/repo"
	-- Simple plugins can be specified as strings
	use("wbthomason/packer.nvim") -- Have packer manage itself

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- colorschemes
	use("folke/tokyonight.nvim")
	use("NLKNguyen/papercolor-theme")
	use("morhetz/gruvbox")
	use("joshdick/onedark.vim")
	use("sainnhe/everforest")
	use("w0ng/vim-hybrid")
	use("cormacrelf/vim-colors-github")
	use("gavinok/spaceway.vim")
	use("larsbs/vimterial")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({
		"akinsho/bufferline.nvim",
		tag = "v3.*",
		requires = "nvim-tree/nvim-web-devicons",
	})

	use("nvim-tree/nvim-web-devicons")

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	use("windwp/nvim-ts-autotag")

	-- use("p00f/nvim-ts-rainbow")

	use("windwp/nvim-autopairs")

	use("folke/which-key.nvim")

	use("Asheq/close-buffers.vim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use("onsails/lspkind.nvim")

	use("norcalli/nvim-colorizer.lua")

	use("lewis6991/gitsigns.nvim")

	use("glepnir/dashboard-nvim")

	use("lukas-reineke/indent-blankline.nvim")

	use("numToStr/Comment.nvim")

	use("akinsho/toggleterm.nvim")

	use("glepnir/lspsaga.nvim")

	use("williamboman/mason.nvim")

	use("folke/zen-mode.nvim")

	use("folke/twilight.nvim")

	use("jose-elias-alvarez/null-ls.nvim")

	use("nvim-lua/plenary.nvim")

	use("phaazon/hop.nvim")

	use("MunifTanjim/nui.nvim")
	use("rcarriga/nvim-notify")
	use({
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	})

	use("SmiteshP/nvim-navic")
	use({
		"utilyre/barbecue.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
	})

	use("dstein64/vim-startuptime")

	use("karb94/neoscroll.nvim")

	use("chentoast/marks.nvim")

	use("christoomey/vim-tmux-navigator")

	use({ "neoclide/coc.nvim", branch = "release" })

	use("voldikss/vim-floaterm")

	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
	})

	use("IngoMeyer441/coc_current_word")

	use("mg979/vim-visual-multi")

	use("folke/todo-comments.nvim")

	use("nvim-telescope/telescope-live-grep-args.nvim")

	use("diepm/vim-rest-console")

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	use("leafOfTree/vim-svelte-plugin")

	use({
		"rest-nvim/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use("justinmk/vim-gtfo")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end a all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
