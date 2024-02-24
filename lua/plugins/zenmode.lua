return {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup {
      window = {
        backdrop = 0.85,
        width = 90,
        height = 1,
        options = {
          signcolumn = "yes",
          number = true,
          relativenumber = true,
          cursorline = true,
          cursorcolumn = true,
        }
      },
      gitsigns = { enabled = true },
      kitty = {
        enagled = true,
        font = "+4"
      }
    }
    vim.keymap.set("n", "<leader>z", ":ZenMode<CR>")
  end
}
