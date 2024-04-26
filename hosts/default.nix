{ inputs, config, ... }:

let
  inextricables = with inputs.self.nixosModules; [
    darwin
    nixsys
    system
  ];

  macGenesis =
    args:
    (inputs.nix-darwin.lib.darwinSystem (
      (builtins.removeAttrs args [ "hostName" ])
      // {
        specialArgs = {
          inherit inputs;
        } // args.specialArgs or { };
        modules = with inputs.self.nixosModules; [
          inputs.home-manager.darwinModules.home-manager
          inputs.nixvim.nixDarwinModules.nixvim
          ./global.nix
          ../vim
          ../home
          {
            sys.host = "${args.hostName}";
            sys.system = "${args.system}";
            sys.darwin.enable = true;
            sys.nix.enable = true;
          }] ++ inextricables ++ (args.modules or [ ]);
      }
    ));
in
{
  flake = {
    darwinConfigurations = {
      refrigerator = macGenesis {
        system = "aarch64-darwin";
        hostName = "refrigerator";
        modules = [
          ./refrigerator
        ];
      };
    };

    nixosConfigurations = { };
  };
}
