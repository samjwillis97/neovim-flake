{ pkgs }:
let
  customRC = import ../config { inherit pkgs; };
  plugins = import ../plugins.nix { inherit pkgs; };
  deps = import ../dependencies.nix { inherit pkgs; };

  neovimDependencies = pkgs.symlinkJoin {
    name = "neovimDependencies";
    paths = deps.dependencies;
  };

  myNeovimUnwrapped = pkgs.wrapNeovim pkgs.neovim {
    configure = {
      inherit customRC;
      packages.all.start = plugins;
    };
  };
in pkgs.writeShellApplication
{
  name = "nvim";
  runtimeInputs = [ neovimDependencies ];
  text = ''
    ${myNeovimUnwrapped}/bin/nvim "$@"
  '';
}
