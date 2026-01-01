{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.programs.zigdoc = {
    enable = mkEnableOption "zigdoc - documentation viewer for Zig";
    version = mkOption {
      type = types.str;
      default = "0.2.1";
      description = "Version of zigdoc to install";
    };
    hash = mkOption {
      type = types.str;
      default = "sha256-1F5RaOulq/KufuOS66uxSn4OCs9lHrdYCJY5gZ6tmDM=";
      description = "Source hash for the zigdoc version";
    };
  };

  config = mkIf config.programs.zigdoc.enable {
    home.packages = with pkgs; [
      (zigdoc.override {
        version = config.programs.zigdoc.version;
        hash = config.programs.zigdoc.hash;
      })
    ];
  };
}
