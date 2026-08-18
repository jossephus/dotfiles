{
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./programs
  ];

  home.packages =
    (with pkgs; [
      alejandra
      autossh
      bat
      biome
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
      livekit-cli
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
    ++ [
      inputs.multiverse.packages.${pkgs.stdenv.hostPlatform.system}.mvs
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [pkgs.appify];

  home.sessionVariables.EDITOR = "vim";
}
