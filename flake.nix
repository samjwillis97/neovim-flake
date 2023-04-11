{
    description = "Sam's Neovim";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
        
        # Additional Neovim Plugins
        nixneovimplugins = {
            url = "github:jooooscha/nixpkgs-vim-extra-plugins";
        };
    };

    outputs = { self, nixpkgs, nixneovimplugins, ... }@inputs:
    let
        lib = import ./lib;
    in
    {
        apps = lib.withDefaultSystems (sys: {
            nvim = {
                type = "app";
                program = "${self.defaultPackage."${sys}"}/bin/nvim";
            };
        });

        defaultApp = lib.withDefaultSystems (sys: {
            type = "app";
            program = "${self.defaultPackage."${sys}"}/bin/nvim";
        });

        defaultPackage = lib.withDefaultSystems (sys: self.packages."${sys}".neovimSW);

        packages = lib.withDefaultSystems (sys: {
            /* neovimSW = */ 
        });
    };
}
