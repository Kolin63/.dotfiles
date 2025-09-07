return {
  "kolin63/burrito",

  config = function()
    require("burrito").setup({
      col = 80,                         -- The column to wrap text at

      file_types = { "*.md" },          -- What file types Burrito will check for

      -- lines that wrap with no other lines
      independent_patterns = {
        " {0,3}\\* *\\* *\\*",          -- Thematic Breaks
        " {0,3}- *- *-",                -- Thematic Breaks
        " {0,3}_ *_ *_",                -- Thematic Breaks
        " {0,3}-+ *$",                  -- Setext Heading Underline
        " {0,3}=+ *$",                  -- Setext Heading Underline
        " *$",                          -- All Whitespace
        " {0,3}`{3}",                   -- Fenced Code Block
        " {0,3}~{3}",                   -- Fenced Code Block
      },

      -- lines that wrap only with lines below
      bottom_only_patterns = {
        " {0,3}>",                      -- Block Quote
        " {0,3}[-+*] ",                 -- Bullet Lists
        " {0,3}[0123456789]{1,9}[.)] ", -- Ordered Lists
      },

      -- lines that don't wrap at all, not even if it reaches col 80
      no_wrap_patterns = {
        " {0,3}#{1,6} ",                -- ATX Headings
        " {4}",                         -- Indented Code Block
        "[|:]",                         -- Tables
      },

      -- lines that surround lines that don't wrap at all
      code_block_patterns = {
        " {0,3}`{3}",                   -- Fenced Code Block
        " {0,3}~{3}",                   -- Fenced Code Block
      },
    })
  end
}
