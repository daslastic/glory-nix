{ ... }:

{
  programs.nixvim = {
    # I am not doing this again in nix
    extraConfigLua = builtins.readFile ./remap.lua;
  };
}
