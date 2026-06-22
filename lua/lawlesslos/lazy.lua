-- ========================
-- Plugin Manager (lazy.nvim)
-- ========================

-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

-- Add lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- Plugin definitions
require("lazy").setup({
    -- Utility library required by many plugins
    { "nvim-lua/plenary.nvim" },

    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Syntax highlighting and parsing
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    -- Colorscheme
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
    },

    -- Keybinding helper
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- Auto-close parentheses, brackets, quotes, etc.
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    -- Easy commenting
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            options = {
                theme = "auto",
                globalstatus = false,
                section_separators = "",
                component_separators = "",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        },
    },
    -- LSP server/package manager
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    -- Bridges Mason with Neovim LSP configs
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "html",
                "cssls",
                "jsonls",
                "pyright",
                "clangd",
                "bashls",
            },
            automatic_enable = true,
        },
    },
})
