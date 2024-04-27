{
  pkgs,
  fetchurl,
  appimageTools,
  makeDesktopItem,
  ...
}:
let 
  logo = builtins.fetchurl {
    name = "dataflare-app.png";
    url = "https://dataflare.app/_next/static/media/logo.7e0b9739.svg";
    sha256 = "sha256:0znkp84rn3qqywawfwka552s4gcr6vdrjs3xq0w92z8pa0amccfs";
  };
  desktopItem = makeDesktopItem {
    name = "Dataflare";
    exec = "dataflare";
    desktopName = "Dataflare";
    genericName = "Database Explorer";
    icon = "${logo}";
    terminal = false;
    categories = [ "Database" ];
  };
in 
appimageTools.wrapType2 {
  # or wrapType1
  name = "dataflare";
  src = pkgs.fetchurl {
    url = "https://assets.dataflare.app/release/linux/x86_64/Dataflare.AppImage";
    hash = "sha256-AmSLLRi7Vkt0CecGDI3ULhrc0139DxVoTHD1vyJH31s=";
  };
  extraPkgs = pkgs: with pkgs; [];

  extraInstallCommands = ''
   mkdir -p $out/share/applications
   install -m 0644 -D "${desktopItem}/share/applications/Dataflare.desktop" \
      "$out/share/applications/dataflare.desktop"
  '';

}
