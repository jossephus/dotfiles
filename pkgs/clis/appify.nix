{ lib, stdenv, fetchurl, version ? "0.2.0", hash ? "sha256-T6xuhIqN5QMApR6XN+WgYuZ5wg9zY+yjTtOfroBxDKo=" }:

stdenv.mkDerivation rec {
  pname = "appify";
  inherit version hash;

  src = fetchurl {
    url = "https://github.com/mattrobenolt/appify/releases/download/v${version}/appify_${version}_darwin_arm64.tar.gz";
    inherit hash;
  };

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/bin
    cp appify $out/bin/
    chmod +x $out/bin/appify
  '';

  meta = with lib; {
    description = "Turn TUI apps into real macOS applications";
    homepage = "https://github.com/mattrobenolt/appify";
    license = licenses.mit;
    mainProgram = "appify";
    platforms = platforms.darwin;
  };
}
