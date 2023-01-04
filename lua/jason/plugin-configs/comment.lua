local ok, comment = pcall(require, "Comment")
  if not ok then
    return
  end

require("Comment").setup()
vim.keymap.set("n", "<leader>//", "gcc")
