local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "jason.plugin-configs.lsp.mason"
--require("jason.plugin-configs.lsp.handlers").setup()
require("jason.plugin-configs.lsp.lspconfig")
--require("jaosn.plugin-configs.lsp.lspsaga")
require "jason.plugin-configs.lsp.null-ls"
