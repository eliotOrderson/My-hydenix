{ pkgs, ... }:
{
  imports = [
    ./openrgb-gigabyteb850m.nix
    ./services.nix
  ];

  environment.systemPackages = [
    pkgs.clash-verge-rev
    pkgs.librime-lua
    pkgs.librime-octagram
    pkgs.i2c-tools
  ];

  hydenix.sddm.enable = true;
  services.displayManager.autoLogin = {
    enable = true;
    user = "hydenix";
  };
  services.displayManager.defaultSession = "hyprland-uwsm";

}
