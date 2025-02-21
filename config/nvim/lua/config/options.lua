-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.wo.relativenumber = false

-- light background
-- vim.opt.background = "light"

-- disable wrapping
vim.opt.wrap = false

vim.opt.scrolloff = 2

vim.g.root_spec = { "cwd" }

vim.g.lazyvim_python_lsp = "basedpyright"
vim.opt.swapfile = false
vim.g.rustaceanvim = {
  -- Plugin configuration
  -- tools = {},
  -- LSP configuration
  server = {
    default_settings = {
      -- rust-analyzer language server configuration
      ["rust-analyzer"] = {
        diagnostics = { enable = true, disabled = { "unresolved-proc-macro" } },
        procMacro = { enable = true, ignored = {} },
      },
    },
  },
  -- DAP configuration
  -- dap = {},
}

for _, method in ipairs({ "textDocument/diagnostic", "workspace/diagnostic" }) do
  local default_diagnostic_handler = vim.lsp.handlers[method]
  vim.lsp.handlers[method] = function(err, result, context, config)
    if err ~= nil and err.code == -32802 then
      return
    end
    return default_diagnostic_handler(err, result, context, config)
  end
end
