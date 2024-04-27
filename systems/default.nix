{ inputs, ... }:
{
  flake.nixosModules = {
    darwin = import ./darwin.nix;
    nixsys = import ./nixsys.nix;
    modules = import ./modules.nix;
  };
}
