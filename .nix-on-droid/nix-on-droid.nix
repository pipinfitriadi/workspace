# Copyright (C) Pipin Fitriadi - All Rights Reserved

# Unauthorized copying of this file, via any medium is strictly prohibited
# Proprietary and confidential
# Written by Pipin Fitriadi <pipinfitriadi@gmail.com>, 16 April 2026

{ config, lib, pkgs, ... }:

let
  vscodeExt =
    (builtins.getFlake "github:nix-community/nix-vscode-extensions")
      .extensions.${pkgs.system}.open-vsx;
in
{
  environment.packages = with pkgs; [
    gnused
    ncurses
    vim
    git

    (vscode-with-extensions.override {
      vscode = code-server;

      vscodeExtensions = with vscodeExt; [
        pkief.material-icon-theme
      ];
    })
  ];

  environment.etcBackupExtension = ".bak";

  system.stateVersion = "24.05";

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  time.timeZone = "Asia/Jakarta";
}
