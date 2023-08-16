local allgood, lightbulb = pcall(require, "nvim-lightbulb")
if not allgood then
  return
end

require("nvim-lightbulb").setup({
  autocmd = { enabled = true }
})
