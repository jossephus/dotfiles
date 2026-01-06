{ lib, stdenv, fetchurl, version ? "v2025_10_15" }:

let
  urlBase = "https://github.com/marler8997/anyzig/releases/download/${version}";
  
  targets = {
    aarch64-darwin = {
      url = "${urlBase}/anyzig-aarch64-macos.tar.gz";
      hash = "sha256-NDBSVqM9Pv22gNH3zDaKN6EDjbt6oHqRWadd1R61tm4=";
    };
    x86_64-darwin = {
      url = "${urlBase}/anyzig-x86_64-macos.tar.gz";
      hash = lib.fakeHash;
    };
    aarch64-linux = {
      url = "${urlBase}/anyzig-aarch64-linux.tar.gz";
      hash = lib.fakeHash;
    };
    x86_64-linux = {
      url = "${urlBase}/anyzig-x86_64-linux.tar.gz";
      hash = lib.fakeHash;
    };
  };

  target = targets.${stdenv.system} or (throw "Unsupported system: ${stdenv.system}");
in

stdenv.mkDerivation rec {
  pname = "anyzig";
  inherit version;

  src = fetchurl {
    url = target.url;
    hash = target.hash;
  };

  unpackPhase = ''
    tar xzf $src
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp zig $out/bin/anyzig
    chmod +x $out/bin/anyzig
  '';

  meta = with lib; {
    description = "A universal zig executable that lets you run any version of zig";
    homepage = "https://github.com/marler8997/anyzig";
    license = licenses.mit;
    mainProgram = "anyzig";
    platforms = [ "aarch64-darwin" "x86_64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
