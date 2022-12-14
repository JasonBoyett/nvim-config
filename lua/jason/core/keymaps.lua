vim.g.mapleader = " "

--function to allow option toggling
local function vim_opt_toggle(opt, on, off, name)
	local message = name
	if vim.opt[opt]:get() == off then
		vim.opt[opt] = on
		message = message .. " Enabled"
	else
		vim.opt[opt] = off
		message = message .. " Disabled"
	end
	vim.notify(message)
end

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", "_x")

--increment or decrement numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

--vim maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- Nvimtree
keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

--toggle spell checker
keymap.set("n", "<leader>sp", function()
	vim_opt_toggle("spell", true, false, "Spelling")
end)

--useful keymap that turns the semicolon into a colon in normal mode
keymap.set("n", ";", ":")

--save all buffers with leader w
keymap.set("n", "<leader>w", ":wa<cr>")

--save all buffers and quit with leader q
keymap.set("n", "<leader>q", ":wa<cr>:q<cr>")

--exit without saving with leader ESC
keymap.set("n", "<leader><ESC>", ":q!<cr>")

--format hotkeys
keymap.set("n", "<leader>sf", ":lua vim.lsp.buf.formatting_sync()<cr>")--lets user chose which formatter to use
keymap.set("n", "<leader>f", ":Format<cr>")--uses the lsp formatter

--toggle term
keymap.set("n", "<C-\\>", ":ToggleTerm <cr>")

--center when page jumping
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")

--remove highlight from search
keymap.set("n", "<leader>/", ":noh<CR>")
