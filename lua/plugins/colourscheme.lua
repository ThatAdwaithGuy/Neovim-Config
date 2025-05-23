return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      palette_overrides = {
        dark0 = "#000000",
        dark1 = "#000000",
      },
      transparent_mode = true,
    })
    vim.cmd("colorscheme gruvbox")
  end,
  opts = ...,
}
