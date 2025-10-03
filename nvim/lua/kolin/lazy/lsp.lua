return {
  'neovim/nvim-lspconfig',

  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },

  config = function ()
    require('mason').setup()
    require('mason-lspconfig').setup()

    vim.keymap.set("n", "K", vim.lsp.buf.hover)
    vim.keymap.set("n", "X", vim.diagnostic.open_float)

    vim.lsp.config("clangd", {
      cmd = { 'clangd', '--fallback-style=file' },
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    })
  end
}
