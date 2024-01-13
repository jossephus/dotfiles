{
	description = "My Nixos Configuration";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";

		# alacritty themes
		alacritty-theme.url = "github:alexghr/alacritty-theme.nix";

		home-manager = {
			url = "github:nix-community/home-manager";
			# The `follows` keyword in inputs is used for inheritance.
			# Here, `inputs.nixpkgs` of home-manager is kept consistent with
			# the `inputs.nixpkgs` of the current flake,
			# to avoid problems caused by different versions of nixpkgs.
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		# Helix Editor
		helix.url = "github:helix-editor/helix";

		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        vim-nixpkgs-unstable.url = "github:nixos/nixpkgs/f597e7e9fcf37d8ed14a12835ede0a7d362314bd";
	};

    outputs = {self, nixpkgs, home-manager, nixpkgs-unstable, ...}@inputs: 
    let 
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };
    in {

		nixosConfigurations = {
			nixos-test = nixpkgs.lib.nixosSystem  {
				system = "x86_64-linux";
				specialArgs = inputs;
	
				modules = [
					./configuration.nix

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
