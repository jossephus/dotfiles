{ lib, stdenv, zig, version ? "0.3.1" }:

# Build prise from local source with network access for Zig dependencies
let
  priseSourceDir = "/Users/jossephus/workspace/zigspace/src/prise";
in
stdenv.mkDerivation rec {
  pname = "prise";
  inherit version;

  # Reference local source directory
  src = builtins.path { path = priseSourceDir; name = "prise-src"; };

  nativeBuildInputs = [ zig ];

  # Allow network access for Zig to fetch dependencies
  # This is needed because prise has complex transitive dependencies
  # (ghostty, vaxis, zlua, zeit) that zig needs to fetch and build
  __impureHostDeps = [ ];
  __impureSandbox = true;

  buildPhase = ''
    mkdir -p $TMPDIR/zig-cache
    export ZIG_GLOBAL_CACHE_DIR=$TMPDIR/zig-cache
    zig build --release=safe
  '';

  installPhase = ''
    mkdir -p $out/bin $out/share
    cp zig-out/bin/prise $out/bin/
    
    # Install shell completions
    [ -d zig-out/share/fish/vendor_completions.d ] && \
      cp -r zig-out/share/fish $out/share/
    [ -d zig-out/share/bash-completion ] && \
      cp -r zig-out/share/bash-completion $out/share/
    [ -d zig-out/share/zsh ] && \
      cp -r zig-out/share/zsh $out/share/
    
    # Install lua libraries and man pages if they exist
    [ -d zig-out/share/prise ] && \
      cp -r zig-out/share/prise $out/share/
    [ -d zig-out/share/man ] && \
      cp -r zig-out/share/man $out/share/
  '';

  meta = with lib; {
    description = "Terminal UI for Ghostty with Lua scripting";
    homepage = "https://github.com/rockorager/prise";
    license = licenses.mit;
    mainProgram = "prise";
    platforms = platforms.all;
  };
}
