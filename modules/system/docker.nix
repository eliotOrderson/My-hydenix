{ ... }:

{
  # 1. 启用 Docker 服务
  virtualisation.docker.enable = true;
  # virtualisation.docker.enableNvidia = true;

  # 2. (可选) 如果需要 rootless 模式 (无需 sudo 运行 docker)
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # 3. 将你的用户添加到 docker 用户组 (重要：否则每次都要 sudo)
  # 请将 "your-username" 替换为你的实际用户名
  users.users.hydenix.extraGroups = [ "docker" ];
}
