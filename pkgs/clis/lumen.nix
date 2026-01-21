{
  pkgs,
  lib,
  rustPlatform,
  fetchFromGitHub,
  version ? "2.18.0",
  hash ? "sha256-2nNO5f+WMwQqaUFEa8W89ZRi3cuL7XPVbKHa67tB1gY=",
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

  nativeBuildInputs = [pkgs.pkg-config pkgs.perl];
  buildInputs = [pkgs.openssl];

  cargoHash = "sha256-awtjku2W7FsVRPOYJ8qocRl7H+6GNVk2iFgXTJrc3OY=";

  meta = with lib; {
    description = "AI Git Commit message, Git changes summary from the CLI (no API key required)";
    homepage = "https://github.com/jnsahaj/lumen";
    license = licenses.mit;
    platforms = platforms.all;
    mainProgram = "lumen";
  };
}
