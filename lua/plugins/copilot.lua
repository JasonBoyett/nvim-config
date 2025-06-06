local device_name = vim.env.DEVICE_NAME

if device_name == "Work Laptop" then
  return {}
end

return {
  "zbirenbaum/copilot.lua",
  opts = {
    panel = {
      enabled = true,
      auto_refresh = false,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open = "<M-CR>",
      },
      layout = {
        position = "bottom",
        ratio = 0.4,
      },
    },
    suggestion = {
      enabled = false,
      auto_trigger = false,
      debounce = 75,
      keymap = {
        accept = "<M-i>",
        accept_word = "<M-w>",
        accept_line = "<C-i>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      icon = {
        enabled = true,
        next = "▶",
        prev = "◀",
        accept = "✔",
        dismiss = "✘",
      },
    },
  },
}
