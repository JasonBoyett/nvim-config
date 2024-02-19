return {
	"lukas-reineke/virt-column.nvim",
	config = function()
		require("virt-column").setup({
			char = "│",
			highlight = "VirtCol",
		})
		vim.cmd.highlight("VirtCol guifg=Yellow ctermfg=Yellow ctermbg=Yellow")
		vim.api.nvim_create_autocmd({ "ColorScheme", "BufWinEnter" }, {
			callback = function()
				vim.cmd.highlight("VirtCol guifg=Yellow guibg=NONE ctermfg=Yellow ctermbg=NONE")
			end,
		})
	end,
}
