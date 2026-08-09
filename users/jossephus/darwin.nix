{
  lib,
  pkgs,
  ...
}: let
  adbConnect = pkgs.callPackage ./programs/adb-connect.nix {};
  wallpaper = pkgs.fetchurl {
    url = "https://misc-assets.raycast.com/wallpapers/loupe-mono-dark.heic";
    hash = "sha256-MwvRU7U4tO6F1duxBrHLOd7F5Gnzv/zyiZkm5EFqkY4=";
  };
in {
  imports = [
    ./default.nix
  ];

  home.username = "jossephus";
  home.homeDirectory = lib.mkForce "/Users/jossephus";

  programs.bash.initExtra = ''
    shopt -s histappend
    shopt -s checkwinsize
    shopt -s extglob
    shopt -s globstar
    shopt -s checkjobs

    alias cd='z'
  '';

  home.packages = [adbConnect];

  home.sessionPath = ["$HOME/Library/pnpm"];
  home.sessionVariables = {
    LC_ALL = "en_US.UTF-8";
    LANG = "en_US.UTF-8";
    PNPM_HOME = "$HOME/Library/pnpm";
  };

  home.stateVersion = "25.05";

  home.activation = {
    setWallpaper = lib.hm.dag.entryAfter ["revealHomeLibraryDirectory"] ''
      echo "[+] Setting wallpaper"
      /usr/bin/osascript -e 'tell application "Finder" to set desktop picture to POSIX file "${wallpaper}"'
    '';
  };
}
