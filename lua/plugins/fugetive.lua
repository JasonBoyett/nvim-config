return { 
  "tpope/vim-fugitive", 
  config = function()
    vim.keymap.set("n", "<LEADER>g", "<CMD>Git<CR>", {})
  end,
}
