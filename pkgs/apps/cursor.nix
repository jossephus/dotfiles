{
  pkgs,
  fetchurl,
  appimageTools,
  makeDesktopItem,
  ...
}: let
  logo = builtins.fetchurl {
    name = "cursor-app.png";
    url = "https://cursor.sh/brand/logo.svg";
    sha256 = "sha256:0lx1i5j3kc0hhxjfch9sa69w9g4lbzb890c1zwxppp02fv617x02";
  };
  desktopItem = makeDesktopItem {
    name = "Cursor";
    exec = "cursor";
    desktopName = "Cursor";
    genericName = "Cursor Editor";
    icon = "${logo}";
    terminal = false;
  };
in
  appimageTools.wrapType2 {
    name = "cursor";
    src = pkgs.fetchurl {
      url = "https://downloader.cursor.sh/linux/appImage/x64";
      hash = "sha256-Paz5Ys8Xz+eFgThLo0jXIQGl57C4CuldjIzrX12b/3w=";
    };
    extraPkgs = pkgs: with pkgs; [];

    extraInstallCommands = ''
      mkdir -p $out/share/applications
      install -m 0644 -D "${desktopItem}/share/applications/cursor.desktop" \
         "$out/share/applications/cursor.desktop"
    '';

    meta = with pkgs.lib; {
      description = "Cursor - AI-powered code editor";
      homepage = "https://cursor.sh";
      license = licenses.unfree;
      platforms = ["x86_64-linux"];
      sourceProvenance = with sourceTypes; [binaryNativeCode];
    };
  }
