{
  description = "Sam's Neovim 😇";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };

    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils, neovim, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        # overrides neovim with neovim from flake inputs.
        overlayFlakeInputs = prev: final: {
          neovim = neovim.packages.${system}.neovim;
        };

        # define my new package myNeovim.
        overlayMyNeovim = prev: final: {
          myNeovim = import ./packages/myNeovim.nix {
            pkgs = final;
          };
        };

        pkgs = import nixpkgs {
          system = system;
          overlays = [ overlayFlakeInputs overlayMyNeovim ];
        };
      in
      {
        packages = rec {
            nvim = pkgs.myNeovim;
            default = nvim;
        };

        apps = rec {
            nvim = flake-utils.lib.mkApp { drv = self.packages.${system}.nvim ; };
            default = nvim;
        };
      }
    );
}
