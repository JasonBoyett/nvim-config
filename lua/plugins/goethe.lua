local copilot = (
  function()
    local machine = vim.env.DEVICE_NAME

    if machine == "Work Laptop" then
      return nil
    end
    return {
      group = "CopilotSuggestion",
      tbl = { italic = false }
    }
  end
)()

return {
  "JasonBoyett/Goethe.nvim",
  priority = 5,
  opts = {
    default_theme = "catppuccin",
    auto_persist = true,
    override_groups = {
      {
        group = "LspInlayHint",
        tbl = {
          bg = "NONE",
          italic = true,
          fg = "#5f6f72",
        },
      },

      copilot,
      { group = "statement",              tbl = { italic = true } },
      { group = "conditional",            tbl = { italic = true } },
      { group = "Keyword",                tbl = { italic = true } },
      { group = "Repeat",                 tbl = { italic = true } },
      { group = "@keyword",               tbl = { italic = true } },
      { group = "@keyword.import",        tbl = { italic = true } },
      { group = "@keyword.conditional",   tbl = { italic = true } },
      { group = "@keyword.function",      tbl = { italic = true } },
      { group = "@constant.builtin",      tbl = { italic = true } },
      { group = "@keyword.return.dart",   tbl = { italic = true } },
      { group = "@keyword.modifier.dart", tbl = { italic = true } },
      { group = "@lsp.type.keyword.dart", tbl = { italic = true } },
      { group = "function",               tbl = { italic = false } },
      { group = "DiagnosticUnnecessary",  tbl = { italic = false } },
      { group = "Special",                tbl = { italic = false } },
      { group = "@module",                tbl = { italic = false } },
      { group = "@variable",              tbl = { italic = false } },
      { group = "normal",                 tbl = { italic = false } },
      { group = "identifier",             tbl = { italic = false } },
      { group = "string",                 tbl = { italic = false } },
      { group = "comment",                tbl = { fg = "#9c7322" } },
    },
    theme_overrides = {
      { theme = "ayu",        override = "ayu-mirage" },
      { theme = "material",   override = "material-deep-ocean" },
      { theme = "kanagawa",   override = "kanagawa-wave" },
      { theme = "tokyonight", override = "tokyonight-night" },
      { theme = "catppuccin", override = "catppuccin-mocha" },
    },
  },
}
