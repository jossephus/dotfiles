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
      default = "0.3.0";
      description = "Version of zigdoc to install";
    };
    hash = mkOption {
      type = types.str;
      default = "sha256-MhZ7LCsqZhLazDYwDZ/hzk9lYM3Bm1j96HDQ/OrdZFg=";
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
