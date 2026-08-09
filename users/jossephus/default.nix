{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/home-manager
    ./programs
  ];

  home.packages =
    (with pkgs; [
      alejandra
      anyzig
      autossh
      bat
      biome
      cachix
      cloudflared
      delta
      fastfetch
      fd
      ffmpeg
      findutils
      fzf
      gh
      ghui
      glab
      go
      google-cloud-sql-proxy
      gopls
      helix
      hurl
      kitty
      lua-language-server
      lumen
      mergiraf
      ngrok
      nurl
      ripgrep
      stylua
      tmux
      tree-sitter
      typst
      wren-cli
      xh
      yt-dlp
      zenith
    ])
    ++ lib.optionals pkgs.stdenv.isDarwin [pkgs.appify];

  programs.livekit-cli.enable = true;
  programs.zigdoc.enable = true;
}
