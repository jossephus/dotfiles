{
  nix.enable = false;
  nix.settings.experimental-features = "nix-command flakes";

  determinateNix = {
    customSettings = {
      keep-outputs = true;
      extra-substituters = [ "https://cache.jossephus.et/jossephus" ];
      extra-trusted-public-keys = [ "jossephus:iG2HsPZsVgIJtR6OMLRM4XXoBRJ/NTvYTT0lIcssJ74=" ];
    };
    determinateNixd = {
      garbageCollector.strategy = "disabled";
      builder = {
        cpuCount = 1;
        memoryBytes = 8589934592;
      };
    };
  };
}
