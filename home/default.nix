{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    #inputs.android-nixpkgs.hmModule
    ./modules
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-frappe;

  nixpkgs.overlays = [
    (self: super: {
      alacritty = super.alacritty.override {
        version = "0.13.0";
      };
    })
  ];

  home.packages = with pkgs; [
    devenv
    btop
    neofetch
    eza
    tcl-8_5
    dpkg

    ripgrep
    just

    nodejs

    neofetch

    nix-output-monitor

    typst

    rubik
    vlc
  ];

  fonts.fontconfig.enable = true;

  home.username = "aldrich";
  home.homeDirectory = "/home/aldrich";

  #android-sdk = {
    #enable = true;

    #path = "${config.home.homeDirectory}/.local/share/android";

    #packages = sdk:
      #with sdk; [
        #build-tools-34-0-0
        #cmdline-tools-latest
        #emulator
        #platforms-android-34
        #sources-android-34
      #];
  #};

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    #"Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # configure git
  programs.git = {
    enable = true;
    userName = "jossephus";
    userEmail = "yosephtuemay64@gmail.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      ll = "ls -laf";
      os = "sudo nixos-rebuild switch --flake ~/.config/nixos-config#nixos-test";
      hm = "home-manager switch --flake ~/.config/nixos-config/";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      format = "$username$hostname$directory$git_branch$git_state$nix_shell$git_status$cmd_duration$line_break$python$character";
    };
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  home.sessionVariables = {
    NIX_LD_LBRARY_PATH = with pkgs;
      lib.makeLibraryPath [
      ];
  };
}
