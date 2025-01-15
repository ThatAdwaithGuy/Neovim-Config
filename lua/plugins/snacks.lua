return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      header = [[
 _   _          _   _ 
| | | |        | | | |
| | | |_      _| | | |
| | | \ \ /\ / / | | |
| |_| |\ V  V /| |_| |
 \___/  \_/\_/  \___/ ]],

    },
    indent = { enabled = false },
    input = { enabled = false },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
