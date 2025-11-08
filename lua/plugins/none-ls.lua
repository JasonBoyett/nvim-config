return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local none_ls = require("null-ls")
    local b = none_ls.builtins

    none_ls.setup({
      sources = {
        b.formatting.isort,
        b.formatting.yapf,
        b.formatting.stylua,
        b.formatting.dxfmt,
        b.formatting.clang_format,
        b.formatting.gofmt,
        b.formatting.rubocop,
        b.formatting.prettier,
        b.formatting.black,
        b.diagnostics.mypy,
        b.completion.spell,
      },
      on_attach = function(client, bufnr)
        if client.name == "tsserver" then
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end
        if client.name == "pyright" then
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end
      end,
    })
  end,
}
