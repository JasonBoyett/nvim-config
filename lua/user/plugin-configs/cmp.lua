local ok, cmp = pcall(require, "cmp")
if not ok then
  return
end

local testString = "this is"

local function hasFileExtension(str)
  local pattern = "%.([a-zA-Z0-9]+)$"
  local extension = string.match(str, pattern)
  return extension ~= nil
end

local luasnip = require("luasnip")

require('cmp').setup({
  window = {
    documentation = cmp.config.window.bordered(),
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  ghost_text = {
    enabled = true,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
})
vim.opt.spelllang = 'en_us'
vim.opt.spelloptions = 'camel'
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local buffer = vim.api.nvim_buf_get_name(0)
    local isFile = hasFileExtension(buffer)
    if isFile then
      vim.opt.spell = true
    else
      vim.opt.spell = false
    end
  end,
})
