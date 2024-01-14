{ pkgs, ...}: 
{
	 programs.nvim = {
		enable = true;
	};
        # home.file.".vimrc".source = ./.vimrc;
    home.file.".config/nvim" = {
      source = ./config;
      recursive = true;
    };
}
