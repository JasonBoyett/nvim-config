local keymap = vim.keymap
--move selected line / block of text in visual mode
keymap.set("v", "<leader>j", "<cmd>m '>+1<CR>gv=gv")
keymap.set("v", "<leader>k", "<cmd>m '<-2<CR>gv=gv")
keymap.set("n", "<leader>j", "<cmd>m +1<CR>")
keymap.set("n", "<leader>k", "<cmd>m -2<CR>")

--centers the term when searching
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

--increment or decrement numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>") -- close current split window

-- split navigation
keymap.set("n", "<C-h>", "<C-w>h") -- move to the split window to the left
keymap.set("n", "<C-j>", "<C-w>j") -- move to the split window below
keymap.set("n", "<C-k>", "<C-w>k") -- move to the split window above
keymap.set("n", "<C-l>", "<C-w>l") -- move to the split window to the right

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>") --  go to previous tab

--useful keymap that turns the semicolon into a colon in normal mode
keymap.set("n", ";", ":")

--save all buffers with leader w
keymap.set("n", "<leader>w", "<cmd>wa!<cr>")

--center when page jumping
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")

--remove highlight from search
keymap.set("n", "<leader>/", "<cmd>noh<CR>")
