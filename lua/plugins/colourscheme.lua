return { "ellisonleao/gruvbox.nvim", priority = 1000, config = function()
  require("gruvbox").setup{
    palette_overrides = {
      dark0 = "#000000",
      dark1 = "#000000",
    },
  }
  vim.cmd("colorscheme gruvbox")
end, opts = ... }
