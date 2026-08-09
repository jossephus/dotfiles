{
  nixpkgs,
  nix-darwin,
  home-manager,
}: {
  profile,
  system,
  user,
  homeModule,
  hostModule ? null,
  overlays ? [],
  extraModules ? [],
  specialArgs ? {},
}: let
  homeManagerModule = {
    home-manager = {
      extraSpecialArgs = specialArgs;
      useGlobalPkgs = true;
      useUserPackages = true;
      users.${user} = import homeModule;
    };
  };
  darwinHomeManagerModule = {
    home-manager =
      homeManagerModule.home-manager
      // {
        backupFileExtension = "backup";
      };
  };
  hostModules = nixpkgs.lib.optional (hostModule != null) hostModule;
  pkgs = import nixpkgs {
    inherit system overlays;
    config.allowUnfree = true;
  };
in
  if profile == "darwin"
  then
    nix-darwin.lib.darwinSystem {
      inherit system specialArgs;
      modules =
        [
          {nixpkgs = {inherit overlays;};}
          home-manager.darwinModules.home-manager
          darwinHomeManagerModule
        ]
        ++ extraModules
        ++ hostModules;
    }
  else if profile == "nixos"
  then
    nixpkgs.lib.nixosSystem {
      inherit system specialArgs;
      modules =
        [
          {nixpkgs = {inherit overlays;};}
          home-manager.nixosModules.home-manager
          homeManagerModule
        ]
        ++ extraModules
        ++ hostModules;
    }
  else if profile == "home"
  then
    home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = specialArgs;
      modules = extraModules ++ [homeModule];
    }
  else throw "Unsupported system profile: ${profile}"
