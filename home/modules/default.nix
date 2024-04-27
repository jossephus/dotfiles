{config, ...}: {
  imports = [
    ./gnome
    ./zoxide.nix
    ./nvim
    ./vim
    ./vscode.nix
    ./zathura.nix
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
