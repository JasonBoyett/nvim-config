return {
  "https://github.com/ThePrimeagen/harpoon",
  config = function()
    local keymap = vim.keymap
    local harpoon = require("harpoon")

    harpoon.setup()
    keymap.set(
      "n",
      "<leader>h",
      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>"
    )
    keymap.set(
      "n",
      "<leader>m",
      "<cmd>lua require('harpoon.mark').add_file()<cr>"
    )
  end
}
