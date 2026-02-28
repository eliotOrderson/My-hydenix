{ inputs, config, ... }:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = ./config/secrets.yaml;
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    secrets = {
      github_private_key = {
        path = "${config.users.users.hydenix.home}/.ssh/id_ed25519";
        mode = "0600";
      };
    };
  };
}
