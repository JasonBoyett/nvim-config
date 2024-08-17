return {
  "folke/trouble.nvim",

  config = function()
    local trouble = require("trouble")
    trouble.setup({
      modes = {
        diagnostics = {
          win = { position = "right" },
        }
      },
    })
    vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", {})
  end
}
