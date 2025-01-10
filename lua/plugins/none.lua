return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.completion.spell,
          null_ls.builtins.formatting.gofumpt,
          null_ls.builtins.formatting.goimports,
          null_ls.builtins.diagnostics.golangci_lint,
          require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
        },
    })
    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
  end
}
