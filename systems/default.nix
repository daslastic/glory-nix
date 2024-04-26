{ inputs, ... }:
{
  flake.nixosModules = {
    darwin = import ./darwin.nix;
    nixsys = import ./nixsys.nix;
    system = import ./system.nix;
  };
}
