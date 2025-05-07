local luasnip = require("luasnip")
local snippet = luasnip.snippet
local text_node = luasnip.text_node
local insert_node = luasnip.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return function()
  luasnip.add_snippets("typescript", {
    snippet("af", {
      fmt("const {} = ({}) => {{\n\t{}\n}}", {
        insert_node(2),
        insert_node(1),
        insert_node(0),
      })
    }),
    --
    snippet(
      "fn",
      fmt("function {}({}) {{\n\t{}\n}}", {
        insert_node(2),
        insert_node(1),
        insert_node(0),
      })
    ),
    --
    snippet("todo", {
      text_node("// TODO: "),
      insert_node(1),
    }),

    snippet("rfc",
      fmt("const {} = ({}) => {{\n\treturn(\n\t\t{})\n}}", {
        insert_node(2),
        insert_node(1),
        insert_node(0),
      })
    ),

    snippet(
      "rfn",
      fmt("function {}({}) {{\n\t\treturn(\n\t\t\t{})\n}}", {
        insert_node(2),
        insert_node(1),
        insert_node(0),
      })
    ),
  })
end
