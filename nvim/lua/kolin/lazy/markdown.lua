return {
  'MeanderingProgrammer/render-markdown.nvim',

  enabled = false,

  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
    'preservim/vim-markdown',
  },

  config = function ()
    vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = "#fb4934", bg = "#282828" })
    vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = "#fe8019", bg = "#282828" })
    vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = "#98971a", bg = "#282828" })

    vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = "#fb4934" })
    vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { fg = "#fe8019" })
    vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { fg = "#98971a" })

    require("render-markdown").setup({
      render_modes = { 'n', 'c', 't', 'i', 'v', 'V' },

      preset = "obsidian",

      bullet = {
        icons = { '󰧞', '', '◆', '◇' },
      },

      heading = {
        enabled = false,
        icons = { ' ', ' ', ' ', ' ', '󰲩 ', '󰲫 ' },
      },

      sign = {
        enabled = false
      },
    })
  end
}
