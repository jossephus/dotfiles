{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.programs.livekit-cli = {
    enable = mkEnableOption "livekit-cli command line interface";
    version = mkOption {
      type = types.str;
      default = "2.12.9";
      description = "Version of livekit-cli to install";
    };
    hash = mkOption {
      type = types.str;
      default = "sha256-B8zGAS6sX5wWNgXR2TQI+zqSsN2v6lpXDn7Mf+YTPgc=";
      description = "Source hash for the livekit-cli version";
    };
    vendorHash = mkOption {
      type = types.str;
      default = "sha256-MSC7GWI5MqXOQ/yE32UKKkqmxFoqD6ysGXVu58D76/k=";
      description = "Vendor hash for Go dependencies";
    };
  };

  config = mkIf config.programs.livekit-cli.enable {
    home.packages = with pkgs; [
      (livekit-cli.override {
        version = config.programs.livekit-cli.version;
        hash = config.programs.livekit-cli.hash;
        vendorHash = config.programs.livekit-cli.vendorHash;
      })
    ];
  };
}
