{ ... }:

{
  programs.nixvim.plugins.lualine = {
    enable = true;
    iconsEnabled = true;
    componentSeparators = {
      left = "";
      right = "";
    };
    sectionSeparators  = {
      left = "";
      right = "";
    };
    sections = {
      lualine_a = [ "" ];
      lualine_b = [ "" ];
      lualine_c = [ "filename" ];
      lualine_x = [ "" ];
      lualine_y = [ "" ];
      lualine_z = [ "branch" ];
    };
  };
}
