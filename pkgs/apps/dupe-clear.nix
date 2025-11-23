# Package for Kindle v1.17, the last version before KFX downloads were added.
# Note that the system trust store needs to have a specific verisign root certificate
# installed. See nixos/features/kindle/default.nix in this repo for that bit, plus
# a script to extract the decryption key from the installed app.
{
  pkgs,
  fetchurl,
  makeDesktopItem,
  symlinkJoin,
  wrapWine,
  ...
}: let
  source = fetchurl {
    url = "https://mozib.io/downloads/dupeclear/DupeClear-2.0.0.0-setup.exe";
    sha256 = "sha256-Jt5kK8+FgSaT42IWwm79KMHkNffurSvl/yVDjJedqrk=";
  };

  name = "dupeclear";

  bin = wrapWine {
    inherit name;

    firstrunScript = ''
      echo "installing Dupe Clear for PC"
      winecfg /v win10
      wine ${source} /S

    '';

    executable = "$WINEPREFIX/drive_c/Program Files/Dupe Clear/Dupe Clear.exe";
  };

  desktop = makeDesktopItem {
    name = "Dupe Clear";
    desktopName = "DupeClear";
    type = "Application";
    exec = "${bin}/bin/dupeclear";
    icon = fetchurl {
      url = "https://mozib.io/assets/images/dupe-clear-icon.png";
      sha256 = "sha256-bP6CSJCGFmTcXEhNoqLTJfTZtEbFl2CBmi9GsKyZndY=";
    };
  };
in
  symlinkJoin {
    name = "dupeclear";
    paths = [bin desktop];

    meta = with pkgs.lib; {
      description = "Dupe Clear - Duplicate file finder and remover";
      homepage = "https://mozib.io/dupe-clear";
      license = licenses.unfree;
      platforms = ["x86_64-linux"];
    };
  }
