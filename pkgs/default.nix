{pkgs ? import<nixpkgs> {}, ...}: rec {
  curosr = pkgs.callPackage ./apps/cursor.nix {};
  wrapWine = pkgs.callPackage ./wrapWine.nix { };
  pot_player = pkgs.callPackage ./apps/pot_player.nix {
    inherit wrapWine;
  };
  dupeclear = pkgs.callPackage ./apps/dupe-clear.nix {
    inherit wrapWine;
  };

  vtsls = pkgs.buildNpmPackage rec {
    name = "@vtsls/language-server";
    version = "0.2.3";
    src = pkgs.fetchurl {
        url = "https://registry.npmjs.org/@vtsls/language-server/-/language-server-${version}.tgz";
        hash = "sha256-VnMTKUqWpLxntV7RLU6Hsfet4XrdJhOrIjI3QcYpt6w=";
    };
    npmDepsHash = "sha256-N1K/kGlk2d8j1y6dcVyPuNDk9pYGslQFIVN1P3rLm+k=";
    dontNpmBuild = true;
    postPatch = ''
      cp ${./package-lock.json} package-lock.json
    '';
    npmFlags = [ "--legacy-peer-deps" "--loglevel=verbose" ];
    meta = {
      mainProgram = "vtsls";
    };
  };
  #memento = pkgs.callPackage ./apps/memento.nix { qtbase = { version = "5"; }; };
}
