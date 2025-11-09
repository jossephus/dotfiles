{config, inputs, pkgs, lib, ...}: {
  imports = [
    #./gnome  # Linux only
    ./zoxide.nix
    ./nvim
    ./vim
    ./vscode.nix
    ./zathura.nix
    #./spicetify.nix
    #./firefox.nix
    ./alacritty
    #./android.nix
  ];

  programs = {
    bottom = {
      enable = lib.mkIf pkgs.stdenv.isLinux true;
    };

    fd = {
      enable = true;
    };
  };
}
