{ ... }:
{
  imports = [
    ./lualine.nix
    ./telescope
  ];

  programs.nixvim = {
    plugins = {
      #fidget.enable = true;
      treesitter = {
        enable = true;
        nixGrammars = true;
        ensureInstalled = "all";
      };

      nvim-autopairs.enable = true;
      ts-autotag.enable = true;
      #lazy.enable = true;
    };
  };
}
