vim.api.nvim_create_user_command("Style",
  "silent !open https://google.github.io/styleguide/cppguide.html", {})

vim.api.nvim_create_user_command("Ref",
  "silent !open https://cppreference.com", {})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.cpp", "*.h" },
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end
})

vim.keymap.set("n", "=", "<nop>")
