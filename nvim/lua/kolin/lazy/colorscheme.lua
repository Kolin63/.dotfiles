return {
  {
    "ellisonleao/gruvbox.nvim",
    enabled = true,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end
  },

  {
    "folke/tokyonight.nvim",
    enabled = false,
    priority = 1000,
    config = function ()
      vim.cmd([[colorscheme tokyonight]])
    end
  },

  {
    "rose-pine/neovim",
    enabled = false,
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "main", -- auto, main, moon, or dawn
      })

      vim.cmd([[colorscheme rose-pine]])
    end
  },

  {
    "catppuccin/nvim",
    enabled = false,
    name = "catppuccin",
    priority = 1000,
    config = function ()
      vim.cmd([[colorscheme catppuccin-macchiato]])
    end
  }
}
