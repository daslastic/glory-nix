{ ... }:
{
  imports = [
    ./remap.nix
    ./opt.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox = {
      enable = true;
      settings = {
        transparent_mode = false;
        dim_inactive = false;
        inverse = false;
        contrast = "hard";
        overrides = {
          SignColumn = {
            bg = "#32302f";
          };
          LineNr = {
            bg = "#32302f";
          };
        };
      };
    };
  };
}
