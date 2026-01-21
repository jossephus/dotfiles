{
  lib,
  stdenvNoCC,
  fetchurl,
  unzip,
}:
stdenvNoCC.mkDerivation {
  pname = "codexbar";
  version = "0.17.0";

  src = fetchurl {
    url = "https://github.com/steipete/CodexBar/releases/download/v0.17.0/CodexBar-0.17.0.zip";
    sha256 = "sha256-LD86SQCPLi/yZOSjatAntcFA1hwzGsLnrOLB/5sMadw=";
  };

  nativeBuildInputs = [unzip];

  unpackCmd = "unzip -q $curSrc";

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/Applications
    cp -R CodexBar.app $out/Applications
    mkdir -p $out/bin
    ln -s $out/Applications/CodexBar.app/Contents/MacOS/CodexBar $out/bin/codexbar
  '';

  meta = with lib; {
    description = "Menu bar app to keep your Codex, Claude, Cursor, and other AI limits visible";
    homepage = "https://github.com/steipete/CodexBar";
    license = licenses.mit;
    platforms = ["aarch64-darwin" "x86_64-darwin"];
    sourceProvenance = with sourceTypes; [binaryNativeCode];
  };
}
