{pkgs, lib, ...}: 
{
  # GNOME configuration - Linux only
  imports = lib.optionals pkgs.stdenv.isLinux [
    ./dconf.nix
  ];

  # enable dark mode for all gtk4 applications
  # https://nixos.wiki/wiki/GNOME#Dark_mode
  home.packages = with pkgs; 
    lib.optionals pkgs.stdenv.isLinux [
    #gnomeExtensions.dash2dock-lite
    #gnomeExtensions.dash-to-dock
  ];

  gtk = lib.mkIf pkgs.stdenv.isLinux {
    enable = true;
    theme.package = pkgs.gruvbox-gtk-theme;
    theme.name = "Gruvbox-Dark";

    iconTheme.package = pkgs.gruvbox-dark-icons-gtk;
    iconTheme.name = "oomox-gruvbox-dark";

    font.package = pkgs.fira-code;
    font.name = "Fira Code";
    font.size = 10;
  };
}
