return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  pritority = 1,
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<LEADER>ff", builtin.find_files, {})
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
      local _, ls, cs = table.unpack(vim.fn.getpos("'<"))
      local _, le, ce = table.unpack(vim.fn.getpos("'>"))

      local lines = vim.fn.getline(ls, le)
      if #lines == 0 then return end

      lines[#lines] = string.sub(lines[#lines], 1, ce)
      lines[1] = string.sub(lines[1], cs)

      local text = table.concat(lines, ' '):gsub("\n", ""):gsub('"', '\\"')

      require('telescope.builtin').grep_string({
        search = text,
      })
    end, { desc = 'Telescope grep smart visual selection' })
    require("telescope").load_extension("yank_history")
    vim.keymap.set("n", "<leader>p", "<cmd>Telescope yank_history<cr>")
  end,
}
