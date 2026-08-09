{ lib
, stdenv
, fetchurl
, version ? "0.7.1"
, darwinHash ? "sha256-KP/GaHFlMB2a4xV0JVf103ZMfnKsK7v8iS+Hqx45pbc="
, darwinX64Hash ? "sha256-WZrO+eVMfd0X3xN6pycpLJxMDByeUiLwYH1N7yF4fxs="
, linuxArm64Hash ? "sha256-W4S3IccoP6yFhWYPePWNCqgq0qUuDs9w0M7qaxoYF8I="
, linuxX64Hash ? "sha256-TE6Ids4vI/MjpBCUhIIjq7ygIP6P3vbqrvr5d2KPhX4="
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
