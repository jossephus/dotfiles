# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/Console" = {
      last-window-size = mkTuple [1218 459];
    };

    "org/gnome/Geary" = {
      migrated-config = true;
      window-height = 736;
    };

    "org/gnome/control-center" = {
      last-panel = "keyboard";
      window-state = mkTuple [980 640 true];
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = ["Utilities" "YaST" "Pardus"];
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = ["X-Pardus-Apps"];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = ["gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.Loupe.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop"];
      categories = ["X-GNOME-Utilities"];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = ["X-SuSE-YaST"];
      name = "suse-yast.directory";
      translate = true;
    };

    #"org/gnome/desktop/background" = {
    #color-shading-type = "solid";
    #picture-options = "zoom";
    ##picture-uri = "file:///etc/nixos/wallpapers/nix-dracula.png";
    #picture-uri-dark = "file:///home/aldrich/.local/share/backgrounds/2024-01-24-18-28-42-nix-dracula.png";
    #primary-color = "#000000000000";
    #secondary-color = "#000000000000";
    #};

    "org/gnome/desktop/input-sources" = {
      sources = [(mkTuple ["xkb" "us"])];
      xkb-options = ["terminate:ctrl_alt_bksp"];
    };

    #"org/gnome/desktop/interface" = {
    ##color-scheme = "prefer-dark";
    #cursor-theme = "Adwaita";
    #font-antialiasing = "grayscale";
    #font-hinting = "slight";
    #gtk-enable-primary-paste = true;
    #gtk-theme = "Adwaita";
    #icon-theme = "Adwaita";
    #};

    "org/gnome/desktop/notifications" = {
      application-children = ["org-gnome-console" "org-gnome-geary" "org-gnome-settings"];
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-network-panel" = {
      application-id = "gnome-network-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-geary" = {
      application-id = "org.gnome.Geary.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      click-method = "areas";
      disable-while-typing = true;
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/privacy" = {
      old-files-age = mkUint32 30;
      recent-files-max-age = -1;
    };

    #"org/gnome/desktop/screensaver" = {
    #color-shading-type = "solid";
    #picture-options = "zoom";
    ##picture-uri = "file:///home/aldrich/.local/share/backgrounds/2024-01-24-18-28-42-nix-dracula.png";
    #primary-color = "#000000000000";
    #secondary-color = "#000000000000";
    #};

    "org/gnome/desktop/search-providers" = {
      sort-order = ["org.gnome.Contacts.desktop" "org.gnome.Documents.desktop" "org.gnome.Nautilus.desktop"];
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 300;
    };

    "org/gnome/desktop/wm/keybindings" = {
      maximize = ["<Control>Return"];
      switch-applications = [];
      switch-applications-backward = [];
      switch-windows = ["<Alt>Tab"];
      switch-windows-backward = ["<Shift><Alt>Tab"];
      toggle-fullscreen = ["<Alt>Return"];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/mutter" = {
      overlay-key = "Super_L";
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [890 550];
      maximized = true;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = false;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Control>grave";
      command = "alacritty";
      name = "Alacritty";
    };

    "org/gnome/shell" = {
      command-history = ["gnome-tweaks" "gnome-tweaks"];
      disable-user-extensions = false;
      disabled-extensions = ["apps-menu@gnome-shell-extensions.gcampax.github.com" "auto-move-windows@gnome-shell-extensions.gcampax.github.com" "dash-to-dock@micxgx.gmail.com" "places-menu@gnome-shell-extensions.gcampax.github.com"];
      enabled-extensions = ["dash2dock-lite@icedman.github.com" "dash-to-dock@micxgx.gmail.com" "panel-free@fthx" "dash2dock-lite@icedman.github.com" "dash-to-dock@micxgx.gmail.com" "panel-free@fthx"];
      favorite-apps = ["org.gnome.Nautilus.desktop" "org.gnome.tweaks.desktop" "org.gnome.Extensions.desktop"];
      welcome-dialog-last-shown-version = "45.3";
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      background-opacity = 0.8;
      dash-max-icon-size = 48;
      dock-position = "BOTTOM";
      height-fraction = 0.9;
      isolate-workspaces = true;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "eDP-1";
      show-favorites = true;
      show-running = true;
    };

    "org/gnome/shell/extensions/dash2dock-lite" = {
      animate-icons-unmute = true;
      animation-magnify = 0.0;
      animation-rise = 0.32;
      animation-spread = 0.0;
      apps-icon = true;
      autohide-dash = true;
      autohide-dodge = false;
      background-color = mkTuple [7.0e-2 5.367e-3 5.367e-3 0.25];
      border-radius = 0.0;
      border-thickness = 0;
      calendar-icon = true;
      clock-icon = true;
      customize-topbar = true;
      debug-visual = false;
      dock-location = 0;
      edge-distance = 0.21978;
      favorites-only = true;
      icon-effect = 0;
      icon-effect-color = mkTuple [0.243333 3.8933e-2 3.8933e-2 1.0];
      icon-resolution = 0;
      icon-size = 0.0;
      monitor-count = 1;
      mounted-icon = true;
      msg-to-ext = "";
      notification-badge-style = 0;
      open-app-animation = true;
      panel-mode = false;
      peek-hidden-icons = false;
      pressure-sense = true;
      running-indicator-color = mkTuple [3.6667e-2 2.322e-3 2.322e-3 1.0];
      running-indicator-style = 12;
      scroll-sensitivity = 0.0;
      shrink-icons = true;
      trash-icon = true;
    };

    "org/gnome/shell/extensions/window-list" = {
      grouping-mode = "never";
    };

    "org/gnome/shell/world-clocks" = {
      locations = [];
    };

    "org/gnome/software" = {
      check-timestamp = mkInt64 1706116226;
      first-run = false;
      flatpak-purge-timestamp = mkInt64 1706113441;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors = [(mkTuple [3.6667e-2 2.322e-3 2.322e-3 1.0]) (mkTuple [0.513333 3.7644e-2 3.7644e-2 1.0]) (mkTuple [7.0e-2 5.367e-3 5.367e-3 0.25]) (mkTuple [0.813333 0.328044 0.328044 0.25]) (mkTuple [3.3333e-2 1.444e-3 1.444e-3 0.25]) (mkTuple [3.3333e-2 1.444e-3 1.444e-3 0.25]) (mkTuple [0.0 0.0 0.0 0.25]) (mkTuple [0.243333 3.8933e-2 3.8933e-2 1.0])];
      selected-color = mkTuple [true 3.6667e-2 2.322e-3 2.322e-3 1.0];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 140;
      sort-column = "name";
      sort-directories-first = true;
      sort-order = "ascending";
      type-format = "category";
      view-type = "list";
      window-size = mkTuple [859 372];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 157;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [0 0];
      window-size = mkTuple [1366 689];
    };
  };
}
