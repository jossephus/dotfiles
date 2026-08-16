{ lib
, stdenv
, fetchurl
, version ? "0.7.1"
, darwinHash ? "sha256-KP/GaHFlMB2a4xV0JVf103ZMfnKsK7v8iS+Hqx45pbc="
, darwinX64Hash ? "sha256-WauY75/Ed90X/nE6MpcpLCNMDB6VIjDxYHTbzxdoehs="
, linuxArm64Hash ? "sha256-W4JLchwjOvyFuWBl941Y2tCrKiU+DPt9DM66avGCoXw="
, linuxX64Hash ? "sha256-TEqHZGrgLzI6QWkEhBIjo7yoAg/o9+b6rvpXQhhvpYo="
,
}:
let
  sys = stdenv.hostPlatform.system;
  asset =
    {
      aarch64-darwin = {
        url = "https://github.com/kitlangton/ghui/releases/download/v${version}/ghui-darwin-arm64.tar.gz";
        hash = darwinHash;
      };
      x86_64-darwin = {
        url = "https://github.com/kitlangton/ghui/releases/download/v${version}/ghui-darwin-x64.tar.gz";
        hash = darwinX64Hash;
      };
      aarch64-linux = {
        url = "https://github.com/kitlangton/ghui/releases/download/v${version}/ghui-linux-arm64.tar.gz";
        hash = linuxArm64Hash;
      };
      x86_64-linux = {
        url = "https://github.com/kitlangton/ghui/releases/download/v${version}/ghui-linux-x64.tar.gz";
        hash = linuxX64Hash;
      };
    }.${
    sys
    } or (throw "ghui: unsupported system ${sys}");
in
stdenv.mkDerivation rec {
  pname = "ghui";
  inherit version;

  src = fetchurl {
    url = asset.url;
    hash = asset.hash;
  };

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/bin
    cp ghui $out/bin/
    chmod +x $out/bin/ghui
  '';

  meta = with lib; {
    description = "Terminal UI for GitHub pull requests";
    homepage = "https://github.com/kitlangton/ghui";
    license = licenses.mit;
    platforms = [
      "aarch64-darwin"
      "x86_64-darwin"
      "aarch64-linux"
      "x86_64-linux"
    ];
    mainProgram = "ghui";
    maintainers = [ ];
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
  };
}
