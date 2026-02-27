{ config, pkgs, ... }:
let
  flakeDir = "${config.home.homeDirectory}/hydenix";
in
{
  hydenix.hm.editors = {
    enable = true;
    vscode = {
      enable = true;
      wallbash = true;
    };

    vim = false;
    neovim = false;
    default = "nvim";
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    # 安装 LazyVim 必须的依赖
    extraPackages = with pkgs; [
      # 基础工具
      git
      gcc
      gnumake
      unzip
      wget
      curl
      nodejs
      cargo

      # 搜索与过滤 (LazyVim 强依赖)
      ripgrep
      fd
    ];

  };

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${flakeDir}/modules/hm/config/nvim";
}
