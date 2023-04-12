vim.g.mapleader = "\\"

-- Standard Config
vim.opt.errorbells = false

-- Swap Files
vim.opt.swapfile = false
vim.opt.dir = "/tmp"

-- Backup Files
vim.opt.backup = false

-- Undo Files
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- User Interface
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cmdheight = 1
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.termguicolors = true

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Folding
vim.opt.foldenable = true
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 10
vim.opt.foldmethod = "indent"

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true
