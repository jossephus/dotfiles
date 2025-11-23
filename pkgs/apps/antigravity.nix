{
  lib,
  stdenvNoCC,
  fetchurl,
  _7zz,
}:
stdenvNoCC.mkDerivation {
  pname = "antigravity";
  version = "1.11.3";

  src = fetchurl {
    url = "https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/1.11.3-6583016683339776/darwin-arm/Antigravity.dmg";
    hash = "sha256-XeO8C/p37TusaI8Ft27BAk7GL8WvCFJFeigEWPJWG5Q=";
  };

  nativeBuildInputs = [_7zz];

  # Use 7zz to extract DMG, preventing extended attributes from becoming corrupt files
  # -snld prevents "ERROR: Dangerous symbolic link path was ignored"
  # -xr'!*:com.apple.*' prevents macOS extended attributes from corrupting the app bundle
  unpackCmd = "7zz x -snld -xr'!*:com.apple.*' $curSrc";

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/Applications
    # The DMG extracts to a directory, not directly to .app
    cp -R Antigravity/Antigravity.app $out/Applications
  '';

  meta = with lib; {
    description = "Antigravity - macOS application";
    homepage = "https://antigravity.tech";
    license = lib.licenses.unfree;
    platforms = ["aarch64-darwin"];
    sourceProvenance = with lib.sourceTypes; [binaryNativeCode];
  };
}
