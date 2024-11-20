local vim = vim

local function pyright(capabilities)
  return {
    capabilities = capabilities,
    settings = {
      python = {
        pythonPath = "python3",
      },
    },
  }
end

local function go(capabilities)
  return {
    capabilities = capabilities,
    settings = {
      gopls = {
        ["ui.inlayhing.hints"] = {
          compositeLiteralFields = true,
          constantValues = true,
          parameterNames = true,
        },
      },
    },
  }
end

local function rust(capabilities)
  return {
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        inlayHints = {
          bindingModeHints = {
            enable = false,
          },
          chainingHints = {
            enable = true,
          },
          closingBraceHints = {
            enable = true,
            minLines = 25,
          },
          closureReturnTypeHints = {
            enable = "never",
          },
          lifetimeElisionHints = {
            enable = "never",
            useParameterNames = false,
          },
          maxLength = 25,
          parameterHints = {
            enable = true,
          },
          reborrowHints = {
            enable = "never",
          },
          renderColons = true,
          procMacro = {
            enable = true,
          },
          cargo = {
            buildScripts = {
              enable = true,
            },
          },
          typeHints = {
            enable = true,
            hideClosureInitialization = false,
            hideNamedConstructor = false,
          },
        },
      },
    },
  }
end

local function typescript(capabilities)
  return {
    capabilities = capabilities,
    settings = {
      typescript = {
        format = {
          semicolons = "remove"
        },
        inlayHints = {
          includeInlayParameterNameHints = "literals",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = false,
          includeInlayVariableTypeHints = false,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = false,
          includeInlayFunctionLikeReturnTypeHints = false,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  }
end

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
            package_uninstalled = "✗",
          },
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
          "gofmt",
          "masonls",
        },
      })
    end,
  },
  {
    -- "folke/neodev.nvim",
  },
  {
    "folke/lazydev.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    priority = 50,
    config = function()
      -- require("neodev").setup()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            hint = {
              enable = true,
            },
          },
        },
      })


      -- lsps that require special settings
      lspconfig.rust_analyzer.setup(rust(capabilities))
      lspconfig.gopls.setup(go(capabilities))
      lspconfig.ts_ls.setup(typescript(capabilities))
      lspconfig.pyright.setup(pyright(capabilities))
      lspconfig.tailwindcss.setup({ capabilities = capabilities })

      -- lsps that don't require special settings
      lspconfig.dartls.setup({ capabilities = capabilities })
      lspconfig.gleam.setup({ capabilities = capabilities })
      lspconfig.elixirls.setup({ capabilities = capabilities })
      lspconfig.solargraph.setup({ capabilities = capabilities })
      lspconfig.csharp_ls.setup({ capabilities = capabilities })
      lspconfig.eslint.setup({ capabilities = capabilities })
      lspconfig.rubocop.setup({ capabilities = capabilities })
      lspconfig.templ.setup({ capabilities = capabilities })
      lspconfig.prismals.setup({ capabilities = capabilities })
      lspconfig.tailwindcss.setup({ capabilities = capabilities })

      vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float)
      vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)
      vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
      vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
      local opts = {}
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
      end, opts)
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, opts)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)

      -- auto command to format on save
      vim.api.nvim_create_autocmd("BufWrite", {
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end,
  },
}
