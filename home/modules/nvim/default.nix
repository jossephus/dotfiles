{ pkgs, ...}: 
{
    programs.neovim = {
      enable = true;
    };

    home.file."config" = {
      source = builtins.path { path = "./config"; name = "config"; };
      recursive = true;
    };


    #home.file.".vim" = {
      #source = ./.vim;
      #recursive = true;
    #};

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
