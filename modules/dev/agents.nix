{ pkgs, ... }:
{
  # Coding agents.
  home.packages = with pkgs; [
    claude-code
    codex
    gemini-cli-bin
  ];
}
