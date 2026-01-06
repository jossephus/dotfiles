{
  inputs,
  self,
  ...
}: 
let
  dotfilesConfig = import ../config.nix;
in
{
  flake.homeConfigurations = {
    aldrich = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };

      extraSpecialArgs = {
        inherit inputs;
        inherit dotfilesConfig;
      };

      modules = [
        ../home/nixos
      ];
    };

    wsl = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };

      extraSpecialArgs = {
        inherit inputs;
        inherit dotfilesConfig;
      };

      modules = [
        ../home/wsl
      ];
    };
  };
}
