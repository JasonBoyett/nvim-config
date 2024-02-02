local ok, code_snap = pcall(require, "code_snap")
if not ok then
  return
end

require("carbon").setup({
  carbon_now_sh_browser = 'google-chrome'
})
