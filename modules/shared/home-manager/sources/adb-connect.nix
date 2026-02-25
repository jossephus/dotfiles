{pkgs}:
pkgs.writeShellApplication {
  name = "adb-connect";
  runtimeInputs = [pkgs.tailscale];
  text = ''
    set -euo pipefail

    detect_android_tailnet_ip() {
      tailscale status 2>/dev/null | awk '$4 == "android" && $5 != "offline," { print $1; exit }'
    }

    ADB_TS_HOST="$(detect_android_tailnet_ip)"
    if [[ -z "''${ADB_TS_HOST}" ]]; then
      echo "Could not find an online Android device in 'tailscale status'." >&2
      exit 1
    fi

    echo "Connecting to ''${ADB_TS_HOST}:5555 over Tailscale..."
    ${pkgs.android-tools}/bin/adb connect "''${ADB_TS_HOST}:5555" || true

    echo "Connected devices:"
    ${pkgs.android-tools}/bin/adb devices -l
  '';
}
