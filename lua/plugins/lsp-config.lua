local vim = vim

local function pyright(capabilities)
  return {
    capabilities = capabilities,
    settings = {
      python = {
        pythonPath = vim.fn.getcwd() .. "/.venv/bin/python",
        venvPath = vim.fn.getcwd() .. "/.venv/bin/",
        analysis = {
          diagnosticSeverityOverrides = {
            reportUndefinedVariable = "information"
          }
        }
      },
    },
  }
end

local function tailwind(capabilities)
  return {
    capabilities = capabilities,
    settings = {
      tailwindCSS = {
        experimental = {
          classRegex = {
            { "cva\\(([^)]*)\\)",  "[\"'`]([^\"'`]*).*?[\"'`]" },
            { "cx\\(([^)]*)\\)",   "(?:'|\"|`)([^']*)(?:'|\"|`)" },
            { "cn\\(([^)]*)\\)",   "[\"'`]([^\"'`]*).*?[\"'`]" },
            { "([a-zA-Z0-9\\-:]+)" },
          },
        },
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

local function dart(capabilities)
  return {
    capabilities = capabilities,
    root_dir = require('lspconfig.util').root_pattern(
      'melos.yaml',
      'melos.yml'
    ),
    init_options = {
      onlyAnalyzeProjectsWithOpenFiles = false, -- Key for workspace-wide analysis
      suggestFromUnimportedLibraries = true,
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
    typescript = {
      tsserver = {
        maxTsServerMemory = 8192,
      },
    },
    initializationOptions = {
      preferences = {
        includeCompletionsForModuleExports = false,
      }
    },
    capabilities = capabilities,
    cmd = { "typescript-language-server", "--stdio" },
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
      local lspconfig = vim.lsp.config
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      lspconfig("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            hint = {
              enable = true,
            },
          },
        },
      })



      -- -- lsps that require special settings
      lspconfig("ts_ls", {
        on_attatch = function(client, bufnr)
          require("workspace-diagnostics")
              .populate_workspace_diagnostics(client, bufnr)
        end,
        capabilities = capabilities
      })
      lspconfig("rust_analyzer", rust(capabilities))
      lspconfig("gopls", go(capabilities))
      lspconfig("tailwindcss", tailwind(capabilities))
      lspconfig("pyright", pyright(capabilities))
      lspconfig("dartls", dart(capabilities))

      -- lsps that don't require special settings
      lspconfig("gleam", { capabilities = capabilities })
      lspconfig("elixirls", { capabilities = capabilities })
      lspconfig("solargraph", { capabilities = capabilities })
      lspconfig("csharp_ls", { capabilities = capabilities })
      lspconfig("eslint", { capabilities = capabilities })
      lspconfig("rubocop", { capabilities = capabilities })
      lspconfig("templ", { capabilities = capabilities })
      lspconfig("prismals", { capabilities = capabilities })
      lspconfig("tailwindcss", { capabilities = capabilities })

      vim.lsp.enable({
        "eslint",
        "ts_ls",
        "lua_ls",
        "rust_analyzer",
        "gopls",
        "tailwindcss",
        "dartls",
        "pyright",
        "gleam",
        "elixirls",
        "solargraph",
        "csharp_ls",
        "rubocop",
        "templ",
        "prismals",
        "tailwindcss",
      })

      vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float)
      vim.keymap.set("n", "<M-p>", vim.diagnostic.goto_prev)
      vim.keymap.set("n", "<M-n>", vim.diagnostic.goto_next)
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



      local format_augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = format_augroup,
        callback = function()
          local clients = vim.lsp.get_clients({ bufnr = 0, methods = { "textDocument/formatting" } })
          if #clients > 0 then
            vim.lsp.buf.format({ async = true, timeout_ms = 2000 })
          end
        end,
      })
    end,
  },
}
