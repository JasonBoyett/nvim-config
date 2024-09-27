require("opts")
vim.lsp.set_log_level("off")

local function hasFileExtension(str)
	local pattern = "%.([a-zA-Z0-9]+)$"
	local extension = string.match(str, pattern)
	return extension ~= nil
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("nvim-treesitter.configs").setup({})

vim.keymap.set("n", "<LEADER>w", "<CMD>wa!<CR>", {})

vim.api.nvim_create_autocmd({ "BufEnter", "ColorScheme" }, {
	callback = function()
		local buffer = vim.api.nvim_buf_get_name(0)
		local isFile = hasFileExtension(buffer)
		if isFile then
			vim.opt.colorcolumn = "80"
		else
			vim.opt.colorcolumn = "0"
		end
	end,
})
