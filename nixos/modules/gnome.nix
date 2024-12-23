{...}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  # this didnt work but lets keep it there for future reference.
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

  # disable touchscreen
  # based on https://askubuntu.com/questions/927022/how-can-i-disable-touchscreen-while-using-wayland
  # same as above: didnt work or it might have worked, touch screen glitch happens
  # so rarely
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="04f3", ATTRS{idProduct}=="250e", ATTR{authorized}="0"
  '';
}
