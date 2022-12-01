vim.opt.clipboard = "unnamedplus" --allows nvim to use system clipboard
vim.opt.backup = false --creates backup config
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.cmdheight = 2
vim.opt.conceallevel = 0
vim.opt.hlsearch = true --highlights items being searched might dissable
vim.opt.ignorecase = true --ignores case in search
vim.opt.mouse = "a" --allows the mouse to be used in nvim might dissable later
vim.opt.pumheight = 10
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeoutlen = 1000
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2 --the number of spaces that are typed when indenting
vim.opt.tabstop = 2 --the number of spaces when hitting tab
vim.opt.number = true --line numbers
vim.opt.relativenumber = true --relative line numbers
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.wrap = true --line wrapping
vim.opt.scrolloff = 10 --sets the number of lines you can go before page starts scrolling
--vim.opt.sidescrolloff = 8
vim.opt.guifont = "OpenDyslexic NF" --sets the font in graphical nvim aps
vim.opt.backspace = "indent,eol,start"
vim.opt.background = "dark"
