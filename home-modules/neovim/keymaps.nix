[
  {
    mode = "n";
    key = "<leader>fp";
    action = "<cmd>Telescope projects<CR>";
    options = {
      desc = "Projects";
    };
  }

  {
    mode = "n";
    key = "<leader>sd";
    action = "<cmd>Telescope diagnostics bufnr=0<cr>";
    options = {
      desc = "Document diagnostics";
    };
  }

  {
    mode = "n";
    key = "<leader>st";
    action = "<cmd>TodoTelescope<cr>";
    options = {
      silent = true;
      desc = "Todo (Telescope)";
    };
  }

  # {
  #   mode = "n";
  #   key = "<leader>,";
  #   action = "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>";
  #   options = {
  #     desc = "Switch Buffer";
  #   };
  # }
  {
    mode = "n";
    key = "<leader>un";
    action = ''
      <cmd>lua require("notify").dismiss({ silent = true, pending = true })<cr>
    '';
    options = {
      desc = "Dismiss All Notifications";
    };
  }

  # lazygit
  {
    mode = "n";
    key = "<leader>gg";
    action = "<cmd>LazyGit<CR>";
    options = {
      desc = "LazyGit (root dir)";
    };
  }
]
