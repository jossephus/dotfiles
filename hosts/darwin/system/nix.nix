{
  nix.enable = false;
  nix.settings.experimental-features = "nix-command flakes";

  determinateNix = {
    customSettings = {
      keep-outputs = true;
      extra-substituters = [
        "https://cache.jossephus.et/jossephus"
        "https://cache.numtide.com"
      ];
      extra-trusted-public-keys = [
        "jossephus:VNt933J5SAbf+pEOghPT361rDmeNJCa3+R3xhnWbX68="
        "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
      ];
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
