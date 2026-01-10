{
  lib,
  stdenv,
  zig,
  fetchFromGitHub,
  version ? "0.2.0",
  hash ? "sha256-LzzQOHyv8DE6fwIlNJRxrSFMtHruFe5X3wxSQhrY9JY=",
  callPackage,
}:
stdenv.mkDerivation rec {
  pname = "zmx";
  inherit version;

  src = fetchFromGitHub {
    owner = "neurosnap";
    repo = "zmx";
    rev = "v${version}";
    inherit hash;
    fetchSubmodules = true;
  };

  deps = callPackage ./deps-zmx.nix {
    name = "zmx-cache-${version}";
  };

  strictDeps = true;

  nativeBuildInputs = [zig.hook];

  zigBuildFlags = [
    "-Doptimize=ReleaseSafe"
    "--system"
    "${deps}"
    "-Dversion-string=${version}"
    "--verbose"
  ];

  meta = with lib; {
    description = "Session persistence for terminal processes";
    homepage = "https://github.com/neurosnap/zmx";
    license = licenses.mit;
    platforms = platforms.unix;
    mainProgram = "zmx";
  };
}
