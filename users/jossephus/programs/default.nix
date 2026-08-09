{pkgs, ...}: {
  programs.bash.enable = true;
  programs.bash.bashrcExtra = builtins.readFile ./bashrc;

  programs.starship.enable = true;

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = ["--cmd cd"];
  };

  programs.home-manager.enable = true;

  home.sessionPath = [
    "$HOME/.pulumi/bin"
  ];

  home.file = {
    ".aliases.bashrc".source = ./aliases.bashrc;
    ".config/starship.toml".source = ./starship.toml;
    ".gitconfig".source = ./gitconfig;
    ".gitattributes".source = ./gitattributes;
    ".config/nvim".source = ./neovim;
    ".vimrc".source = ./vim/vimrc;
    ".vim/optional.vim".source = ./vim/optional.vim;
    ".vim/colors".source = ./vim/colors;
    ".vim/bundle/Vundle.vim" = {
      source = pkgs.fetchFromGitHub {
        owner = "VundleVim";
        repo = "Vundle.vim";
        rev = "5548a1a937d4e72606520c7484cd384e6c76b565";
        hash = "sha256-DnIqX2WxnOdWRDTsjXlkTPqKuXXFag5ky2UImG7X0FE=";
      };
    };
    ".vim/plugin".source = ./vim/plugin;
    ".vim/snippets".source = ./vim/snippets;
    ".vim/plugins.vim".source = ./vim/plugins.vim;
  };

  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    flags = ["--disable-ctrl-r" "--disable-up-arrow"];
  };
}
