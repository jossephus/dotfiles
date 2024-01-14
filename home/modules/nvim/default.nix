{ pkgs, ...}: 
{
    programs.neovim = {
      enable = true;
    };

    xdg.configFile = {
      "nvim" = {
        source = ./config;
        force = true;
      };
    };
        # home.file.".vimrc".source = ./.vimrc;
    #home.file.".config/nvim".source = ./config;
    #home.file.".config/nvim" = {
      #source = ./config;
      #recursive = true;
    #};
}
