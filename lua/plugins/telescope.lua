return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  pritority = 1,
  config = function()
    local builtin = require("telescope.builtin")
    -- vim.keymap.set("n", "<LEADER>ff", builtin.find_files, {})
    vim.keymap.set("n", "<LEADER>fs", builtin.live_grep, {})
    vim.api.nvim_set_keymap(
      "n",
      "<leader>dd",
      "<cmd>Telescope diagnostics<CR>",
      { noremap = true, silent = true }
    )
    -- telescope git commands
    vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")
    vim.keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>")
    vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")
    vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")
    vim.keymap.set("n", "<leader>cs", "<cmd>Telescope colorscheme<cr>")
    vim.keymap.set("n", "<leader>gb", "<cmd>Telescope buffers<cr>")
    vim.keymap.set('n', '<leader>fc', function()
      local word = vim.fn.expand('<cword>')
      require('telescope.builtin').grep_string({ search = word })
    end, { desc = 'Grep word under cursor' })
    vim.keymap.set('v', '<leader>fc', function()
      local selection = vim.fn.getline("'<", "'>")
      selection = table.concat(selection, "\n")
      require('telescope.builtin').live_grep({
        default_text = selection
      })
    end, { desc = 'Search selected text with live grep' })

    vim.keymap.set("n", "<leader>p", "<cmd>Telescope yank_history<cr>")
  end,
}
