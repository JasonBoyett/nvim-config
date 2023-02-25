local ok, dap = pcall(require, "mason")
if not ok then
  return
end

require("mason").setup()

local chill, nvi_mdap = pcall(require, "mason-nvim-dap")
if not chill then
  return
end

require("mason-nvim-dap").setup()