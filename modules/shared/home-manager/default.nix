# Toggle between two home-manager configuration approaches:
# - nixified: Full Nix-based configuration
# - sources: Static dotfiles with minimal Nix wrapping
{inputs, pkgs, ...}: {
  imports = [
     #./nixified
    ./sources
  ];

  home.packages = with pkgs; [
    delta
    mergiraf
    xh
    biome
    fd
    findutils
    ffmpeg 
    yt-dlp
  ];
}
