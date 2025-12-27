# Toggle between two home-manager configuration approaches:
# - nixified: Full Nix-based configuration
# - sources: Static dotfiles with minimal Nix wrapping
{inputs, pkgs, ...}: {
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
    yt-dlp
    glab
    autossh
  ];

  programs.livekit-cli = {
    enable = true;
    version = "2.12.8";
    hash = "sha256-izJJXwxWS0BRh9xEkv/KpwSTEagG33T1QcwulNIK5rc=";
    vendorHash = "sha256-sZgFfh0e32oXfqWKE8l93P9ZmQsqDgU8sLuvBze0DS0=";
  };
}
