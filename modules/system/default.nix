{ config, pkgs,pkgs-unstable,... }:

{
  imports = [
    # ./example.nix - add your modules here
  ];

  environment.systemPackages = [
    # pkgs.vscode - hydenix's vscode version
    # pkgs.userPkgs.vscode - your personal nixpkgs version
    pkgs.clash-verge-rev
    pkgs.librime-lua
    pkgs.librime-octagram
  ];
  

services.flatpak.enable = true;
systemd.services.clash-verge-service = {
  description = "Auto start service ...";
  wantedBy = [ "multi-user.target" ]; # boot startup
  after = [ "network.target" ];            # Start after the network is ready
  serviceConfig = {
    ExecStart = "${pkgs.clash-verge-rev}/bin/clash-verge-service";
    Restart = "always";
    User = "root";
  };
};


}
