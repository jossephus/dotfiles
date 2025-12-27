{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "livekit-cli";
  version = "2.12.9";

  src = fetchFromGitHub {
    owner = "livekit";
    repo = "livekit-cli";
    rev = "v${version}";
    hash = "sha256-B8zGAS6sX5wWNgXR2TQI+zqSsN2v6lpXDn7Mf+YTPgc=";
  };

  vendorHash = "sha256-MSC7GWI5MqXOQ/yE32UKKkqmxFoqD6ysGXVu58D76/k=";

  subPackages = [ "cmd/lk" ];

  meta = with lib; {
    description = "Command line interface to LiveKit";
    homepage = "https://livekit.io/";
    license = licenses.asl20;
    mainProgram = "lk";
  };
}
