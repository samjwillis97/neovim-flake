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
  };

  outputs = { self, nixpkgs, neovim, ... }:
  let
    # TODO I want this to be a list of systems, and output all the packages I want
    system = "aarch64-darwin";

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
    packages.${system}.default = pkgs.myNeovim;
    apps.${system}.default = {
        type = "app";
        program = "${pkgs.myNeovim}/bin/nvim";
    };
  };
}
