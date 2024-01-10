{ config, pkgs, ... }:
{
	imports = [
		./gnome.nix
		./vim.nix
        ./zoxide.nix
	];

	nixpkgs.overlays = [
		(self: super: {
			alacritty = super.alacritty.override {
				version = "0.13.0";
			};
		})
	];

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


	home.packages = with pkgs; [
		btop
		neofetch
		eza

	];
	

	programs.alacritty = {
		#package = nixpkgs-unstable.legacyPackages.x86_64-linux.alacritty.overrideAttrs( final: prev: { 
		#	version = "0.13.0";
		#	 src = pkgs.fetchFromGitHub {
		#		 owner = "alacritty";
		#		    repo = "alacritty";
		#		    rev = "refs/tags/v0.13.0";
		#		    hash = "sha256-5jStrLwuuFWlKHIPS5QJ4DUQj9kXLqlpRxeVDXK/uzU=";
		#	  };
		#});

		# package = nixpkgs-unstable.legacyPackages.x86_64-linux.alacritty.overrideAttrs( final: prev: { 
		#	version = "0.13.0";
		#	 src = pkgs.fetchFromGitHub {
		#		 owner = "alacritty";
		#		 repo = "alacritty";
		#		 rev = "refs/tags/v0.13.0";
		#		 hash = "sha256-5jStrLwuuFWlKHIPS5QJ4DUQj9kXLqlpRxeVDXK/uzU=";
		#	  };
		# 	cargoHash = "sha256-IdkDlxT7pvV+LYbEBsjNvDAWg9TDcmneLF1yrIU3BLU=";
		# });

		enable = true;
		settings = {
			env.TERM = "xterm-256color";
			font = {
				size = 10;
				draw_bold_text_with_bright_colors = true;
			};
			scrolling.multiplier = 5;
			selection.save_to_clipboard = true;
			window = {
				decorations = "full";
			};
			import = [ ./rose-pine.yaml ];
			# import = [ pkgs.alacritty-theme.cyber_punk_neon ];
		};
	};

	programs.bash = {
		enable = true;
		enableCompletion = true;
		shellAliases = {	
			ll = "ls -laf";
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
}
