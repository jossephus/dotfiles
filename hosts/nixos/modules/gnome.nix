{
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.xserver = {
    xkb = {
      variant = "";
      layout = "us";
    };

    config = ''
      Section "InputClass"
      	Identifier "Touchscreen catchall"
      	MatchIsTouchscreen "on"
         Option "Ignore" "on"
      Endsection
    '';
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="04f3", ATTRS{idProduct}=="250e", ATTR{authorized}="0"
  '';
}
