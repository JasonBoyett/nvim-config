function UncolorMe(color)
  color = color or "tokyonight-night"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
  vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

--UncolorMe()

function SetLine()
  vim.cmd("hi clear Cursorline")
  -- vim.cmd("hi Cursorline gui=underline")
end

function Set_background()--this is a python function I made to randomize my background. Not included in this repo
  vim.cmd("! python3 ~/.terminal_backgrounds/selector.py")
end

--set_background()
