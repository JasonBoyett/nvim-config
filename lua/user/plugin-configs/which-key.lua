local ok, which_key = pcall(require, "which-key")
  if not ok then
    return
  end

local wk = require("which-key")
wk.register(mappings, opts)
