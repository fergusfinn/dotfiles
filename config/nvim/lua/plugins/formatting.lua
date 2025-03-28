return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        python = { "black" },
        rust = { "rustfmt" },
      },
      formatters = {
        black = {
          prepend_args = { "--line-length", "120" },
        },
      },
    },
  },
}
