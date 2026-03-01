{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.hydenix.hardware.openrgb.GigbyteB850;
in
{
  # 1. 定义深层嵌套的选项
  options.hydenix.hardware.openrgb.GigbyteB850 = {
    enable = lib.mkEnableOption "OpenRGB for Gigabyte B850M";
  };

  # 2. 只有当开启该特定主板的选项时，才应用配置
  config = lib.mkIf cfg.enable {
    boot.kernelModules = [
      "i2c-dev"
      "i2c-piix4"
    ];
    boot.kernelParams = [ "acpi_enforce_resources=lax" ];

    services.udev.extraRules = ''
      # Gigabyte USB RGB Controller (048d:5711)
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="5711", MODE="0666", GROUP="users"
    '';

    services.hardware.openrgb = {
      enable = true;
      package = pkgs.unstable.openrgb-with-all-plugins;
    };
  };
}
