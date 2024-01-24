{
	description = "My Nixos Configuration";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";

		alacritty-theme.url = "github:alexghr/alacritty-theme.nix";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		# Helix Editor
		helix.url = "github:helix-editor/helix";

        # nix-colors
        nix-colors.url = "github:misterio77/nix-colors";

		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        vim-nixpkgs-unstable.url = "github:nixos/nixpkgs/f597e7e9fcf37d8ed14a12835ede0a7d362314bd";
	};

    outputs = {self, nixpkgs, home-manager, nixpkgs-unstable, nix-colors, ...}@inputs: 
    let 
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };
    in {

		nixosConfigurations = {
			"aldrich-host" = nixpkgs.lib.nixosSystem  {
				system = "x86_64-linux";
                specialArgs = { inherit nix-colors; };
	
				modules = [
					./nixos/configuration.nix

					  home-manager.nixosModules.home-manager
					{
					    home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.aldrich = import ./home;
					}
				];
			};

		};
        homeConfigurations = {
          aldrich = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              ./home
            ];
          };
        };
	};
}
