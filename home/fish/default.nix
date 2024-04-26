{
  config,
  lib,
  pkgs,
  ...
}: {
  options.h = {
    fish.enable = lib.mkEnableOption "Enable fish.";
  };

  config = lib.mkIf config.h.fish.enable {
    programs.fish = {
      enable = true;
      plugins = [
        {
          name = "sponge";
          src = pkgs.fishPlugins.sponge.src;
        }
        {
          name = "autopair";
          src = pkgs.fishPlugins.autopair.src;
        }
        {
          name = "puffer";
          src = pkgs.fishPlugins.puffer.src;
        }
      ];
    };
  };
}
