{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./default.nix
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

    nodePackages.pnpm
    bun

    nodejs

    nix-output-monitor

    typst

    rubik
    vlc
  ];

  fonts.fontconfig.enable = true;

  home.username = "aldrich";
  home.homeDirectory = "/home/aldrich";

  xresources.properties = {
    "Xft.dpi" = 172;
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = "jossephus";
      email = "yosephtuemay64@gmail.com";
    };
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      ll = "ls -laf";
      os = "sudo nixos-rebuild switch --flake ~/.config/nixos-config#nixos-test";
      hm = "home-manager switch --flake ~/.config/nixos-config/";
    };
    bashrcExtra = ''
      flakify() {
        if [ ! -e .envrc ]; then
          echo "use flake" > .envrc
          direnv allow
        fi
      }
    '';
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  home.sessionVariables.NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [];
}
