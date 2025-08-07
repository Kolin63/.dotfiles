print("markdown config loaded!")

-- gj and gk do visual lines, not actual lines
-- vim.keymap.set("n", "j", "gj")
-- vim.keymap.set("n", "k", "gk")

-- vim.keymap.set("n", "$", "g$")

-- force line break
-- vim.opt.linebreak = true
-- vim.opt.wrap = true

-- disable cmp because who needs that in markdown 
require("cmp").setup.buffer { enabled = false }

-- spellcheck
vim.opt.spell = true
vim.opt.spelllang = "en_us"
