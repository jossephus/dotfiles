{ pkgs, ... }: {
  dataflare = pkgs.callPackage ./apps/dataflare.nix {};
}
