{
  description = "Nix configurations for macOS, NixOS, and WSL";

  inputs = {
    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/3";
    ghostty.url = "github:ghostty-org/ghostty";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
    mkSystem = import ./lib/mk-system.nix inputs;
    systems = ["aarch64-darwin" "x86_64-linux"];
    forAllSystems = nixpkgs.lib.genAttrs systems;
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
    };

    nixosConfigurations.aldrich-main = mkSystem {
      profile = "nixos";
      system = "x86_64-linux";
      user = "aldrich";
      hostModule = ./hosts/nixos/main-configuration.nix;
      homeModule = ./users/jossephus/nixos.nix;
    };

    homeConfigurations = {
      aldrich = mkSystem {
        profile = "home";
        system = "x86_64-linux";
        user = "aldrich";
        homeModule = ./users/jossephus/nixos.nix;
      };

      wsl = mkSystem {
        profile = "home";
        system = "x86_64-linux";
        user = "aldrich";
        homeModule = ./users/jossephus/wsl.nix;
      };
    };
  };
}
