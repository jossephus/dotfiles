{ inputs
, self
, ...
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
            home-manager.extraSpecialArgs = { inherit inputs dotfilesConfig; };
            home-manager.users.aldrich = import ../home/nixos;
          }
        ];
      };

      "aldrich-main" = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = { inherit inputs self; };

        modules = [
          ../hosts/nixos/main-configuration.nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs dotfilesConfig; };
            home-manager.users.aldrich = import ../home/nixos;
          }
        ];
      };
    };

    darwinConfigurations."jossephus" = inputs.nix-darwin.lib.darwinSystem {
      specialArgs = {
        inherit self inputs;
        zlsPkg = inputs.zlsPkg;
      };
      modules = [
        {
          nixpkgs.overlays = [
            self.overlays.custom-packages
            inputs.rust-overlay.overlays.default
            (final: prev: {
              android-sdk = inputs.android-nixpkgs.sdk."aarch64-darwin" (sdkPkgs:
                with sdkPkgs; [
                  build-tools-36-0-0
                  build-tools-35-0-0
                  build-tools-30-0-3
                  cmdline-tools-latest
                  platform-tools
                  platforms-android-36
                  platforms-android-33
                  ndk-27-1-12297006
                  ndk-29-0-13113456
                ]);
              zigpkgs = inputs.zig-overlay.packages."aarch64-darwin";
            })
          ];
        }
        inputs.determinate.darwinModules.default
        inputs.home-manager.darwinModules.home-manager
        {
          home-manager.extraSpecialArgs = { inherit inputs dotfilesConfig; };
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
