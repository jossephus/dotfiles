{
  description = "My Nixos Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    ghostty = {
      url = "git+ssh://git@github.com/ghostty-org/ghostty";
    };


    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";

    # Helix Editor
    helix.url = "github:helix-editor/helix";

    # nix-colors
    nix-colors.url = "github:misterio77/nix-colors";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    vim-nixpkgs-unstable.url = "github:nixos/nixpkgs/f597e7e9fcf37d8ed14a12835ede0a7d362314bd";

    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:the-argus/spicetify-nix";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:jossephus/corrado";
      #inputs.nixpkgs.follows = "nixpkgs";
    };

    #stylix = {
    #url = "github:danth/stylix";
    #inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixpkgs-unstable,
    ...
  } @ inputs: let
    inherit (self) outputs;
    pkgs = import nixpkgs {
      system = "x86_64-linux";
    };
  in {
    overlays = import ./overlays { inherit inputs; };

    nixosConfigurations = {
      "aldrich-vm" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./nixos/vm-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {inherit inputs;};
            #home-manager.specialArgs = { inherit stylix; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.aldrich = import ./home;
          }
          #stylix.nixosModules.stylix
        ];
      };

      "aldrich-main" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {inherit inputs outputs; }; # this is the important part

        modules = [
          ./nixos/main-configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
            #home-manager.specialArgs = { inherit stylix; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.aldrich = import ./home;
          }
          #stylix.nixosModules.stylix
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
          ./home
        ];
      };
      wsl = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        
        extraSpecialArgs = {
          inherit inputs;
        };

        modules = [
          ./home/wsl.nix
        ];
      };
    };
  };
}
