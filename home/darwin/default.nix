
{config, lib, pkgs, ...}:
{

  home.packages = with pkgs; [
     delta
     mergiraf
  ];

  home.username = "jossephus";
  home.homeDirectory = lib.mkForce "/Users/jossephus";

  programs.bash.enable = true;
  programs.bash.initExtra = ''
    shopt -s histappend
    shopt -s checkwinsize
    shopt -s extglob
    shopt -s globstar
    shopt -s checkjobs

    alias cd='z'
    '';
  programs.bash.bashrcExtra = builtins.readFile ./sources/.bashrc;
   
  home.file = {
    ".aliases.bashrc".source = ./sources/.aliases.bashrc;
    ".bashrc.old".source = ./sources/.bashrc.old;
    ".config/starship.toml".source = ./sources/.config/starship.toml;
    ".gitconfig".source = ./sources/.gitconfig;
    ".gitattributes".source = ./sources/.gitattributes;
    #".profile".source = ./sources/.profile;

    # nvim
    ".config/nvim".source = ./sources/.config/nvim;

    # vim stuff
    ".vimrc".source = ./sources/.vimrc;
    ".vim/optional.vim".source = ./sources/.vim/optional.vim;
    ".vim/colors".source = ./sources/.vim/colors;
    ".vim/bundle/Vundle.vim" = {
        source = pkgs.fetchFromGitHub {
          owner = "VundleVim";
          repo = "Vundle.vim";
          rev = "5548a1a937d4e72606520c7484cd384e6c76b565";
          hash = "sha256-DnIqX2WxnOdWRDTsjXlkTPqKuXXFag5ky2UImG7X0FE=";
        };
    };
    ".vim/plugin".source = ./sources/.vim/plugin;
    ".vim/snippets".source = ./sources/.vim/snippets;
    ".vim/plugins.vim".source = ./sources/.vim/plugins.vim;
  };


  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
  programs.starship.enable = true;
  programs.zoxide.enable = true;
  programs.zoxide.enableBashIntegration= true;

}
