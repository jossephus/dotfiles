# Toggle between two home-manager configuration approaches:
# - nixified: Full Nix-based configuration
# - sources: Static dotfiles with minimal Nix wrapping
{
  inputs,
  lib,
  pkgs,
  dotfilesConfig,
  ...
}: {
  imports = [
    #./nixified
    ./sources
    ./modules
  ];

  home.packages = with pkgs; [
    delta
    lumen
    mergiraf
    xh
    biome
    fd
    findutils
    ffmpeg
    yt-dlp
    glab
    autossh

    alejandra
    cachix
    helix
    nurl
    ripgrep
    fzf
    bat
    anyzig
  ];

  programs.livekit-cli = {
    enable = true;
  };

  programs.prise = {
    enable = dotfilesConfig.ENABLE_PRISE;
  };

  programs.zigdoc = {
    enable = true;
  };
}
