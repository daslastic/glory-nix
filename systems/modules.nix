{ lib, config, ... }:
{
  options = {
    h = {
      username = lib.mkOption {
        type = with lib.types; str;
        default = "shalev";
        description = "This is your username, choose wisely.";
      };
      shell = {
        prefix_colour = lib.mkOption {
          type = with lib.types; str;
          # this color looks bad on purpose,
          # define it so your system has a unique color
          default = "red";
          description = "Your shell color.";
        };
      };
    };
    sys = {
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
  };
}
