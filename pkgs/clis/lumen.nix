{
  pkgs,
  lib,
  rustPlatform,
  fetchFromGitHub,
  version ? "2.19.0",
  hash ? "sha256-YXT6nQ1TtizbO7Gcas10yuY6XJJmeFLUeSoepEizb5Q=",
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

  cargoHash = "sha256-ux8OaAyffjD801yoyyfq6eCBlNhq/gXh7caJ7L5fGjE=";

  meta = with lib; {
    description = "AI Git Commit message, Git changes summary from the CLI (no API key required)";
    homepage = "https://github.com/jnsahaj/lumen";
    license = licenses.mit;
    platforms = platforms.all;
    mainProgram = "lumen";
  };
}
