local ensure_installed = {
  "lua",
  "rust",
}
return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    priority = 50,
    config = function()
      require("nvim-treesitter.configs").setup({
        sync_install = true,
        modules = {},
        ensure_installed = {},
        ignore_install = {},
        auto_install = true,
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
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup {

        modules = {},
        auto_install = true,
        ensure_installed = ensure_installed,
        sync_install = false,
        ignore_install = { "" }, -- List of parsers to ignore installing
        highlight = {
          enable = true,         -- false will disable the whole extension
          disable = { "" },      -- list of language that will be disabled
          additional_vim_regex_highlighting = true,

        },
        indent = { enable = true, disable = { "yaml" } },
        rainbow = {
          enable = true,
          max_file_lines = nil,                                                                     -- Do not enable for files with more than n lines, int
          extended_mode = true,
          colors = { '#5fd61a', '#1ab7d6', '#e0de43', '#992285', '#cf9ef0', '#f58505', '#229963' }, -- table of hex strings
        }
      }

      require "nvim-treesitter.configs".setup {
        modules = {},
        auto_install = true,
        ensure_installed = ensure_installed,
        sync_install = false,
        ignore_install = { "" }, -- List of parsers to ignore installing
        playground = {
          enable = true,
          disable = {},
          updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<CR>',
            show_help = '?',
          },
        },
      }
    end,
  },
}
