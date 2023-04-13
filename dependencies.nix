{ pkgs }: {
  # TODO: See - https://ertt.ca/blog/2022/01-12-nix-symlinkJoin-nodePackages/
  dependencies = with pkgs; [
    # Telescope tools
    tree-sitter
    ripgrep
    fd

    # Language Servers
    nodePackages.pyright
    nodePackages.typescript-language-server
    nodePackages.eslint
    gopls
    golangci-lint
    nodePackages.svelte-language-server
    # angularls
    omnisharp-roslyn
    nodePackages.bash-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.vscode-json-languageserver
    nodePackages.yaml-language-server
    nodePackages.vscode-css-languageserver-bin
    rnix-lsp
    rust-analyzer
    nil
    lua-language-server

    ## Debug Adapter Protocols
    delve
    python310Packages.debugpy
    netcoredbg

    ## Formatters
    gofumpt
    black
    nodePackages.prettier
    stylua
    rustfmt
    nixfmt
  ];
}
