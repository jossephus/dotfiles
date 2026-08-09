{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./default.nix
  ];

  home.username = "aldrich";
  home.homeDirectory = "/home/aldrich";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    hello
    cowsay
    glow
    sqlite
    pkg-config

    dive

    lazygit

    git
    ripgrep
    just

    nix-output-monitor

    plocate
    zip
    silicon

    jq
    ffmpeg
    stylua

    asciinema
    sshfs

    mdbook
    fd

    xclip

    as31
    ncurses

    libayatana-appindicator
    meson
    ninja
    cmake

    devenv

    gh
    go
    gopls
    jnv
    ghc

    tree-sitter
    nil
    nixd

    inputs.ghostty.packages.x86_64-linux.default
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.home-manager.enable = true;
}
