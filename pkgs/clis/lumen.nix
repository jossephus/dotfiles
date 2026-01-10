{
  lib,
  rustPlatform,
  fetchFromGitHub,
  version ? "2.11.0",
  hash ? "sha256-VMFsM2gykzRzrn11r1Y2/xrHXMOL4rKc5UiFi/mPpoQ=",
}:
rustPlatform.buildRustPackage rec {
  pname = "lumen";
  inherit version hash;

  src = fetchFromGitHub {
    owner = "jnsahaj";
    repo = "lumen";
    rev = "v${version}";
    inherit hash;
  };

  doCheck = false;

  cargoHash = "sha256-ngkNKDYW55Vc2vMXmDSvKHChc1WnwoS8EbHPdrOSPKs=";

  meta = with lib; {
    description = "AI Git Commit message, Git changes summary from the CLI (no API key required)";
    homepage = "https://github.com/jnsahaj/lumen";
    license = licenses.mit;
    platforms = platforms.all;
    mainProgram = "lumen";
  };
}
