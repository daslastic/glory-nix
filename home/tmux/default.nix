{
  config,
  lib,
  pkgs,
  ...
}: {
  options.h = {
    tmux.enable = lib.mkEnableOption "Enable tmux.";
  };

  config = lib.mkIf config.h.tmux.enable {
    home-manager.users.${config.h.username} = {
      programs.tmux = {
        enable = true;
      };
    };
  };
}
