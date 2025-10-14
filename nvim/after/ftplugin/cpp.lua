vim.api.nvim_create_user_command("Style",
  "silent !open https://google.github.io/styleguide/cppguide.html", {})

vim.api.nvim_create_user_command("Ref",
  "silent !open https://cppreference.com", {})

vim.api.nvim_create_user_command("W",
  function(args)
    require("conform").format({ bufnr = args.buf })
    vim.cmd("w");
  end, {}
)

vim.api.nvim_create_user_command("A", ":LspClangdSwitchSourceHeader", {})

vim.keymap.set("n", "=", "<nop>")
