{
  self,
  nixpkgs,
  nix-darwin,
  home-manager,
  determinate,
  android-nixpkgs,
  rust-overlay,
  zig-overlay,
  ...
} @ inputs: {
  profile,
  system,
  user,
  homeModule,
  hostModule ? null,
}: let
  customOverlay = final: _: import ../pkgs {pkgs = final;};
  androidOverlay = final: _: {
    android-sdk = android-nixpkgs.sdk.${system} (sdkPkgs:
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
  };
  darwinOverlays = [
    customOverlay
    rust-overlay.overlays.default
    androidOverlay
    (final: _: {zigpkgs = zig-overlay.packages.${final.stdenv.hostPlatform.system};})
  ];
  commonArgs = {
    inherit inputs self;
  };
  homeManagerModule = {
    home-manager = {
      extraSpecialArgs = commonArgs;
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
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = [customOverlay];
  };
in
  if profile == "darwin"
  then
    nix-darwin.lib.darwinSystem {
      inherit system;
      specialArgs = commonArgs;
      modules = [
        {nixpkgs.overlays = darwinOverlays;}
        determinate.darwinModules.default
        home-manager.darwinModules.home-manager
        darwinHomeManagerModule
        hostModule
      ];
    }
  else if profile == "nixos"
  then
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = commonArgs;
      modules = [
        {nixpkgs.overlays = [customOverlay];}
        home-manager.nixosModules.home-manager
        homeManagerModule
        hostModule
      ];
    }
  else if profile == "home"
  then
    home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = commonArgs;
      modules = [homeModule];
    }
  else throw "Unsupported system profile: ${profile}"
