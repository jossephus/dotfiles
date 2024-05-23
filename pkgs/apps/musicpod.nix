{
  lib,
  pkgs, 
  flutter,
  ...
}:
flutter.buildFlutterApplication {
  pname = "Musicpod";
  version = "1.3.7";

  src = pkgs.fetchFromGitHub {
    owner = "ubuntu-flutter-community";
    repo = "musicpod";
    rev = "3b4e611d296a108554c7451478a982ea663b983c";
    hash = "sha256-tYw5yZYfgUFoYLwlz9lWP4oD/z05NHUO/5upV1qbPAE=";
  };

  nativeBuildInputs = with pkgs; [ ninja pkg-config mpv];

  buildInputs = with pkgs; [ libplacebo vapoursynth vulkan-headers vulkan-loader libass ffmpeg libunwind shaderc lcms2 libdovi libdvdnav libdvdread libbluray lua rubberband SDL2 libuchardet zimg alsa-lib pipewire libpulseaudio libcaca libarchive libbs2b libjack2 mujs libpng openalSoft libsixel swift libtheora libvdpau libdrm libcdio libcdio-paranoia xgboost gst_all_1.gstreamer gst_all_1.gst-plugins-base];

  pubspecLock = lib.importJSON ./pubspec.lock.json;

  gitHashes = {
    "mpris_service" = "sha256-dA4aILtRKjAMPpCxjLAsBAkVvw5KM12dWukhbGBNy9A=";
    "phoenix_theme" = "sha256-9clPoNb2e2aAkWFTL5ue0AKgS/098RUQX26/OjGZ7mQ="; 
    "yaru" = "sha256-yCsmvjNXOntDApyKirO2tpjjemOGk8gieJL0k0dDLqs=";
  };

  # This one also works
  #autoPubspecLock = builtins.fetchurl { name = "pubspec-lock";
    #url = "https://raw.githubusercontent.com/ubuntu-flutter-community/musicpod/main/pubspec.lock";
    #sha256 = "sha256:1a7q80a27g59ix95c6gxm6g90v5fjs710z0linr3qbkl9xvlrwba";
  #};

}
