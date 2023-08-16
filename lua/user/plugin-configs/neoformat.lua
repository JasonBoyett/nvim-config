local guci, neoformat = pcall(require, 'neoformat')
if not guci then
  return
end

neoformat.setup({
  typescript = {
    {
      cmd = { 'prettier', '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
    },
  },
})
