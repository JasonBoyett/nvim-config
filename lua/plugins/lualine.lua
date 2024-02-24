local colors = {
  transparent = "#00FFFFFF",
  red = "#F44747",
  error_red = "#D16969",
  peach = "#ff954f",
  green = "#008000",
  light_green = "#03ff13",
  yellow = "#f7ff03",
  dark_yellow = "#e7f520",
  orange = "#f7be02",
  grey_blue = "#729CB3",
  blue = "#0096FF",
  sky_blue = "#9cf2ff",
  light_blue = "#11d6f5",
  vivid_blue = "#1F51FF",
  purple = "#AC4FC6",
  pink = "#FE00E7",
  cyan = "#4EC9B0",
  white = "#ABB2BF",
  black = "#1E1E1E",
}

local function candikrush()
  return {
    normal = {
      a = { bg = colors.purple, fg = colors.black, gui = "bold" },
      b = { bg = colors.transparent, fg = colors.purple, gui = "italic" },
      c = { bg = colors.transparent, fg = colors.white },
    },
    insert = {
      a = { bg = colors.blue, fg = colors.black, gui = "bold" },
      b = { bg = colors.transparent, fg = colors.blue, gui = "italic" },
      c = { bg = colors.transparent, fg = colors.white },
    },
    visual = {
      a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
      b = { bg = colors.transparent, fg = colors.yellow, gui = "italic" },
      c = { bg = colors.transparent, fg = colors.white },
    },
    replace = {
      a = { bg = colors.red, fg = colors.black, gui = "bold" },
      b = { bg = colors.lightgray, fg = colors.red, gui = "italic" },
      c = { bg = colors.transparent, fg = colors.white },
    },
    command = {
      a = { bg = colors.peach, fg = colors.black, gui = "bold" },
      b = { bg = colors.lightgray, fg = colors.peach, gui = "italic" },
      c = { bg = colors.transparent, fg = colors.white },
    },
    inactive = {
      a = { bg = colors.grey, fg = colors.blue, gui = "bold" },
      b = { bg = colors.grey, fg = colors.gray, gui = "italic" },
      c = { bg = colors.grey, fg = colors.gray },
    },
  }
end

local setup = function(theme)
  require("lualine").setup({
    options = {
      theme = theme,
    },
    sections = {
      lualine_c = {
        {
          "buffers",
          hide_filename_extension = true,
          symbols = { modified = " ", readonly = " ", close = "" },
          use_mode_colors = true,
          buffers_color = {
            active = "lualine_a_inactive",
            inactive = "lualine_c_inactive",
          },
        },
      },
    },
  })
end

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    setup(candikrush())
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = setup(candikrush())
    })
  end,
}
