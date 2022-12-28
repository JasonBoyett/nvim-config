local all_good, harpoon = pcall(require, "harpoon")
if not all_good then
  return
end

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

--adding harpoon keybindings
vim.keymap.set("n","<leader>h", mark.add_file)
vim.keymap.set("n","<leader>hh", ui.toggle_quick_menu)

vim.keymap.set("n","<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n","<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n","<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n","<leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n","<leader>5", function() ui.nav_file(5) end)
