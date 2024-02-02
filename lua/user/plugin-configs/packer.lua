-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  --which key
  use("folke/which-key.nvim")

  --zen mode
  use({"folke/zen-mode.nvim", as = "zen-mode"})

  --markdown viewer
  use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  --tmux navigator
  use("https://github.com/christoomey/vim-tmux-navigator")

  use("Mofiqul/vscode.nvim") --vs code like color scheme
  use("martinsione/darkplus.nvim")
  use("loctvl842/monokai-pro.nvim")
  use("Shatur/neovim-ayu")

  use("christoomey/vim-tmux-navigator")
  use("szw/vim-maximizer") --maximizes and restores current window

  --flash.nvim for faster movement
  use('folke/flash.nvim')

  --toggling certain diagnostics
  use('WhoIsSethDaniel/toggle-lsp-diagnostics.nvim')

  --cute little light bulb to show code actions are available
  use('kosayoda/nvim-lightbulb')

  --image viewer
  use {'edluffy/holo/ram.nvim'}

  --telescope media viewer
  use('nvim-lua/popup.evim')
  use "nvim-lua/plenary.nvim"
  use('nvim-telescope/telescope.nvim')
  use('nvim-telescope/telescope-media-files.nvim')

  --tutorial esential plugins. remove if useless
  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister")

  --comments with gc
  use("numToStr/Comment.nvim")

  --screen snap tool
  use({
    "kristijanhusak/vim-carbon-now-sh",
    as = "carbon",

    
  })

  --keep cursor centered
  use("Aasim-A/scrollEOF.nvim")

  --tree sitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use('nvim-treesitter/playground')

  use("p00f/nvim-ts-rainbow") --colorized bracket pairs

  use("xiyaowong/nvim-transparent") --transparent background

  use({'marilari88/twoslash-queries.nvim', as = 'twoslash-queries'})

  -- coppied and pasted code so style does not match
  -- cmp plugins
  -- use("hrsh7th/nvim-cmp") -- The completion plugin
  -- use("hrsh7th/cmp-buffer") -- buffer completions
  -- use("hrsh7th/cmp-path") -- path completions
  -- use("hrsh7th/cmp-cmdline") -- cmdline completions
  -- use("saadparwaiz1/cmp_luasnip") -- snippet completions

  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  --pop ups
  use("nvim-lua/popup.nvim")
  --plenty of plugins rely on this do not delete
  use("nvim-lua/plenary.nvim")

  use ({
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      {
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        's1n7ax/nvim-window-picker',
        tag = "v1.*",
        config = function()
          require'window-picker'.setup({
            autoselect_one = true,
            include_current = true,
            filter_rules = {
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { 'neo-tree', "neo-tree-popup", "notify" },

                -- if the buffer type is one of following, the window will be ignored
                buftype = { 'terminal', "quickfix" },
              },
            },
            other_win_hl_color = '#e35e4f',
          })
        end,
      }
    },
    config = function ()
      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define("DiagnosticSignError",
        {text = " ", texthl = "DiagnosticSignError"})
      vim.fn.sign_define("DiagnosticSignWarn",
        {text = " ", texthl = "DiagnosticSignWarn"})
      vim.fn.sign_define("DiagnosticSignInfo",
        {text = " ", texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint",
        {text = "󰌵", texthl = "DiagnosticSignHint"})

      require("neo-tree").setup({
      })

      vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
    end
  })

  -- improving ui
  use("folke/noice.nvim")
  use("MunifTanjim/nui.nvim")
  use("rcarriga/nvim-notify")

  -- --LSP plugins
  -- use("jose-elias-alvarez/null-ls.nvim")
  -- use({
  -- 	"williamboman/mason.nvim",
  -- 	"williamboman/mason-lspconfig.nvim",
  -- 	"neovim/nvim-lspconfig",
  -- })
  -- use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  -- use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  -- use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  -- use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  --LSP Zero
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'williamboman/mason.nvim' }, -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' }, -- Optional
      { 'hrsh7th/cmp-path' }, -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' }, -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' }, -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    }
  }

  --lua line
  use("nvim-lualine/lualine.nvim")

  --teliscope fuzzy finder
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

  --telescope file explorer
  -- packer
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  use({
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({

        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.3
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = true,
          markdown = true,
          help = false,
          gitcommit = true,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {}, 
      })
    end,
  })
  --auto closing
  use("windwp/nvim-autopairs")
  use({"windwp/nvim-ts-autotag", as="nvim-ts-autotag"})

  --better hover window
  use("Fildo7525/pretty_hover")
  use("davidosomething/format-ts-errors.nvim")

  --git intigration
  use("lewis6991/gitsigns.nvim")

  --formatting and linting
  use("jayp0521/mason-null-ls.nvim")
  --formatting for prettier
  use('sbdchd/neoformat')

  --run terminal apps in nvim
  use("akinsho/toggleterm.nvim")

  --debugging
  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")
  use("leoluz/nvim-dap-go")
  use("nvim-telescope/telescope-dap.nvim")
  use("jayp0521/mason-nvim-dap.nvim")
  use('mfussenegger/nvim-dap-python')

  --grammar checking because epic comment "I can't english"
  use("rhysd/vim-grammarous")

  -- comment highlighting
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })
  --Start up screen
  use({
    "startup-nvim/startup.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("startup").setup({
        theme = "dashboard",
      })
    end,
  })

  --tabnine
  use("hrsh7th/nvim-cmp") --completion
  use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

  --kanagawa color scheme
  use("rebelot/kanagawa.nvim")
  --catppucin color scheme
  use { "catppuccin/nvim", as = "catppuccin" }

  --dracula color scheme
  use('Mofiqul/dracula.nvim')

  --tokyo night color scheme
  use('folke/tokyonight.nvim')

  --gruvbox color scheme
  use('morhetz/gruvbox')

  -- one darker color scheme
  use 'navarasu/onedark.nvim'

  --harpoon
  use('ThePrimeagen/harpoon')

  --colorizer
  use('norcalli/nvim-colorizer.lua')

  --candikrush my custom color theme
  use('JasonBoyett/candikrush')

  --Rose Pine color scheme
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  --nightly color scheme
  use("Alexis12119/nightly.nvim")

  --fugitive for using git
  use('tpope/vim-fugitive')

  --done with plugin imports
  if packer_bootstrap then
    require("packer").sync()
  end
end)
