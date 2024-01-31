# https://mipmip.github.io/home-manager-option-search/?query=programs.starship

{ lib, ... }:

{
  programs = {
    starship = {
      enable = true;
      enableFishIntegration = true;
      enableTransience = true;
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
        directory = {
          substitution = {
            home = "~";
            "/home/omar/dev" = "dev";
            style = "cyan";
          };
        };
        # format = lib.concatStrings [
        #   "$line_break"
        #   "$directory"
        #   "$git_branch"
        #   "$git_status"
        #   "$git_commit"
        #   "$package"
        #   "$character"
        #   "$line_break"
        # ];
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[✗](bold red)";
        };
        package = {
          symbol = "📦";
          style = "bold yellow";
        };
        # shell = { disabled = true; };
        username = { disabled = true; };
        hostname = { disabled = true; };
        container = { disabled = true; };
        nix_shell = { disabled = true; };
        aws = { disabled = true; };
        bun = { disabled = true; };
        rust = { disabled = true; };
        cargo = { disabled = true; };
        python = { disabled = true; };
        gcloud = { disabled = true; };
        golang = { disabled = true; };
      };
    };
  };

}
