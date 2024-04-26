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
        transparent_mode = true;
        dim_inactive = false;
        inverse = false;
      };
    };
  };
}
