{pkgs, ...}: {
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bash = {
    shellAliases = {
      cd = "z";
    };
  };
}
