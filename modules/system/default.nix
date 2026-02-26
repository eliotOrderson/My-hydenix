{ config, pkgs,pkgs-unstable,... }:
{

  boot.kernelModules = [ "i2c-dev" "i2c-piix4" ];
  boot.kernelParams = [ "acpi_enforce_resources=lax" ];

  services.udev.extraRules = ''
    # Gigabyte USB RGB Controller (048d:5711)
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="5711", MODE="0666", GROUP="users"
  '';

  services.hardware.openrgb = {
    enable = true;
    package = pkgs-unstable.openrgb-with-all-plugins; 
  };


  imports = [
    # ./example.nix - add your modules here
  ];

  environment.systemPackages = [
    # pkgs.vscode - hydenix's vscode version
    # pkgs.userPkgs.vscode - your personal nixpkgs version
    pkgs.clash-verge-rev
    pkgs.librime-lua
    pkgs.librime-octagram
    pkgs.i2c-tools
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






