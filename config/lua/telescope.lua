local actions = require("telescope.actions")
require("telescope").load_extension("fzf")

---- Bindings
vim.api.nvim_set_keymap("n", "<leader>g", ":Git<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope git_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>F", ":Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>w", ":Telescope grep_string<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>h", ":Telescope help_tags<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>B", ":Telescope current_buffer_fuzzy_find<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gd", ":Telescope lsp_definitions<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gr", ":Telescope lsp_references<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gi", ":Telescope lsp_implementations<CR>", { noremap = true })
