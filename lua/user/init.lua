local paths = {
"user.remap",
"user.settings",
"user.colorscheme",
"user.plugin-configs.packer",
"user.plugin-configs.comment",
"user.plugin-configs.colorizer",
"user.plugin-configs.dap-mason",
"user.plugin-configs.dapui",
"user.plugin-configs.debugging",
"user.plugin-configs.fugitive",
"user.plugin-configs.gitintigration",
"user.plugin-configs.harpoon",
"user.plugin-configs.lsp-zero",
"user.plugin-configs.lualine",
"user.plugin-configs.lualine",
"user.plugin-configs.nvim-tree",
"user.plugin-configs.debugpython",
"user.plugin-configs.telescope",
"user.plugin-configs.todo-comments",
"user.plugin-configs.toggleterm",
"user.plugin-configs.transparent",
"user.plugin-configs.tree-sitter",
"user.plugin-configs.ts-rainbow"
}

for _, path in ipairs(paths) do
  require(path)
end
