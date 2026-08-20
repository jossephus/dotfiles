{
  description = "Nix configurations for macOS, NixOS, and WSL";

  inputs = {
    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/3";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    llm-agents.url = "github:numtide/llm-agents.nix";

    multiverse.url = "github:fzakaria/nixpkgs-multiverse";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zig-overlay.url = "github:mitchellh/zig-overlay";
    zlsPkg.url = "github:zigtools/zls";
  };

  outputs = inputs @ {
    nixpkgs,
    self,
    ...
  }: let
    mkSystem = import ./lib/mk-system.nix {
      inherit nixpkgs;
      inherit (inputs) home-manager nix-darwin;
    };
    systems = ["aarch64-darwin" "x86_64-linux"];
    forAllSystems = nixpkgs.lib.genAttrs systems;
    specialArgs = {inherit inputs self;};
    overlays = [
      self.overlays.default
      inputs.rust-overlay.overlays.default
      (import ./overlays/android.nix {
        androidNixpkgs = inputs.android-nixpkgs;
      })
      (import ./overlays/yt-dlp.nix)
      (final: _: {
        zigpkgs = inputs.zig-overlay.packages.${final.stdenv.hostPlatform.system};
      })
    ];
  in {
    overlays.default = final: _: import ./pkgs {pkgs = final;};

    packages = forAllSystems (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
      nixpkgs.lib.filterAttrs
      (_: package: nixpkgs.lib.meta.availableOn pkgs.stdenv.hostPlatform package)
      (import ./pkgs {inherit pkgs;}));

    darwinConfigurations.jossephus = mkSystem {
      profile = "darwin";
      system = "aarch64-darwin";
      user = "jossephus";
      hostModule = ./hosts/darwin;
      homeModule = ./users/jossephus/darwin.nix;
      inherit overlays;
      extraModules = [inputs.determinate.darwinModules.default];
      inherit specialArgs;
    };

    nixosConfigurations.aldrich-main = mkSystem {
      profile = "nixos";
      system = "x86_64-linux";
      user = "aldrich";
      hostModule = ./hosts/nixos/main-configuration.nix;
      homeModule = ./users/jossephus/nixos.nix;
      inherit overlays specialArgs;
    };

    homeConfigurations = {
      aldrich = mkSystem {
        profile = "home";
        system = "x86_64-linux";
        user = "aldrich";
        homeModule = ./users/jossephus/nixos.nix;
        inherit overlays specialArgs;
      };

      wsl = mkSystem {
        profile = "home";
        system = "x86_64-linux";
        user = "aldrich";
        homeModule = ./users/jossephus/wsl.nix;
        inherit overlays specialArgs;
      };
    };
  };
}
