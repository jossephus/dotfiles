{ pkgs, ...}: 
{
	 programs.neovim = {
		enable = true;
	};
        # home.file.".vimrc".source = ./.vimrc;
    home.file.".config/nvim" = ./config;
    #home.file.".config/nvim" = {
      #source = ./config;
      #recursive = true;
    #};
}
