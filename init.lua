require("opts")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("nvim-treesitter.configs").setup({
})

vim.keymap.set("n", "<LEADER>w", "<CMD>wa!<CR>", {})

require"theme"

local function update_hl( group, tbl )
    local old_hl = vim.api.nvim_get_hl_by_name( group, true )
    local new_hl = vim.tbl_extend( 'force', old_hl, tbl )
    vim.api.nvim_set_hl( 0, group, new_hl )
end

update_hl( 'statement', { italic = true } )
update_hl( 'conditional', { italic = true } )
update_hl( 'function', { italic = true } )
update_hl( 'comment', {fg = '#9c7322'} )

