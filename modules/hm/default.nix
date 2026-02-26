{ config,pkgs,... }:

{
  imports = [
    # ./example.nix - add your modules here
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

  # home-manager options go here
  home.packages = with pkgs; [
    # pkgs.vscode - hydenix's vscode version
    # pkgs.userPkgs.vscode - your personal nixpkgs version
    google-chrome
  ];


i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
    # theme
      fcitx5-nord
      fcitx5-fluent

      (fcitx5-rime.override {
        rimeDataPkgs = [
          #pkgs.rime-ice
	  rime-wanxiang
        ];
      })
    ];
  };



  systemd.user.services.clash-verge = {
  Unit = {
    Description = "Clash Verge Rev Service";
    After = [ "graphical-session.target" ];
    Partof = [ "graphical-session.target" ];
  };

  Service = {
    Environment = "GDK_BACKEND=x11 WEBKIT_DISABLE_DMABUF_RENDERER=1 WEBKIT_DISABLE_COMPOSITION_MODE=1";
    ExecStart = "${pkgs.clash-verge-rev}/bin/clash-verge";
    Restart = "on-failure";
  };

  Install = {
    WantedBy = [ "graphical-session.target" ];
  };
};

}
