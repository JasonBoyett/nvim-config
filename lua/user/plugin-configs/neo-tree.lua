local ok, neo_tree = pcall(require, "neo-tree")
  if not ok then
    return
  end

require("neo-tree").setup()
