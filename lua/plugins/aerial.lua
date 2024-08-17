return {
  'stevearc/aerial.nvim',
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("aerial").setup({
      close_on_select = true,
      autojump = true,
      show_guides = true,
      guides = {
        mid_item   = "├╴",
        last_item  = "└╴",
        nested_top = "│ ",
        whitespace = "  ",
      },
    })
    vim.keymap.set("n", "<leader>aa", "<cmd>AerialToggle<cr>", {})
  end,
}
