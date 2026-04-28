# Copyright (C) Pipin Fitriadi - All Rights Reserved

# Unauthorized copying of this file, via any medium is strictly prohibited
# Proprietary and confidential
# Written by Pipin Fitriadi <pipinfitriadi@gmail.com>, 16 April 2026

{ config, lib, pkgs, ... }:

{
  environment.packages = with pkgs; [
    ripgrep
    python312
    neovim

    gnused
    ncurses
    git
    code-server
    cloudflared
  ];

  environment.etcBackupExtension = ".bak";

  system.stateVersion = "24.05";

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  time.timeZone = "Asia/Jakarta";
}
