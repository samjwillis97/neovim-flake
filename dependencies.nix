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
    nodePackages.svelte-language-server
    # angularls
    # dotnet-sdk_7
    # dotnet-runtime_7
    # omnisharp-roslyn
    nodePackages.bash-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.vscode-json-languageserver
    nodePackages.yaml-language-server
    nodePackages.vscode-css-languageserver-bin
    rnix-lsp
    rust-analyzer
    nil
    lua-language-server
    elixir-ls

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
