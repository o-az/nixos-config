local telescope = require('telescope')
telescope.setup {
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}

require("telescope").load_extension("lazygit")

require('nvim-highlight-colors').setup({})

require('highlight-undo').setup({
  duration = 300,
  undo = {
    hlgroup = 'HighlightUndo',
    mode = 'n',
    lhs = 'u',
    map = 'undo',
    opts = {}
  },
  redo = {
    hlgroup = 'HighlightRedo',
    mode = 'n',
    lhs = '<C-r>',
    map = 'redo',
    opts = {}
  },
  highlight_for_count = true,
})
