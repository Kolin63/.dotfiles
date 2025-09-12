-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("kolin.init_lazy")
require("kolin.remap")
require("kolin.set")

-- vim.opt.rtp:append("~/Projects/invisible-ink")
-- require("invisible-ink")

vim.opt.rtp:append("~/Projects/copied-rights")
require("copied-rights").setup({
  headers = {
    {
      file = "cc",
      lines = {
        "// line 1",
        "// line 2"
      }
    },
    {
      file = "c",
      lines = {
        "// c line 1",
        "// c line 2"
      }
    }
  }
})
