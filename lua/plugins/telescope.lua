return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<LEADER>ff", builtin.find_files, {})
    vim.keymap.set("n", "<LEADER>fs", builtin.live_grep, {})
    vim.api.nvim_set_keymap("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true })

    -- telescope git commands
    vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")
    vim.keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>")
    vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")
    vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")

    require("telescope").load_extension("yank_history")
    vim.keymap.set("n", "<leader>p", "<cmd>Telescope yank_history<cr>")
  end,
}
