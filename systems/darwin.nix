{ lib, config, ... }:
{
  options.sys = {
    darwin.enable = lib.mkEnableOption "darwin os";
  };

  config = lib.mkIf config.sys.darwin.enable {
    home-manager.users.${config.h.username} = {
      home.shellAliases = {
        upgrade = "darwin-rebuild switch --flake ${config.h.homePath}/${config.h.nixHome}#${config.sys.host}";
        upgraded = "darwin-rebuild boot --flake ${config.h.homePath}/${config.h.nixHome}#${config.sys.host}";
        update = "nix flake update ${config.h.homePath}/${config.h.nixHome}";
      };
    };

    sys.homeRoot = lib.mkForce "Users";

    services.nix-daemon.enable = true;
    security.pam.enableSudoTouchIdAuth = true;

    system = {
      stateVersion = lib.mkForce 4;
    };
  };
}
