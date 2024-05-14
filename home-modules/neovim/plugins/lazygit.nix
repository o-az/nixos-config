# https://nix-community.github.io/nixvim/plugins/lazygit/index.html
# https://github.com/kdheepak/lazygit.nvim
{ config, ... }:
{
  enable = true;
  settings = {
    config_file_path = [ "${config.xdg.configHome}/lazygit/config.yml" ];
    show_bottom_line = false;
    floating_window_border_chars = [
      "╭"
      "─"
      "╮"
      "│"
      "╯"
      "─"
      "╰"
      "│"
    ];
    floating_window_scaling_factor = 0.9;
    floating_window_use_plenary = false;
    floating_window_winblend = 0;
    use_custom_config_file_path = false;
    use_neovim_remote = true;
  };
}
