{ lib, stdenv, zig, fetchFromGitHub, version ? "0.2.1", hash ? "sha256-1F5RaOulq/KufuOS66uxSn4OCs9lHrdYCJY5gZ6tmDM=" }:

stdenv.mkDerivation rec {
  pname = "zigdoc";
  inherit version hash;

  src = fetchFromGitHub {
    owner = "rockorager";
    repo = "zigdoc";
    rev = "v${version}";
    inherit hash;
  };

  nativeBuildInputs = [ zig.hook ];

  meta = with lib; {
    description = "Command-line tool to view documentation for Zig standard library symbols";
    homepage = "https://github.com/rockorager/zigdoc";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
