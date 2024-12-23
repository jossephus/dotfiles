{config, ...}: {
  imports = [
    ./gnome
    ./zoxide.nix
    ./nvim
    ./vim
    ./vscode.nix
    ./zathura.nix
    ./spicetify.nix
    ./firefox.nix
    #./android.nix
  ];

  programs = {
    bottom = {
      enable = true;
    };

    fd = {
      enable = true;
    };
  };
}
