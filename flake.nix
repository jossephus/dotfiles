{
	description = "My Nixos Configuration";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11-small";

		# alacritty themes
		alacritty-theme.url = "github:alexghr/alacritty-theme.nix";

		home-manager = {
			url = "github:nix-community/home-manager/release-23.11";
			# The `follows` keyword in inputs is used for inheritance.
			# Here, `inputs.nixpkgs` of home-manager is kept consistent with
			# the `inputs.nixpkgs` of the current flake,
			# to avoid problems caused by different versions of nixpkgs.
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		# Helix Editor
		helix.url = "github:helix-editor/helix";

		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
	};

	outputs = {self, nixpkgs, home-manager, nixpkgs-unstable, ...}@inputs: {

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
						home-manager.users.aldrich = import ./home.nix;
					}
				];
			};

		};
	};
}
