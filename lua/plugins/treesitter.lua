  return{
    "nvim-treesitter/nvim-treesitter",
    build = "TSupdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "javascript", "go" },
        hilight = {enabled = true},
        indent = {enabled = true},
      })
    end,
  }
