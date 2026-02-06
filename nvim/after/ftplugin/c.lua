vim.api.nvim_create_user_command("W",
  function(args)
    require("conform").format({ bufnr = args.buf })
    vim.cmd("w");
  end, {}
)

vim.api.nvim_create_user_command("A", ":LspClangdSwitchSourceHeader", {})

vim.keymap.set("n", "=", "<nop>")
