{ lib, config, pkgs, ...}:
{
  options.home = {
    username = lib.mkOption {
      type = with lib.types; str;
      default = "shalev";
      description = "This is your username, choose wisely.";
    };
    shell = lib.mkOption {
      type = with lib.types; pkgs;
      default = pkgs.fish;
      description = "Your defined shell.";
    };
  };
}
