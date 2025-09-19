return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      cpp = { "clang-format" },
    },
    formatters = {
      clang_format = {
        prepend_args = {"--style=file:.clang-format"},
      },
    },
  },
}
