{pkgs, ...}: {
  programs.bash.enable = true;
  programs.bash.bashrcExtra = builtins.readFile ./bashrc;

  programs.starship.enable = true;

  programs.zoxide.enable = true;
  programs.zoxide.enableBashIntegration = true;

  programs.home-manager.enable = true;

  home.file = {
    ".aliases.bashrc".source = ./aliases.bashrc;
    ".bashrc.old".source = ./bashrc.old;
    ".config/starship.toml".source = ./starship.toml;
    ".gitconfig".source = ./gitconfig;
    ".gitattributes".source = ./gitattributes;

    # nvim
    ".config/nvim".source = ./.config/nvim;

    # vim stuff
    ".vimrc".source = ./vimrc;
    ".vim/optional.vim".source = ./.vim/optional.vim;
    ".vim/colors".source = ./.vim/colors;
    ".vim/bundle/Vundle.vim" = {
      source = pkgs.fetchFromGitHub {
        owner = "VundleVim";
        repo = "Vundle.vim";
        rev = "5548a1a937d4e72606520c7484cd384e6c76b565";
        hash = "sha256-DnIqX2WxnOdWRDTsjXlkTPqKuXXFag5ky2UImG7X0FE=";
      };
    };
    ".vim/plugin".source = ./.vim/plugin;
    ".vim/snippets".source = ./.vim/snippets;
    ".vim/plugins.vim".source = ./.vim/plugins.vim;
  };

  home.packages = with pkgs; [
    delta
    mergiraf
    xh
    biome
    fd
    findutils
  ];
}
