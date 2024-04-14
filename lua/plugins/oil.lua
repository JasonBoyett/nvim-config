return {
  'stevearc/oil.nvim',
  config = function()
    local oil = require('oil')

    oil.setup({
      float = {
        padding = 2,
        border = "rounded",
      },
      experimental_watch_for_changes = true,
    })
    vim.keymap.set(
      "n",
      "-",
      "<CMD>lua require(\"oil\").toggle_float()<CR>",
      { desc = "Open parent directory" }
    )
  end,
}
