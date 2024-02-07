local vim = vim
return {
  {
  "williamboman/mason.nvim",
  lazy = false,
  priority = 1,
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      },
    })
  end,
},

 {
  "williamboman/mason-lspconfig.nvim",
  lazy = true,
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "gofmt",
      },
    })
  end
},

{
  "neovim/nvim-lspconfig",
  lazy = false,
  priority = 50,
  config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    lspconfig.lua_ls.setup({
      capabilities = capabilities
    })
    lspconfig.gopls.setup({
      capabilities = capabilities
    })
    lspconfig.tsserver.setup({
      capabilities = capabilities
    })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float)
    vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev)
    vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
    local opts = {}
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end
  }
}
