return {
  "saghen/blink.cmp",
  lazy = false, -- lazy loading handled internally

  dependencies = "rafamadriz/friendly-snippets",
  version = "^1.0.0",

  opts = {
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 250,
      },
    },
    keymap = {
      ["<C-.>"] = { "show" },
      ["<C-e>"] = { "hide" },
      ["<C-y>"] = { "accept" },

      ["<Up>"] = { "select_prev" },
      ["<C-p>"] = { "select_prev" },

      ["<Down>"] = { "select_next" },
      ["<C-n>"] = { "select_next" },

      ["<C-k>"] = { "show_documentation" },
      ["<C-d>"] = { "hide_documentation" },

      ["<C-b>"] = { "scroll_documentation_up" },
      ["<C-f>"] = { "scroll_documentation_down" },

      ["<C-cr>"] = { "snippet_forward" },
      ["<S-cr>"] = { "snippet_backward" },
    },

    signature = {
      enabled = true,
    }

  },
}
