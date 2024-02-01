{...}: {
	imports = [
		./gnome
        ./zoxide.nix
        ./nvim
		./vim

	];
  programs.bemenu = {
    enable = true;
  };
}
