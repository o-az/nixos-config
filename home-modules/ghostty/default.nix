{ config, ... }:
let
  ghosttyPath = "${config.xdg.configHome}/ghostty";
in
{
  home.file."${ghosttyPath}/config".text = ''
    title = " "
    macos-titlebar-proxy-icon = hidden

    auto-update = download

    font-size = "18"
    font-family = "BlexMono Nerd Font Mono"


    foreground = ffffff
    theme = "tokyonight"

    window-padding-x = 12
    window-padding-y = 16

    keybind = super+t=ignore

    keybind = cmd+t=new_tab
    keybind = cmd+k=clear_screen

    shell-integration = fish
    macos-option-as-alt = true
    shell-integration-features = sudo,no-title

    keybind = ctrl+z=close_surface
    mouse-hide-while-typing = false
    macos-non-native-fullscreen = true
    keybind = ctrl+super+f=toggle_fullscreen
  '';
}
