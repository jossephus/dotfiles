{inputs}: {
  custom-packages = final: prev: (import ../pkgs {pkgs = prev;});

  modifications = final: prev: {
    discordo = final.buildGoModule rec {
      pname = "discordo";
      version = "unstable-2024-03-07";

      src = final.fetchFromGitHub {
        owner = "ayn2op";
        repo = "discordo";
        rev = "23cb3a146a8567526b35807c6f16120163c40f98";
        hash = "sha256-71i/8t768RtD0Gk2cpSdznERSNf1gErQrrOGYiZz05g=";
      };

      vendorHash = "sha256-dBJYTe8aZtNuBwmcpXb3OEHoLVCa/GbGExLIRc8cVbo=";

      CGO_ENABLED = 0;

      ldflags = ["-s" "-w"];

      # Clipboard support on X11 and Wayland
      nativeBuildInputs = [final.makeWrapper];

      postInstall = ''
        wrapProgram $out/bin/discordo \
        --prefix PATH : ${final.lib.makeBinPath [final.xsel final.wl-clipboard]}
      '';

      passthru.updateScript = final.nix-update-script {
        extraArgs = ["--version=branch"];
      };

      meta = with final.lib; {
        description = "A lightweight, secure, and feature-rich Discord terminal client";
        homepage = "https://github.com/ayn2op/discordo";
        license = licenses.mit;
        maintainers = [maintainers.arian-d];
        mainProgram = "discordo";
      };
    };
  };
}
