{pkgs}: {
  android-mirror = pkgs.callPackage ./apps/android-mirror.nix {};
  codexbar = pkgs.callPackage ./apps/codexbar.nix {};
  appify = pkgs.callPackage ./clis/appify.nix {};
  livekit-cli = pkgs.callPackage ./clis/livekit-cli.nix {};
  wren-cli = pkgs.callPackage ./clis/wren-cli.nix {};
  ghui = pkgs.callPackage ./clis/ghui.nix {};
}
