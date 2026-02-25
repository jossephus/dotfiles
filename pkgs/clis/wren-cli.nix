{ lib, stdenv, fetchFromGitHub, version ? "main", hash ? "sha256-UqGdIsLoSh5bTxf7AvPBh+abSPylKMlMbDw+j0IclKM=" }:

stdenv.mkDerivation rec {
  pname = "wren-cli";
  inherit version;

  src = fetchFromGitHub {
    owner = "wren-lang";
    repo = "wren-cli";
    rev = version;
    inherit hash;
    fetchSubmodules = true;
  };

  buildPhase = ''
    runHook preBuild
    cd projects/${if stdenv.hostPlatform.isDarwin then "make.mac" else "make"}
    make config=release_64bit
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp ../../bin/wren_cli $out/bin/wren
    runHook postInstall
  '';

  meta = with lib; {
    description = "A command line tool for the Wren programming language";
    homepage = "https://wren.io/cli/";
    license = licenses.mit;
    platforms = platforms.unix;
    mainProgram = "wren";
  };
}
