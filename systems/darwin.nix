{ lib, config, ... }:
{
  options.sys = {
    darwin.enable = lib.mkEnableOption "darwin os";
  };

  config = lib.mkIf config.sys.darwin.enable {
    sys.home-root = lib.mkForce "Users";

    services.nix-daemon.enable = true;
    security.pam.enableSudoTouchIdAuth = true;

    # remove need for sudo
    environment.etc = {
      "sudoers.d/10-nix-commands".text = let
        commands = [
          "/run/current-system/sw/bin/darwin-rebuild"
          "/run/current-system/sw/bin/nix*"
          "/run/current-system/sw/bin/ln"
          "/nix/store/*/activate"
          "/bin/launchctl"
        ];
        commandsString = builtins.concatStringsSep ", " commands;
      in ''
        %admin ALL=(ALL:ALL) NOPASSWD: ${commandsString}
      '';
    };

    system = {
      stateVersion = lib.mkForce 4;
    };
  };
}
