{ pkgs, ... }:

{
  imports = [
    ./kitty.nix
    ./nvim.nix
    ./input-method.nix
    ./services.nix
    ./hyprland.nix
    ./theme.nix
    ./zsh.nix
    ./services.nix
    ./script.nix
    ./xdg.nix
    ./path.nix # manage config file hard link
  ];

  # home-manager options go here
  home.packages = [
    pkgs.google-chrome
    pkgs.yazi
    pkgs.trash-cli
    pkgs.uv
    pkgs.bun
    pkgs.nodejs
    pkgs.cargo
    pkgs.unstable.claude-code-router
  ];

  # hydenix home-manager options go here
  hydenix.hm.enable = true;
  hydenix.hm.hyprland.hypridle.enable = false;
  hydenix.hm.lockscreen = {
    enable = false; # enable lockscreen module
    hyprlock = false; # enable hyprlock lockscreen
    swaylock = false; # enable swaylock lockscreen
  };
  # Visit https://github.com/richen604/hydenix/blob/main/docs/options.md for more options

}
