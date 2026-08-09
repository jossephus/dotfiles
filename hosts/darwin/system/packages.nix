{
  inputs,
  pkgs,
  ...
}: let
  androidDeviceSerial = "RR8W70320MP";
  androidMirrorApp = pkgs.runCommand "android-mirror-app" {} ''
    app="$out/Applications/Android Mirror.app"
    mkdir -p "$app/Contents/MacOS"

    cat > "$app/Contents/Info.plist" <<'EOF'
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>CFBundleDevelopmentRegion</key>
        <string>en</string>
        <key>CFBundleExecutable</key>
        <string>AndroidMirror</string>
        <key>CFBundleIdentifier</key>
        <string>local.nix.android-mirror</string>
        <key>CFBundleInfoDictionaryVersion</key>
        <string>6.0</string>
        <key>CFBundleName</key>
        <string>Android Mirror</string>
        <key>CFBundlePackageType</key>
        <string>APPL</string>
        <key>CFBundleShortVersionString</key>
        <string>1.0</string>
        <key>CFBundleVersion</key>
        <string>1</string>
      </dict>
    </plist>
    EOF

    cat > "$app/Contents/MacOS/AndroidMirror" <<'EOF'
    #!/usr/bin/env bash
    exec ${pkgs.scrcpy}/bin/scrcpy -s ${androidDeviceSerial} -K --render-driver=opengl
    EOF

    chmod +x "$app/Contents/MacOS/AndroidMirror"
  '';
in {
  environment.systemPackages = with pkgs; [
    android-sdk
    androidMirrorApp
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
    ripgrep
    rust-analyzer
    scrcpy
    tailscale
    vim
    vscode
    zed-editor
    zigpkgs."0.15.2"
    inputs.zlsPkg.packages.aarch64-darwin.default
    (rust-bin.stable.latest.default.override {
      targets = ["wasm32-wasip1" "wasm32-wasip2"];
    })
  ];
}
