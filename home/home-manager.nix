{ lib, config, ...}:
{
  options.home = {
    username = lib.mkOption {
      type = with lib.types; str;
      default = "shalev";
      description = "This is your username, choose wisely.";
    };
  };
}
