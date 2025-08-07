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

    vim.lsp.enable('clangd')
    vim.lsp.config('clangd', {
      settings = {
        ['clangd'] = {
          cmd = { 'clangd', '--fallbackstyle=file' }
        }
      }
    })

    -- vim.lsp.enable('clang-format')
    -- vim.lsp.config.clangformat = {
    --   cmd = {
    --     'clang-format',
    --     '-style=file'
    --   }
    -- }

    vim.lsp.enable('lua_ls')
    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            globals = {
              "vim",
            }
          }
        }
      }
    })

    -- vim.lsp.enable('grammarly-languageserver')
    -- vim.lsp.config('grammarly-languageserver', {
    --   settings = {
    --     ['grammarly-languageserver'] = {
    --       cmd = { 'grammarly-languageserver', '--stdio' },
    --       filetypes = { 'markdown' }
    --     },
    --   },
    -- })
  end
}
