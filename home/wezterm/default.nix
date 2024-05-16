{ config, lib, ... }: {
  options.h = {
    wezterm.enable = lib.mkEnableOption "Enable wezterm.";
  };

  config = lib.mkIf config.h.wezterm.enable {
    home-manager.users.${config.h.username} = {
      programs.wezterm = {
        enable = true;
      };
    };
  };
}
