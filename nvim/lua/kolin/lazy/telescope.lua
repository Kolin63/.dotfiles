return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim"
  },

  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', function()
      builtin.find_files({ no_ignore = true }) end,
      { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") }) end,
      { desc = 'Telescope find string occurence' })
  end
}
