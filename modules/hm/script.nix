{ pkgs, ... }:

let
  windows-control = pkgs.writeShellScriptBin "windows-control" (
    builtins.readFile ./scripts/windowoperation.sh
  );
in
{
  home.packages = [
    windows-control
  ];
}
