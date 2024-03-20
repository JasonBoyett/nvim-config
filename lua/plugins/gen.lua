return {
  "David-Kunz/gen.nvim",
  config = function()
    require("gen").setup({
      model = "llama2"
    })
    vim.keymap.set("v", "<leader>ai", ":'<,'>Gen<CR>")
    vim.keymap.set("n", "<leader>ai", ":Gen Chat<CR>")
  end,
}
