-- Insert Mode Remaps
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })

-- Normal Mode Remaps
--
---- TMUX Sessionizer - overwrites full page down
vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", {})

---- Clear search highlights
vim.api.nvim_set_keymap("n", "<leader><space>", ":nohlsearch<CR>", {})

---- Reload VIMRC
vim.api.nvim_set_keymap("n", "<leader>R", ":source $MYVIMRC<CR>", {})

---- Navigate between splits
vim.api.nvim_set_keymap("n", "<C-J>", "<C-W><C-J>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-K>", "<C-W><C-K>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-L>", "<C-W><C-L>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-H>", "<C-W><C-H>", { noremap = true })

---- Centering after jumps
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-i>", "<C-i>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-o>", "<C-o>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "n", "nzz", { noremap = true })
vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap = true })
vim.api.nvim_set_keymap("n", "GG", "GGzz", { noremap = true })

---- Navigate by visual lines
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })

---- NVIMTree
-- vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", ",n", ":NvimTreeFindFile<CR>", { noremap = true })

---- GitSigns
-- vim.api.nvim_set_keymap("n", "[g", ":Gitsigns prev_hunk<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "]g", ":Gitsigns next_hunk<CR>", { noremap = true })

---- Harpoon
-- vim.api.nvim_set_keymap("n", "<leader>a", ':lua require("harpoon.mark").add_file()<CR>', { noremap = true })
-- vim.api.nvim_set_keymap("n", "<C-a>", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>1", ':lua require("harpoon.ui").nav_file(1)<CR>', { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>2", ':lua require("harpoon.ui").nav_file(2)<CR>', { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>3", ':lua require("harpoon.ui").nav_file(3)<CR>', { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>4", ':lua require("harpoon.ui").nav_file(4)<CR>', { noremap = true })

---- Code Navigation + LSP
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { noremap = true })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { noremap = true })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { noremap = true })
