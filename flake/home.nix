{
  inputs,
  self,
  ...
}: {
  flake.homeConfigurations = {
    aldrich = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };

      extraSpecialArgs = {inherit inputs;};

      modules = [
        ../home/nixos
      ];
    };

    wsl = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };

      extraSpecialArgs = {inherit inputs;};

      modules = [
        ../home/wsl
      ];
    };
  };
}
