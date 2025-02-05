return {
  {
    "sindrets/diffview.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = {
      {
        "dv",
        function()
          if next(require("diffview.lib").views) == nil then
            vim.cmd("DiffviewOpen")
          else
            vim.cmd("DiffviewClose")
          end
        end,
        desc = "Toggle Diffview window",
      },
    },
  },
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
          opts.filetypes = { "c", "cpp" }
        end,
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
  },
}
