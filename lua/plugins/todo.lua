return {
  "folke/todo-comments.nvim",
  config = function()
    local todo = require("todo-comments")
    todo.setup()
    vim.keymap.set(
      "n",
      "<leader>td",
      "<cmd>TodoTelescope<cr>",
      { noremap = true, silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>tt",
      "<cmd>TodoTrouble<cr>",
      { noremap = true, silent = true }
    )
  end
}
