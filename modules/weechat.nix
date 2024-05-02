self: super:
{ pkgs, config, ... }:
{
  services.weechat.enable = true;
  weechat = super.weechat.override {
    configure =
      { availablePlugins, ... }:
      {
        plugins = builtins.attrValues (availablePlugins {
          python = availablePlugins.python.withPackages (
            ps: with ps; [
              pycrypto
              python-dbus
            ]
          );
        });
        scripts = with super.weechatScripts; [ weechat-matrix-brigde ];
      };
  };
}
