{ config, pkgs, ... }:
{
	imports = [
		./modules
	];

	nixpkgs.overlays = [
		(self: super: {
			alacritty = super.alacritty.override {
				version = "0.13.0";
			};
		})
	];

	home.packages = with pkgs; [
		btop
		neofetch
		eza
        tcl-8_5
        dpkg

        ripgrep
        just

        neofetch

        nix-output-monitor

        typst

        rubik
	];

    fonts.fontconfig.enable = true;


	home.username = "aldrich";
	home.homeDirectory = "/home/aldrich";
	

	# set cursor size and dpi for 4k monitor
	xresources.properties = {
		"Xcursor.size" = 16;
		"Xft.dpi" = 172;
	};

	# configure git
	programs.git = {
		enable = true;
		userName = "jossephus";
		userEmail = "yosephtuemay64@gmail.com";
	};


	

	programs.bash = {
		enable = true;
		enableCompletion = true;
		shellAliases = {	
			ll = "ls -laf";
            os = "sudo nixos-rebuild switch --flake ~/.config/nixos-config#nixos-test";
            hm = "home-manager switch --flake ~/.config/nixos-config/";
		};
	};

	programs.starship = {
		enable = true;
		settings = {
			add_newline = true;
			format = "$username$hostname$directory$git_branch$git_state$git_status$cmd_duration$line_break$python$character";
		};	
	};


	home.stateVersion = "23.11";

	programs.home-manager.enable = true;

    home.sessionVariables = {
      NIX_LD_LBRARY_PATH = with pkgs; lib.makeLibraryPath [
      ];
    };
}
