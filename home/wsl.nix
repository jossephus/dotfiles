{ config, pkgs, inputs, ... }:

{
  home.username = "aldrich";
  home.homeDirectory = "/home/aldrich";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  #programs.zed-editor = {
    #enable = true;
  #};
  #programs.ssh.enable = true;

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
    #imagemagick
    #mysql
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
    jnv
    ghc


    tree-sitter
    nil
    nixd

    #zig

    inputs.ghostty.packages.x86_64-linux.default


    #zed-editor

    #(pkgs.writeScriptBin "atom" ''
       #${inputs.nixvim.packages.${pkgs.system}.default}/bin/nvim
    #'')

    #(pkgs.buildFHSUserEnv {
      #name = "zed";
      #targetPkgs = pkgs:
        #with pkgs; [
           #zed-editor
        #];
      #runScript = "zed";
     #})

  ];

  home.sessionVariables = {
     EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
