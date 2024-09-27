return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-go",
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-go"),
      },
      vim.keymap.set("n", "<LEADER>tr", function()
        require("neotest").run.run()
      end),
      vim.keymap.set("n", "<LEADER>tr", function()
        require("neotest").run.run(vim.fn.expand("%"))
      end),
      vim.keymap.set("n", "<LEADER>ts", function()
        require("neotest").run.stop()
      end),
    })
  end
}
