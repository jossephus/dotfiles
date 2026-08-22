{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}; [
    agent-browser
    herdr
    pi
    skills
    terminal-use
    fx
  ];
}
