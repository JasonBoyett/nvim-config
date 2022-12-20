function uncolorMe(color)
  colr = color or "tokyonight-night"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
  vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

uncolorMe()

function setLine()
  vim.cmd("hi clear Cursorline")
  vim.cmd("hi Cursorline gui=underline")
end
