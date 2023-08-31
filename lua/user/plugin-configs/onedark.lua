local ok, onedark = pcall(require, "onedark")
if not ok then
  return
end

require("onedark").setup({
  code_style = {
    keywords = 'italic'
  },
})

local function update_hl( group, tbl )
    local old_hl = vim.api.nvim_get_hl_by_name( group, true )
    local new_hl = vim.tbl_extend( 'force', old_hl, tbl )
    vim.api.nvim_set_hl( 0, group, new_hl )
end

update_hl( 'statement', { italic = true } )
update_hl( 'conditional', { italic = true } )
update_hl( 'function', { italic = true } )
update_hl( 'comment', {fg = '#9c7322'} ) 
