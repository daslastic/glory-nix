{
  config,
  lib,
  pkgs,
  ...
}: {
  options.h = {
    fzf.enable = lib.mkEnableOption "Enable fzf.";
  };

  config = lib.mkIf config.h.fzf.enable {
    home-manager.users.${config.h.username} = {
      programs.fzf = {
        enable = true;
      };
    };
  };
}
