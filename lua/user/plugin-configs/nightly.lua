local all_good, nightly = pcall(require, "nightly")
if not all_good then
  return
end

require("nightly").setup({
  transparent = true,
  styles = {
    comments = { italic = true },
    functions = { italic = true },
    variables = { italic = true },
    keywords = { italic = true },
  },
  highlights = {},
})
