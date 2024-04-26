{ lib, config, ... }:
{
  options.sys = {
    host = lib.mkOption {
      type = with lib.types; str;
      description = "This is your host name. Must be defined explicitly.";
    };
    system = lib.mkOption {
      type = with lib.types; str;
      description = "Your systems architecture. Must be defined explicitly.";
    };
    home-root = lib.mkOption {
      type = with lib.types; str;
      description = "Your systems root home path. Must be defined explicitly.";
    };
  };
}
