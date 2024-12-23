
{ pkgs
, fetchurl
, makeDesktopItem
, symlinkJoin
, wrapWine
, ... }:
let
  source = fetchurl {
    url = "https://gsf-fl.softonic.com/810/41f/dac1828c24b9854efbe871c8cf13e83baa/PotPlayerSetup.exe?Expires=1715963943&Signature=8fb9a9af73cc86f5df3e950e136562c0c450539d&url=https://potplayer.en.softonic.com&Filename=PotPlayerSetup.exe";
    sha256 = "sha256-ED7hgcBqqbjZg/CgZudVetDt5ry2qB/GgG/DhdEmH1A=";
  };

  name = "pot-player";

  bin = wrapWine {
    inherit name;

    firstrunScript = ''
      echo "installing Pot Player for PC"

      wine ${source} /S

    '';

    executable = "$WINEPREFIX/drive_c/Program Files/DAUM/PotPlayer/PotPlayerMini.exe";
  };

  desktop = makeDesktopItem {
    name = "Pot-Player";
    desktopName = "Pot-Player";
    type = "Application";
    exec = "${bin}/bin/pot-player";
    icon = fetchurl {
      url = "https://images.sftcdn.net/images/t_app-icon-s/p/d3c12354-96d3-11e6-bfbf-00163ed833e7/1418749125/potplayer-PotPlayer_logo_(2017).png";
      sha256 = "sha256-kcRw+0yVORXdoaa3fRw0Qcbxa6fG3PgVoxwFlcx2he4=";
    };
  };
in symlinkJoin {
  name = "Pot-Player";
  paths = [bin desktop];
}
