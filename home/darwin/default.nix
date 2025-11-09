{config, lib, pkgs, ...}:
{
  imports = [
    ../../modules/shared
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

  programs.home-manager.enable = true;
  home.stateVersion = "25.05";
}
