{ pkgs, ...}: 
{
    programs.neovim = {
      enable = true;
    };


    home.file.".config/nvim" = {
      source = ./config;
      recursive = true;
    };

    #xdg = {
      #enable = true;
      #configFile = {
        #"nvim" = {
          #source = ./config;
          #force = true;
          #recursive = true;
        #};
      #};
    #};

        # home.file.".vimrc".source = ./.vimrc;
    #home.file.".config/nvim".source = ./config;
    #home.file.".config/nvim" = {
      #source = ./config;
      #recursive = true;
    #};
}
