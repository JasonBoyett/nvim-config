local lsp = require('lsp-zero').preset({
  name = 'recommended',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})

vim.diagnostic.config({
  underline = true,
  virtual_text = {
    source = "always",
    prefix = "◆",
    spacing = 2,
  },
  signs = true,
  update_in_insert = false,
  float ={
    focusable = true,
  }
})


vim.keymap.set('n', '<leader>tv', '<cmd>lua Toggle_vtext()<CR>')
-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.configure('tsserver', {
  on_attach = function(client, bufnr)
    require("twoslash-queries").attach(client, bufnr)
  end
})
lsp.setup()

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("lspconfig").tsserver.setup({
  handlers = {
    ["textDocument/publishDiagnostics"] = function(
      _,
      result,
      ctx,
      config
    )
      if result.diagnostics == nil then
        return
      end

      -- ignore some tsserver diagnostics
      local idx = 1
      while idx <= #result.diagnostics do
        local entry = result.diagnostics[idx]

        local formatter = require('format-ts-errors')[entry.code]
        entry.message = formatter and formatter(entry.message) or entry.message

        -- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
        if entry.code == 80001 then
          -- { message = "File is a CommonJS module; it may be converted to an ES module.", }
          table.remove(result.diagnostics, idx)
        else
          idx = idx + 1
        end
      end

      vim.lsp.diagnostic.on_publish_diagnostics(
        _,
        result,
        ctx,
        config
      )
    end,
  },
})

lspconfig.tailwindcss.setup({
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          { "cva\\(([^)]*)\\)",
           "[\"'`]([^\"'`]*).*?[\"'`]" },
        },
      },
    },
  },
})
