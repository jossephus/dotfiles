{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nix-update-script,
  makeWrapper,
  xsel,
  wl-clipboard,
}: {
  # this is not mine, I was exploring how overlays work, but I dont know where I copied it from.
  modifications = final: prev: {
    johannes = buildGoModule rec {
      pname = "johannes";
      version = "unstable-2024-03-07";

      src = fetchFromGitHub {
        owner = "ayn2op";
        repo = "discordo";
        rev = "23cb3a146a8567526b35807c6f16120163c40f98";
        hash = "sha256-71i/8t768RtD0Gk2cpSdznERSNf1gErQrrOGYiZz05g=";
      };

      vendorHash = "sha256-dBJYTe8aZtNuBwmcpXb3OEHoLVCa/GbGExLIRc8cVbo=";

      CGO_ENABLED = 0;

      ldflags = ["-s" "-w"];

      # Clipboard support on X11 and Wayland
      nativeBuildInputs = [makeWrapper];

      postInstall = ''
        wrapProgram $out/bin/discordo \
        --prefix PATH : ${lib.makeBinPath [xsel wl-clipboard]}
      '';

      passthru.updateScript = nix-update-script {
        extraArgs = ["--version=branch"];
      };

      meta = with lib; {
        description = "A lightweight, secure, and feature-rich Discord terminal client";
        homepage = "https://github.com/ayn2op/discordo";
        license = licenses.mit;
        maintainers = [maintainers.arian-d];
        mainProgram = "discordo";
      };
    };
  };
}
