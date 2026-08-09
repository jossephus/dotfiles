{pkgs}: {
  codexbar = pkgs.callPackage ./apps/codexbar.nix {};
  appify = pkgs.callPackage ./clis/appify.nix {};
  livekit-cli = pkgs.callPackage ./clis/livekit-cli.nix {};
  lumen = pkgs.callPackage ./clis/lumen.nix {};
  zigdoc = pkgs.callPackage ./clis/zigdoc.nix {};
  anyzig = pkgs.callPackage ./clis/zvm.nix {};
  wren-cli = pkgs.callPackage ./clis/wren-cli.nix {};
  ghui = pkgs.callPackage ./clis/ghui.nix {};
}
