{ config, ... }:
let
  ghosttyPath = "${config.xdg.configHome}/ghostty";
in
{
  home.file."${ghosttyPath}/config".text = ''
    title =
    font-size = "18"
    theme = tokyonight
    window-padding-x = 16
    window-padding-y = 16
    keybind = super+t=ignore
    shell-integration = fish
    macos-titlebar-tabs = true
    macos-option-as-alt = true
    font-family = IBMPlex Mono
    keybind = ctrl+z=close_surface
    mouse-hide-while-typing = true
    shell-integration-features = sudo
    macos-non-native-fullscreen = true
    keybind = ctrl+super+f=toggle_fullscreen
    term = xterm-ghostty
  '';
}
