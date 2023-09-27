local ok, _ = pcall(require, "kanagawa")
if not ok then
  return
end


require('kanagawa').setup({
  commentStyle = { italic = true },
  functionStyle = { italic = true },
  keywordStyle = { italic = true },
  transparent = true,
  dimInactive = true,
  overrides = {
    'comment', {fg = '#9c7322'}
  }
})


vim.opt.termguicolors = true
