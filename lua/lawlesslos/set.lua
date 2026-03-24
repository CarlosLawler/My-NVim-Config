-- ========================
-- Core Editor Settings
-- ========================

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs & indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Disable line wrapping
vim.opt.wrap = false

-- Keep cursor centered
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- File handling
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true -- persistent undo

-- Search behavior
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI
vim.opt.termguicolors = false -- disabled for now (terminal compatibility)
vim.opt.signcolumn = "yes"

-- Faster update time (useful for plugins later)
vim.opt.updatetime = 50

-- Split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Better file path handling
vim.opt.isfname:append("@-@")

-- Backspace behavior
vim.opt.backspace = "indent,eol,start"

-- Performance guard for long lines (JSX/Tailwind)
vim.opt.synmaxcol = 200

-- Disable expensive cursor highlights
vim.opt.cursorline = false
vim.opt.cursorcolumn = false

-- Make sure user site directory is on runtimepath so Treesitter queries/parsers are found
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")
