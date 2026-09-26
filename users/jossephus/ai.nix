{
  pkgs,
  inputs,
  ...
}: let
  llmAgents = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};

  cl = pkgs.writeShellScriptBin "cl" ''
    export CLAUDE_CONFIG_DIR="$HOME/.claude-personal"
    export DISABLE_AUTOUPDATER=1
    exec ${llmAgents.claude-code}/bin/claude "$@"
  '';
in {
  home.packages = with llmAgents; [
    cl
    agent-browser
    herdr
    pi
    skills
    terminal-use
    fx
    opencode2
    pi
    antigravity-cli
  ];
}
