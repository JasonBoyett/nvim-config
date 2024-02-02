-- PLUGIN / neovim native lsp / ruby / solargraph
require'lspconfig'.solargraph.setup{
  -- cmd = { os.getenv( "HOME" ) .. "/.rvm/shims/solargraph", 'stdio' },
  cmd = { os.getenv( "HOME" ) .. "/.rvm/gems/ruby-3.2.2/wrappers/solargraph", 'stdio' },
  root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git", "."),
  settings = {
    solargraph = {
      autoformat = false,
      formatting = false,
      completion = true,
      diagnostic = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true
    }
  }
}
