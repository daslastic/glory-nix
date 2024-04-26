{
  config,
  lib,
  ...
}: {
  options.home = {
    git.enable = lib.mkEnableOption "Enable git.";
  };

  config = lib.mkIf config.home.git.enable {
    programs.git = {
      enable = true;
      userName  = "daslastic";
      userEmail = "daslastic@gmail.com";
    };
  };
}
