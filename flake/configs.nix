{
  inputs,
  self,
  ...
}:
let
  dotfilesConfig = import ../config.nix;
in
{
  flake = {
    nixosConfigurations = {
      "aldrich-vm" = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ../hosts/nixos/vm-configuration.nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs dotfilesConfig;};
            home-manager.users.aldrich = import ../home/nixos;
          }
        ];
      };

      "aldrich-main" = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {inherit inputs self;};

        modules = [
          ../hosts/nixos/main-configuration.nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs dotfilesConfig;};
            home-manager.users.aldrich = import ../home/nixos;
          }
        ];
      };
    };

    darwinConfigurations."jossephus" = inputs.nix-darwin.lib.darwinSystem {
      specialArgs = {inherit self inputs; zlsPkg = inputs.zlsPkg;};
      modules = [
        {
          nixpkgs.overlays = [
            self.overlays.custom-packages
            inputs.rust-overlay.overlays.default
            (final: prev: {
              zigpkgs = inputs.zig-overlay.packages."aarch64-darwin";
            })
          ];
        }
        inputs.home-manager.darwinModules.home-manager
        {
          home-manager.extraSpecialArgs = {inherit inputs dotfilesConfig;};
          home-manager.backupFileExtension = "backup";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jossephus = import ../home/darwin;
        }
        ../hosts/darwin
      ];
    };
  };
}
