{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    android-sdk
    android-mirror
    bashInteractive
    blueutil
    cocoapods
    codexbar
    google-cloud-sdk
    gradle
    jdk21
    losslesscut-bin
    mosh
    mpv
    orbstack
    rust-analyzer
    scrcpy
    tailscale
    vim
    vscode
    zed-editor
    zigpkgs."0.15.2"
    inputs.zlsPkg.packages.aarch64-darwin.default
    #(rust-bin.stable.latest.default.override {
    #targets = ["wasm32-wasip1" "wasm32-wasip2"];
    #})
  ];
}
