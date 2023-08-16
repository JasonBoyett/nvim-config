local all_good, autopairs = pcall(require, "nvim-autopairs")
if not all_good then
  return
end

autopairs.setup {
  disable_filetype = { "TelescopePrompt" },
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
  enable_moveright = true,
  enable_afterquote = true,
  enable_check_bracket_line = true,
  check_ts = true,
}
