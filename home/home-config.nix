{ config, ... }:
{
  options = {
  };

  config = {
    # xdg.configHome wasn't working...
    # I saw examples of it being used, I tried it all
    h.homePath = "/${config.sys.homeRoot}/${config.h.username}";
    h.dataHome = "${config.h.homePath}/.local/share";
    h.configHome = "${config.h.homePath}/.config";
    h.cacheHome = "${config.h.homePath}/.cache";
  };
}
