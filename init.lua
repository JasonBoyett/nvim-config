require("user")
-- vim.cmd("hi clear Cursorline")

local function update_hl( group, tbl )
    local old_hl = vim.api.nvim_get_hl_by_name( group, true )
    local new_hl = vim.tbl_extend( 'force', old_hl, tbl )
    vim.api.nvim_set_hl( 0, group, new_hl )
end

update_hl( 'statement', { italic = true } )
update_hl( 'conditional', { italic = true } )
update_hl( 'function', { italic = true } )
update_hl( 'comment', {fg = '#9c7322'} ) 
update_hl( 'SpellBad', {sp='#8e2fed'} )
