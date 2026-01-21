{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  config = mkIf config.programs.prise.enableService {
    launchd.agents."prise.server" = {
      enable = true;
      config = {
        Label = "sh.prise.server";
        ProgramArguments = [
          "${pkgs.prise}/bin/prise"
          "--server"
        ];
        KeepAlive = true;
        StandardOutPath = "${config.home.homeDirectory}/Library/Logs/prise.log";
        StandardErrorPath = "${config.home.homeDirectory}/Library/Logs/prise.err.log";
        ProcessType = "Background";
        Nice = 10;
      };
    };
  };
}
