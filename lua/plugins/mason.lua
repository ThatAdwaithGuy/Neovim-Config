return {
  {
    'williamboman/mason.nvim',
    opts = {},
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { "lua_ls", "rust_analyzer", "gopls", "ts_ls", "svelte", "tailwindcss" },
    },
  }
}
