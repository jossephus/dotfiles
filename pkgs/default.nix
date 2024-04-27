{pkgs ? import<nixpkgs> {}, ...}: {
  dataflare = pkgs.callPackage ./apps/dataflare.nix {};
}
