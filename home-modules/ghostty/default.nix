{ config, ... }:
let
  ghosttyPath = "${config.xdg.configHome}/ghostty";
in
{
  home.file."${ghosttyPath}/config".text = ''
    title = " "
    font-size = "18"
    theme = tokyonight
    window-padding-x = 16
    window-padding-y = 16
    keybind = super+t=ignore
    shell-integration = fish
    font-family = "BlexMono Nerd Font Mono"
    keybind = ctrl+z=close_surface
    mouse-hide-while-typing = true
    shell-integration-features = sudo,no-title
    mouse-hide-while-typing = false
    keybind = ctrl+super+f=toggle_fullscreen
    term = xterm-ghostty
  '';
}
