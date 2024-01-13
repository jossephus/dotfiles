{...}: {
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
				decorations = "none";
			};
			import = [ ./rose-pine.yaml ];
			# import = [ pkgs.alacritty-theme.cyber_punk_neon ];
		};
	};

}
