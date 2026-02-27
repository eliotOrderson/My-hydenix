{ ... }:
{

  hydenix.hm.shell.zsh.plugins = [ "sudo" ];
  hydenix.hm.shell.zsh.configText = ''
    function lf() {
    	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    	yazi "$@" --cwd-file="$tmp"
    	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    		builtin cd -- "$cwd"
    	fi
    	rm -f -- "$tmp"
    }



  '';
}
