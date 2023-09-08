local ok, cmp = pcall(require, "cmp")
if not ok then
  return
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
