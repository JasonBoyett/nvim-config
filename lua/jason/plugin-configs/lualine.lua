local call, lualine = pcall(require, "lualine")
if not call then
  return
end

lualine.setup()