local ok, dracula = pcall(require, "dracula")
if not ok then
  return
end

local dracula = require("dracula")

dracula.setup({
  transparent_bg = true,
})

require('notify').setup({
  background_colour = '#000000',
})
