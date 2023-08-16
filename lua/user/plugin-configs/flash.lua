local all_good, flash = pcall(require, "flash")
if not all_good then
  return
end

require("flash").setup()
