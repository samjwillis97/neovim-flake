{ pkgs }:
with pkgs.vimPlugins; [
  ## Theme
  catppuccin-nvim
  nvim-web-devicons
  nvim-colorizer-lua
  indent-blankline-nvim
  dashboard-nvim

  ## Statusline
  lualine-nvim

  ## Must Haves from VIM
  vim-commentary
  vim-surround
  vim-tmux-navigator

  ## which-key (doom emacs like)
  which-key-nvim

  ## Git
  gitsigns-nvim
  vim-fugitive

  ## QoL
  nvim-lastplace
  nvim-autopairs
  harpoon
  symbols-outline-nvim
  Shade-nvim

  ## Telescope
  telescope-nvim
  telescope-fzf-native-nvim
  telescope-fzf-native-nvim
  (nvim-treesitter.withPlugins (p: [
    p.json
    p.jsonc
    p.yaml
    p.toml
    p.lua
    p.go
    p.typescript
    p.javascript
    p.python
    p.rust
    p.c_sharp
    p.svelte
    p.vue
    p.css
    p.html
    p.nix
  ]))

  ## Language Server Protocol
  ## TODO: Evaluate these
  nvim-lspconfig
  nvim-cmp
  cmp-nvim-lsp
  cmp-buffer
  cmp-path
  cmp-cmdline
  lspkind-nvim
  omnisharp-extended-lsp-nvim
  trouble-nvim
  fidget-nvim
  nvim-code-action-menu
  vim-vsnip
  cmp-vsnip

  ## Formatter
  formatter-nvim

  ## File Navigation
  nvim-tree-lua

  ## Debug Adapter Protocol
  nvim-dap
  nvim-dap-ui
  nvim-dap-virtual-text

  ## Evaluating
  # statuscol
  # nvim-lightbulb
]
