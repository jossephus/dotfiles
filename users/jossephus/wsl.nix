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
    just

    nix-output-monitor

    plocate
    zip
    silicon

    jq

    asciinema
    sshfs

    mdbook
    xclip

    as31
    ncurses

    libayatana-appindicator
    meson
    ninja
    cmake

    devenv

    jnv
    ghc

    nil
    nixd
  ];
}
