{
  nix.enable = false;
  nix.settings.experimental-features = "nix-command flakes";

  determinateNix.customSettings.keep-outputs = true;

  environment.etc."determinate/config.json".text = builtins.toJSON {
    garbageCollector.strategy = "disabled";
    builder = {
      cpuCount = 1;
      memoryBytes = 8589934592;
    };
  };
}
