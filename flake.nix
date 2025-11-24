{
  description = "My Nixos Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";
    };

    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";

    # Helix Editor
    helix.url = "github:helix-editor/helix";

    # nix-colors
    nix-colors.url = "github:misterio77/nix-colors";

    spicetify-nix.url = "github:the-argus/spicetify-nix";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:jossephus/corrado";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    rust-overlay,
    ...
  } @ inputs: let
    inherit (self) outputs;
    
    mkPkgs = system: import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    
    pkgs = mkPkgs "x86_64-linux";
    pkgs-darwin = mkPkgs "aarch64-darwin";
    

  in {
    overlays = import ./overlays {inherit inputs;};

    packages.aarch64-darwin = import ./pkgs {pkgs = pkgs-darwin;};
    packages.x86_64-linux = import ./pkgs {inherit pkgs;};

    nixosConfigurations = {
      "aldrich-vm" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/nixos/vm-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.aldrich = import ./home/nixos;
          }
        ];
      };

      "aldrich-main" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {inherit inputs outputs;};

        modules = [
          ./hosts/nixos/main-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.aldrich = import ./home/nixos;
          }
        ];
      };
    };
    homeConfigurations = {
      aldrich = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit inputs;
        };

        modules = [
          ./home/nixos
        ];
      };
      wsl = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit inputs;
        };

        modules = [
          ./home/wsl
        ];
      };
    };

    darwinConfigurations."jossephus" = nix-darwin.lib.darwinSystem {
      specialArgs = {inherit self rust-overlay outputs;};
      modules = [
        {nixpkgs.overlays = [outputs.overlays.custom-packages rust-overlay.overlays.default];}
        home-manager.darwinModules.home-manager
        {
          home-manager.extraSpecialArgs = {inherit inputs;};
          home-manager.backupFileExtension = "backup";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jossephus = import ./home/darwin;
        }
        ./hosts/darwin
      ];
    };
  };
}
