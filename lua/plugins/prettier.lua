return {
  "https://github.com/MunifTanjim/prettier.nvim",
  config = function()
    require("prettier").setup({
      filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
      },
      config = {
        config_precedence = "file-override",
      }
    })
  end,
}
