{pkgs ? import <nixpkgs> {}, ...}: rec {
  curosr = pkgs.callPackage ./apps/cursor.nix {};
  wrapWine = pkgs.callPackage ./wrapWine.nix {};
  pot_player = pkgs.callPackage ./apps/pot_player.nix {
    inherit wrapWine;
  };
  dupeclear = pkgs.callPackage ./apps/dupe-clear.nix {
    inherit wrapWine;
  };
  antigravity = pkgs.callPackage ./apps/antigravity.nix {};
}
