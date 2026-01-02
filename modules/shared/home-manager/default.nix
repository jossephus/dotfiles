# Toggle between two home-manager configuration approaches:
# - nixified: Full Nix-based configuration
# - sources: Static dotfiles with minimal Nix wrapping
{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    #./nixified
    ./sources
    ./modules
  ];

  home.packages = with pkgs; [
    delta
    mergiraf
    xh
    biome
    fd
    findutils
    ffmpeg
     (pkgs.yt-dlp.overridePythonAttrs (old: {
       version = "2025.12.08";
       src = pkgs.fetchFromGitHub {
         owner = "yt-dlp";
         repo = "yt-dlp";
         rev = "2025.12.08";
         sha256 = "1s4gbf49y6mpnfqy7n0lz2klfs9q1cbzcrg9mp353bl2zw68qknb";
       };
     }))
    glab
    autossh

    alejandra
    cachix
    helix
    nurl
    ripgrep
    fzf
    bat
  ];

  programs.livekit-cli = {
    enable = true;
  };

  programs.prise = {
    enable = true;
  };

  programs.zigdoc = {
    enable = true;
  };
}
