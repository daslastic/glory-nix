{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (writeShellApplication {
      name = "yonk";

      runtimeInputs = [ git ];

      text = ''
        git clone --recurse-submodules "git@github.com:$1.git"
      '';
    })
  ];
}
