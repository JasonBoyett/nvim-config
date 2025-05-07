local device_name = vim.env.DEVICE_NAME

if device_name == "Work Laptop" then
  return {}
end

return {
  -- "zbirenbaum/copilot.lua",
  -- opts = {
  --   panel = {
  --     enabled = true,
  --     auto_refresh = false,
  --     keymap = {
  --       jump_prev = "[[",
  --       jump_next = "]]",
  --       accept = "<CR>",
  --       refresh = "gr",
  --       open = "<M-CR>",
  --     },
  --     layout = {
  --       position = "bottom",
  --       ratio = 0.4,
  --     },
  --   },
  --   suggestion = {
  --     enabled = true,
  --     auto_trigger = true,
  --     debounce = 75,
  --     keymap = {
  --       accept = "<M-i>",
  --       accept_word = "<M-w>",
  --       accept_line = "<C-i>",
  --       next = "<M-]>",
  --       prev = "<M-[>",
  --       dismiss = "<C-]>",
  --     },
  --     icon = {
  --       enabled = true,
  --       next = "▶",
  --       prev = "◀",
  --       accept = "✔",
  --       dismiss = "✘",
  --     },
  --   },
  -- },
}
