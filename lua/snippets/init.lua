local language_snippets = {
  go = require("snippets.go"),
  lua = require("snippets.lua_lang"),
}

return function()
  for _, snip in pairs(language_snippets) do
    if type(snip) == "function" then
      snip()
    end
  end
end
