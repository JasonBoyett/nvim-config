local status, packer = pcall(require, "packer")
if not status then
  return
end

require("format-ts-errors").setup()
