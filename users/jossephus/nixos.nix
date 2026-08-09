{pkgs, ...}: {
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

    just

    nodePackages.pnpm
    bun

    nodejs

    nix-output-monitor

    rubik
    vlc
  ];

  fonts.fontconfig.enable = true;

  home.username = "aldrich";
  home.homeDirectory = "/home/aldrich";

  xresources.properties = {
    "Xft.dpi" = 172;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.bash = {
    enableCompletion = true;
    shellAliases.ll = "ls -laf";
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
}
