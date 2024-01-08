{ pkgs, ...}: 
let 
  older_nixpkg = import (builtins.fetchGit {
         # Descriptive name to make the store path easier to identify
         name = "my-old-revision";
         url = "https://github.com/NixOS/nixpkgs/";
         ref = "refs/heads/nixpkgs-unstable";
         rev = "f597e7e9fcf37d8ed14a12835ede0a7d362314bd";
       }) {};
in
{
	 programs.vim = {
    	package = older_nixpkg.vim; 
		enable = true;
                plugins = [
                  older_nixpkg.vimPlugins.Vundle-vim
                ];
                extraConfig = builtins.readFile ./.vimrc;
	};
        # home.file.".vimrc".source = ./.vimrc;
    home.file.".vim".source = ./.vim;
}
