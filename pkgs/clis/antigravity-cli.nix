{
  lib,
  stdenv,
  fetchurl,
  autoPatchelfHook,
  versionCheckHook,
}:
# Google Antigravity CLI (`agy`).
# Pinned ahead of numtide/llm-agents.nix, which is still on 1.5.0. Versions and
# sha512s come from the official release manifests:
#   https://antigravity-cli-auto-updater-974169037036.us-central1.run.app/manifests/<platform>.json
# Drop this override and go back to inputs.llm-agents once upstream ships this
# version.
let
  version = "1.5.1";
  buildId = "4523430503120896";
  baseUrl = "https://storage.googleapis.com/antigravity-public/antigravity-cli/${version}-${buildId}";

  sources = {
    aarch64-darwin = {
      url = "${baseUrl}/darwin-arm/cli_mac_arm64.tar.gz";
      hash = "sha512-B4OZs5LDv85wvF2fsaRHpLCiomvUDDYUj0lEAouPIeNYiQ1bm+3N5pKWZ3sdosAmtOKDrpGII0KcE7kd3LkTzg==";
    };
    x86_64-linux = {
      url = "${baseUrl}/linux-x64/cli_linux_x64.tar.gz";
      hash = "sha512-9wQGZU69lm8hFCQzglni040JnEhzTpAdwGl1Bj5aATfVW265Nmt1mDxpCLvCCukqJhdla7GR2O1v5CnWVLyk9Q==";
    };
    aarch64-linux = {
      url = "${baseUrl}/linux-arm/cli_linux_arm64.tar.gz";
      hash = "sha512-/fikY+W/Ts2KAbaKU+AG564CVueuNRo545xm4E4nXG0ItLk/QjzFctI0hx97+FLEUj4BcVak756n3qGq/7Cixg==";
    };
  };

  source =
    sources.${stdenv.hostPlatform.system}
    or (throw "antigravity-cli: unsupported system ${stdenv.hostPlatform.system}");
in
  stdenv.mkDerivation {
    pname = "antigravity-cli";
    inherit version;

    src = fetchurl {inherit (source) url hash;};

    nativeBuildInputs = lib.optionals stdenv.hostPlatform.isLinux [autoPatchelfHook];
    buildInputs = lib.optionals stdenv.hostPlatform.isLinux [(lib.getLib stdenv.cc.cc)];

    # Prebuilt, signed binary: never strip it or the darwin signature breaks.
    dontStrip = true;
    sourceRoot = ".";

    installPhase = ''
      runHook preInstall

      install -Dm755 antigravity $out/bin/agy

      runHook postInstall
    '';

    doInstallCheck = true;
    nativeInstallCheckInputs = lib.optionals stdenv.hostPlatform.isDarwin [versionCheckHook];

    installCheckPhase = lib.optionalString stdenv.hostPlatform.isLinux ''
      runHook preInstallCheck

      $out/bin/agy --help >/dev/null

      runHook postInstallCheck
    '';

    meta = with lib; {
      description = "CLI for Google Antigravity, an agentic development platform";
      homepage = "https://antigravity.google/";
      changelog = "https://antigravity.google/cli";
      license = licenses.unfree;
      sourceProvenance = with sourceTypes; [binaryNativeCode];
      platforms = ["x86_64-linux" "aarch64-linux" "aarch64-darwin"];
      mainProgram = "agy";
    };
  }
