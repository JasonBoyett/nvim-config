return {
  "JasonBoyett/Goethe.nvim",
  -- dir = "/home/jboyett/Documents/dev/github/Goethe.nvim",
  opts = {
    default_theme = "catppuccin",
    auto_persist = true,
    override_groups = {
      { group = "statement",   tbl = { italic = true } },
      { group = "conditional", tbl = { italic = true } },
      { group = "function",    tbl = { italic = true } },
      { group = "comment",     tbl = { fg = "#9c7322" } },
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
