{ lib, config, ... }:
{
  options.sys = {
    darwin.enable = lib.mkEnableOption "darwin os";
  };

  config = lib.mkIf config.sys.darwin.enable {
    sys.homeRoot = lib.mkForce "Users";

    services.nix-daemon.enable = true;
    security.pam.enableSudoTouchIdAuth = true;

    system = {
      stateVersion = lib.mkForce 4;
    };
  };
}
