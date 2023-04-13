{ pkgs }:
with pkgs.vimPlugins; [
  ## Theme
  catppuccin-nvim
  nvim-web-devicons
  nvim-colorizer-lua
  indent-blankline-nvim

  ## Statusline
  lualine-nvim # TODO: Config

  ## Must Haves from VIM
  vim-commentary
  vim-surround
  vim-tmux-navigator

  ## Git
  gitsigns-nvim
  vim-fugitive

  ## QoL
  nvim-lastplace
  nvim-autopairs
  harpoon
  symbols-outline-nvim

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

  ## File Navigation
  nvim-tree-lua
]
