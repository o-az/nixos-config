# https://home-manager-options.extranix.com/?query=programs.starship.&release=master
{
  programs.starship = {
    enable = true;
    enableTransience = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    settings = {
      scan_timeout = 10;
      add_newline = true;
      command_timeout = 10000;
      git_branch = {
        symbol = "🌱 ";
        truncation_length = 20;
      };
      git_status = {
        ahead = "↑";
        behind = "↓";
        diverged = "↕";
      };
      git_commit = {
        commit_hash_length = 7;
        tag_symbol = "🏷";
      };
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };
      package = {
        disabled = true;
      };
      username = {
        disabled = true;
      };
      nodejs = {
        disabled = true;
      };
      hostname = {
        disabled = true;
      };
      container = {
        disabled = true;
      };
      nix_shell = {
        disabled = true;
      };
      aws = {
        disabled = true;
      };
      bun = {
        disabled = true;
      };
      rust = {
        disabled = true;
      };
      python = {
        disabled = true;
      };
      gcloud = {
        disabled = true;
      };
      golang = {
        disabled = true;
      };
    };
  };
}
