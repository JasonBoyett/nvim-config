return {
  "ggandor/leap.nvim",
  dependencies = {
    "tpope/vim-repeat",
  },
  config = function()
    local leap = require("leap")

    leap.setup({})

    leap.set_default_mappings()
  end,

}
