vim.g.mapleader = " "

--function to allow option toggling
local function vim_opt_toggle(opt, on, off, name)
  local message = name
  if vim.opt[opt]:get() == off then
    vim.opt[opt] = on
    message = message .. " Enabled"
  else
    vim.opt[opt] = off
    message = message .. " Disabled"
  end
  vim.notify(message)
end

local keymap = vim.keymap

keymap.set("n", "x", "_x")
--an experimental keymap to make curly braces easier to work with
-- keymap.set("i", "{{", "{<CR>}<ESC>O")

--move selected lines
keymap.set("v", "<leader>j", "<cmd>m '>+1<CR>gv=gv")
keymap.set("v", "<leader>k", "<cmd>m '<-2<CR>gv=gv")
keymap.set("n", "<leader>j", "<cmd>m +1<CR>")
keymap.set("n", "<leader>k", "<cmd>m -2<CR>")

--open media viewer
keymap.set("n", "<leader>mf", "<cmd>lua require('telescope').extensions.media_files.media_files()<CR>")

--centers the term when searching
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

--ToggleTerm
keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>")

--keymap for zen mode 
keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>")

--increment or decrement numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

--keymaps for debugging
keymap.set("n", "<C-5>", "<cmd>lua require'dap'.continue()<CR>")
keymap.set("n", "<C-3>", "<cmd>lua require'dap'.step_over()<CR>")
keymap.set("n", "<C-2>", "<cmd>lua require'dap'.step_into()<CR>")
keymap.set("n", "<C-1>", "<cmd>lua require'dap'.step_out()<CR>")
keymap.set("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
keymap.set("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
keymap.set("n", "<leader>lp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>")
keymap.set("n", "<leader>dt", "<cmd>lua require'dap-go'.debug_test()<CR>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>") -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>") --  go to previous tab
keymap.set("n", "<leader>ee", "<cmd>e<CR> <cmd>Telescope find_files<cr>") -- go to last tab



-- vim-maximizer
keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fe", "<cmd>Telescope file_browser<cr>") -- file browser
keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<cr>") -- go to definition

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>") -- mapping to restart lsp if necessary
keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
-- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })

--hover over for documentation
keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")


--toggle spell checker
keymap.set("n", "<leader>sp", function()
  vim_opt_toggle("spell", true, false, "Spelling")
end)
keymap.set("n", "<leader>ss", "z=")

--useful keymap that turns the semicolon into a colon in normal mode
keymap.set("n", ";", ":")

--save all buffers with leader w
keymap.set("n", "<leader>w", "<cmd>wa!<cr>")

--save all buffers and quit with leader q
keymap.set("n", "<leader>q", "<cmd>wa!<cr><cmd>q<cr>")

--format hotkeys
keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<cr>") --lets user chose which formatter to use
-- keymap.set("n", "<leader>f", "<cmd>Format<cr>") --uses the lsp formatter

--toggle term
-- keymap.set("n", "<C-\\>", "<cmd>ToggleTerm<CR>")

--center when page jumping
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")

--remove highlight from search
keymap.set("n", "<leader>/", "<cmd>noh<CR>")

--keymap for git fugitive
keymap.set("n", "<leader>g", vim.cmd.Git)

--keymaps for Copilot
keymap.set("n", "<leader>gp", "<cmd>Copilot panel<CR>")
vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.api.nvim_set_keymap("i", "<S-ESC>", 'copilot#Accept()', { silent = true, expr = true })
