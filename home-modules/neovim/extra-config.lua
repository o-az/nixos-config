local telescope = require('telescope')
telescope.setup {
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}

require("telescope").load_extension("lazygit")
