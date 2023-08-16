local all_good, hologram = pcall(require, "hologram")
if not all_good then
    return
end

require("hologram").setup{
  auto_display= true,
}
