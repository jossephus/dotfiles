{
  lib,
  runCommand,
  scrcpy,
  androidDeviceSerial ? "RR8W70320MP",
}:
runCommand "android-mirror-1.0.0" {
  meta = {
    description = "macOS app bundle for mirroring an Android device with scrcpy";
    license = lib.licenses.mit;
    platforms = lib.platforms.darwin;
  };
} ''
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
  exec ${scrcpy}/bin/scrcpy -s ${androidDeviceSerial} -K --render-driver=opengl
  EOF

  chmod +x "$app/Contents/MacOS/AndroidMirror"
''
