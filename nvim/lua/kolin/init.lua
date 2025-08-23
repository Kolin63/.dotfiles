-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("kolin.init_lazy")
require("kolin.remap")
require("kolin.set")

-- vim.opt.rtp:append("~/Projects/invisible-ink")
-- require("invisible-ink")

vim.opt.rtp:append("~/Projects/burrito")
require("burrito")  -- or whatever the plugin's entry point is
