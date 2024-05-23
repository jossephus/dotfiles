{pkgs, runCommand,  ...}: 
let 
  generatedDconf = import ./generate-dconf.nix;
in 
{
  imports = [
    # settings for gnome
    # generated by dconf2nix tool
    #                 dconf dump / > dconf.settings
    #                 dconf2nix -i dconf.settings -o dconf.nix
    ./dconf.nix
    #(builtins.readFile "${generatedDconf}/generated-dconf.nix")
    #./generated-dconf.nix
  ];

  # enable dark mode for all gtk4 applications
  # https://nixos.wiki/wiki/GNOME#Dark_mode
  home.packages = with pkgs; [
    #gnomeExtensions.dash2dock-lite
    #gnomeExtensions.dash-to-dock
    gnomeExtensions.panel-free
    gnomeExtensions.pop-shell

    gnomeExtensions.dock-from-dash

    dconf2nix
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        command-history = ["gnome-tweaks"];
        enabled-extensions = [
          "dash2dock-lite@icedman.github.com"
          "dash-to-dock@micxgx.gmail.com"
          "panel-free@fthx"
          "pop-shell@system76.com"
        ];
      };
    };
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };

  # gtk: change icontheme and cursortheme
  /*
    gtk = {
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
