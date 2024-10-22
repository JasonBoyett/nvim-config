local luasnip = require("luasnip")
local snippet = luasnip.snippet
local text_node = luasnip.text_node
local insert_node = luasnip.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return function()
	luasnip.add_snippets("lua", {
		snippet(
			"req",
			fmt('local {} = require("{}")', {
				insert_node(1),
				insert_node(2),
			})
		),

		snippet("todo", {
			text_node("-- TODO: "),
			insert_node(1),
		}),
	})
end
