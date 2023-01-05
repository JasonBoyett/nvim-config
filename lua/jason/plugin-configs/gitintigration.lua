local call, gitsigns = pcall(require, "gitsigns")
if not call then
  return
end

gitsigns.setup()
