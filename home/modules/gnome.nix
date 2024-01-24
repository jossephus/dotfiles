{pkgs, ...}: {
	# enable dark mode for all gtk4 applications
	# https://nixos.wiki/wiki/GNOME#Dark_mode
    home.packages = with pkgs; [
      gnomeExtensions.dash2dock-lite
      gnomeExtensions.dash-to-dock

      dconf2nix
    ];

	dconf = {
		enable = true;
        settings = {
          "org/gnome/shell" = {
            disable-user-extensions = false;
              command-history = [ "gnome-tweaks" ];
             enabled-extensions = [
              "dash2dock-lite@icedman.github.com"
              "dash-to-dock@micxgx.gmail.com"
            ];
          };
        };
        #settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
	};

	# gtk: change icontheme and cursortheme
	/*gtk = {
		enable = true;
		
		iconTheme = {
			name = "whitesur-icon-theme";
			package = pkgs.whitesur-icon-theme;
		};

		theme = {
			name = "whitesur-gtk-theme";
			package = pkgs.whitesur-gtk-theme;
		};
		
		cursorTheme = {
			name = "Numix-Cursor";
			package = pkgs.numix-cursor-theme;
		};
		gtk3.extraConfig = {
			Settings = ''
				gtk-application-prefer-dark-theme=1
			'';
		};

		gtk4.extraConfig = {
			Settings = ''
				gtk-application-prefer-dark-theme=1
			'';
		};

	};
  */
}
