{
  config,
  lib,
  ...
}:
with lib; {
  options.programs.prise = {
    enable = mkEnableOption "PRISE terminal UI for Ghostty";
  };

  config = mkIf config.programs.prise.enable {
    programs.bash.initExtra = ''
      if [[ -z "$PRISE" \
         && -z "$SKIP_PRISE" \
         && "$TERM_PROGRAM" == "ghostty" ]]; then
        export PRISE=1
        exec prise
      fi
    '';
  };
}
