{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  setWallpaperScript = import ./wallpaper.nix {inherit pkgs;};
in {
  imports = [
    ../../modules/shared
  ];

  home.username = "jossephus";
  home.homeDirectory = lib.mkForce "/Users/jossephus";

  programs.bash.enable = true;
  programs.bash.initExtra = ''
    shopt -s histappend
    shopt -s checkwinsize
    shopt -s extglob
    shopt -s globstar
    shopt -s checkjobs

    alias cd='z'
  '';

  programs.home-manager.enable = true;
  home.stateVersion = "25.05";

  home.activation = {
    "setWallpaper" = lib.hm.dag.entryAfter ["revealHomeLibraryDirectory"] ''
      echo "[+] Setting wallpaper"
      ${setWallpaperScript}/bin/set-wallpaper-script
    '';
  };

programs.homebrew = {
  enable = true;
  onActivation.autoUpdate = false;
  brews = [
    "livekit-cli"
  ];
};


}
