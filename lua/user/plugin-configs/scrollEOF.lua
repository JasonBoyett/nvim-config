local ok, _ = pcall(require, 'scrollEOF')
if not ok then
  return
end

Scroll = require('scrollEOF').setup()
