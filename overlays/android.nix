{androidNixpkgs}: final: _: {
  android-sdk = androidNixpkgs.sdk.${final.stdenv.hostPlatform.system} (sdkPkgs:
    with sdkPkgs; [
      build-tools-36-0-0
      build-tools-35-0-0
      build-tools-30-0-3
      cmdline-tools-17-0
      platform-tools
      platforms-android-36
      platforms-android-33
      ndk-27-1-12297006
      ndk-29-0-13113456
    ]);
}
