-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>Q", ":quitall<CR>", { desc = "Quit all" })
vim.keymap.set("t", "<C-a>", "<C-a>", { noremap = true })

-- neotree
vim.keymap.set("n", "-", function()
  local reveal_file = vim.fn.expand("%:p")
  if reveal_file == "" then
    reveal_file = vim.fn.getcwd()
  else
    local f = io.open(reveal_file, "r")
    if f then
      f.close(f)
    else
      reveal_file = vim.fn.getcwd()
    end
  end
  require("neo-tree.command").execute({
    action = "focus",
    source = "filesystem", -- OPTIONAL, this is the default value
    position = "left", -- OPTIONAL, this is the default value
    reveal_file = reveal_file, -- path to file or folder to reveal
    reveal_force_cwd = true, -- change cwd without asking if needed
  })
end, { desc = "Open neo-tree at current file or working directory" })
