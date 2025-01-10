return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opt = {
      extensions = {
      ["ui-select"] = {
          require("telescope.themes").get_dropdown {
          }
        }
      },
      pickers = {
        find_files = {
          theme = "dropdown",
        }
      }
    },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      require("telescope").load_extension("ui-select")
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
  }
}
