{ pkgs-unstable, ... }:
{

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
    package = pkgs-unstable.openrgb-with-all-plugins;
  };
}
