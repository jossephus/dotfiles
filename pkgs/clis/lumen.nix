{
  lib,
  rustPlatform,
  fetchFromGitHub,
  version ? "2.7.1",
  hash ? "sha256-T3hPCFNihcNJ0VryV3wOmzu5YS0ZSrXSM+ABuS859rc=",
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

  cargoHash = "sha256-Fjtyca4QwE/mkGJPEwvWfiRGL+mGuWE9gSASoyACflA=";

  meta = with lib; {
    description = "AI Git Commit message, Git changes summary from the CLI (no API key required)";
    homepage = "https://github.com/jnsahaj/lumen";
    license = licenses.mit;
    platforms = platforms.all;
    mainProgram = "lumen";
  };
}
