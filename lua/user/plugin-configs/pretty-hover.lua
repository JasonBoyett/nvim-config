local status, packer = pcall(require, "packer")
if not status then
  return
end

require("pretty_hover").setup()
