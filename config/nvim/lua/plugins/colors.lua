-- since this is just an example spec, don't actually load anything here and return an empty spec

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "kepano/flexoki" },
  { "Shatur/neovim-ayu" },
  { "comfysage/evergarden" },
  { "neanias/everforest-nvim" },
  { "RRethy/base16-nvim" },

  -- { "ray-x/starry.nvim" },
  -- { "bradcush/nvim-base16" },

  -- Configure LazyVim to load the colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
