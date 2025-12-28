{inputs, ...}: {
  imports = [
    ./overlays.nix
    ./packages.nix
    ./configs.nix
    ./home.nix
  ];
}
