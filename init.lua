require("config.lazy")
require("sg").setup({})
vim.opt.fillchars:append({ eob = " " })
vim.opt.relativenumber = true
vim.o.tabstop = 2 -- A TAB character looks like 2 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 2 -- Number of spaces inserted when indenting
vim.opt.swapfile = false
--vim.cmd.colorscheme "catppuccin"
--vim.o.background = "dark" -- or "light" for light mode
--vim.cmd([[colorscheme gruvbox]])
