local ok, md = pcall(require, "markdown-preview")
if not ok then
  return
end

require('markdown-preview').setup()
