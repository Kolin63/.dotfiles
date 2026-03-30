return {
  {
    "ellisonleao/gruvbox.nvim",
    enabled = true,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        overrides = {
          TabLineFill = { fg = "#a89984", bg = "#504945" },
          TabLineSel = { fg = "#282828", bg = "#b8bb26" },
        }
      })
      vim.cmd([[colorscheme gruvbox]])
    end
  }
}
