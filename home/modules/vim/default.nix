{pkgs, ...}: {
  programs.vim = {
    enable = true;
    plugins = [
      pkgs.vimPlugins.Vundle-vim
    ];
    extraConfig = builtins.readFile ./.vimrc;
  };
  # home.file.".vimrc".source = ./.vimrc;
  home.file.".vim" = {
    source = ./.vim;
    recursive = true;
  };
}
