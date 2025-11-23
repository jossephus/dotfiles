{pkgs, ...}: {
  programs.vscode = {
    enable = true;

    profiles.default.extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
    ];
    #++ pkgs.vscode-utils.extensionFromVscodeMarketplace [
    #{
    #name = "remote-ssh-edit";
    #publisher = "ms-vscode-remote";
    #version = "0.47.2";
    #}
    #];
  };
}
