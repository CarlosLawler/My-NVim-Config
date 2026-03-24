-- ========================
-- Keymaps
-- ========================

-- Leader key
vim.g.mapleader = " "

-- Open file explorer (netrw)
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>", { desc = "Open file explorer" })

-- Split window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize split sizes" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Navigate between splits easily
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Fast escape using "kj"
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("v", "kj", "<Esc>", { desc = "Exit visual mode" })
vim.keymap.set("c", "kj", "<C-c>", { desc = "Cancel command mode" })

-- Keep cursor centered while scrolling/searching
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })
vim.keymap.set("n", "n", "nzz", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzz", { desc = "Previous search result (centered)" })

-- Get cursor to end/beginning of file in visual/normal
vim.keymap.set("v", "gg", "gg^", { desc = "Go to start of file (first non-blank)" })
vim.keymap.set("v", "G", "G$", { desc = "Go to end of file (end of line)" })
vim.keymap.set("n", "G", "G$", { desc = "Go to end of file (end of line)" })
vim.keymap.set("n", "gg", "gg^", { desc = "Go to start of file (first non-blank)" })

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
