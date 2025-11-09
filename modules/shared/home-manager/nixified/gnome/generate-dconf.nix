{pkgs, ...}: let
  runDconf = pkgs.runCommand "runDconf" {} ''
    mkdir $out
    touch $out/generated-dconf.nix
    "${pkgs.dconf}/bin/dconf dump > $out/generated.settings
    touch $out/generated-dconf.nix
    dconf2nix -i $out/generated.settings -o $out/generated-dconf.nix";
  '';
in
  runDconf
