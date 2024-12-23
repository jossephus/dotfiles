{pkgs, inputs, ...}: {
  #programs.firefox = {
    #enable = true;

    #profiles.jossephus = {
      #extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        #sidebery
      #];
    #};
  #};
}
