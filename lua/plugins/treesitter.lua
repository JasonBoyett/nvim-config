return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    priority = 50,
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["as"] = {
                query = "@scope",
                query_group = "locals",
                desc = "Select language scope"
              },
            },
            selection_modes = {
              ["@parameter.outer"] = "v",
              ["@function.outer"] = "V",
              ["@class.outer"] = "<c-v>",
            },
            include_surrounding_whitespace = true,
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    priority = 1,
    build = "TSupdate",
    opts = {
      ensure_installed = { "all" },
      hilight = {
        enabled = true,
        additional_vim_regex_highlighting = true,
      },
      indent = { enabled = true },
    },
  },
}
