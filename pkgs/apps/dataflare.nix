{
  pkgs, 
  appimageTools, 
  ...
}:
appimageTools.wrapType2 { # or wrapType1
  name = "dataflare";
  src = pkgs.fetchurl {
    url = "https://assets.dataflare.app/release/linux/x86_64/Dataflare.AppImage";
    hash = "sha256-AmSLLRi7Vkt0CecGDI3ULhrc0139DxVoTHD1vyJH31s=";
  };
  extraPkgs = pkgs: with pkgs; [ ];
}
