-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("Mofiqul/vscode.nvim") --vs code like color scheme
	use("martinsione/darkplus.nvim")
	use("christoomey/vim-tmux-navigator")
	use("szw/vim-maximizer") --maximizes and restores current window

	--tutorial esential plugins. remove if useless
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")

	--comments with gc
	use("numToStr/Comment.nvim")

	--tree sitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("p00f/nvim-ts-rainbow") --colorized bracket pairs

	use("xiyaowong/nvim-transparent") --transparent background

	-- coppied and pasted code so style does not match
	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	--pop ups
	use("nvim-lua/popup.nvim")
	--plenty of plugins rely on this do not delete
	use("nvim-lua/plenary.nvim")

	--nvim tree
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	--LSP plugins
	use("jose-elias-alvarez/null-ls.nvim")
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	--lua line
	use("nvim-lualine/lualine.nvim")

	--teliscope fuzzy finder
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	--auto closing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	--git intigration
	use("lewis6991/gitsigns.nvim")

	--formatting and linting
	use("jayp0521/mason-null-ls.nvim")

	--run terminal apps in nvim
	use("akinsho/toggleterm.nvim")

	--debugging
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("leoluz/nvim-dap-go")
	use("nvim-telescope/telescope-dap.nvim")
	use("jayp0521/mason-nvim-dap.nvim")

	--grammar checking because epic comment "I can't english"
	use("rhysd/vim-grammarous")

	-- comment highlighting
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	--Start up screen
	use({
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("startup").setup({
				theme = "evil",
			})
		end,
	})

	--tabnine
	use("hrsh7th/nvim-cmp") --completion
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

  --catppucin color scheme
  use { "catppuccin/nvim", as = "catppuccin" }

  --tokyo night color scheme
  use ('folke/tokyonight.nvim')

  -- one darker color scheme
  use 'navarasu/onedark.nvim'

  --harpoon
  use('ThePrimeagen/harpoon')

	--done with plugin imports
	if packer_bootstrap then
		require("packer").sync()
	end
end)
