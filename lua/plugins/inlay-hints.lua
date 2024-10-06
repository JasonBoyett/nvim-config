local endswith = function(str, ending)
	return ending == "" or str:sub(-#ending) == ending
end
return {
	"MysticalDevil/inlay-hints.nvim",
	event = "LspAttach",
	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
		require("inlay-hints").setup()
		local toggle_hints = function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end
		vim.keymap.set("n", "<LEADER>hh", toggle_hints, {})
		vim.api.nvim_create_autocmd("BufEnter", {
			callback = function()
				local enable = true
				local hide_hints = {
					".git",
					".github",
					".rs",
				}
				local filename = vim.fn.expand("%:t")
				for _, value in ipairs(hide_hints) do
					if endswith(filename, value) then
						enable = false
						break
					end
				end
				vim.lsp.inlay_hint.enable(enable)
			end,
		})
	end,
}
