{
  nix.enable = false;
  nix.settings.experimental-features = "nix-command flakes";

  determinateNix = {
    customSettings = {
      keep-outputs = true;
      extra-substituters = [ "https://cache.jossephus.et/jossephus" ];
      extra-trusted-public-keys = [ "jossephus:VNt933J5SAbf+pEOghPT361rDmeNJCa3+R3xhnWbX68=" ];
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
