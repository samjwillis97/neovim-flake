{ pkgs, src }:
pkgs.vimUtils.buildVimPlugin {
  name = "statuscol";
  inherit src;
}
