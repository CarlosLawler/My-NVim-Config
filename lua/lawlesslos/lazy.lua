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
	-- Autocomplete
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		opts = {
			keymap = {
				preset = "default",
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
				},
			},

			sources = {
				default = {
					"lazydev",
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
		opts_extend = {
			"sources.default",
		},
	},
	-- Better LuaLS support for Neovim config development
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	-- Git change indicators
	{
		"lewis6991/gitsigns.nvim",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},

			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, {
						buffer = bufnr,
						silent = true,
						desc = desc,
					})
				end

				-- Navigate between Git hunks
				map("n", "]h", function()
					gitsigns.nav_hunk("next")
				end, "Next Git hunk")

				map("n", "[h", function()
					gitsigns.nav_hunk("prev")
				end, "Previous Git hunk")

				-- Preview / blame
				map("n", "<leader>hp", gitsigns.preview_hunk, "Preview Git hunk")
				map("n", "<leader>hb", gitsigns.blame_line, "Blame line")

				-- Stage / reset hunks
				map("n", "<leader>hs", gitsigns.stage_hunk, "Stage Git hunk")
				map("n", "<leader>hr", gitsigns.reset_hunk, "Reset Git hunk")

				-- Stage / reset selected lines
				map("v", "<leader>hs", function()
					gitsigns.stage_hunk({
						vim.fn.line("."),
						vim.fn.line("v"),
					})
				end, "Stage selected Git hunk")

				map("v", "<leader>hr", function()
					gitsigns.reset_hunk({
						vim.fn.line("."),
						vim.fn.line("v"),
					})
				end, "Reset selected Git hunk")
			end,
		},
	},
	-- Code formatting
	{
		"stevearc/conform.nvim",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },

				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },

				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },

				python = { "black" },

				c = { "clang_format" },
				cpp = { "clang_format" },
			},
		},
		config = function(_, opts)
			require("conform").setup(opts)

			vim.keymap.set({ "n", "v" }, "<leader>f", function()
				require("conform").format({
					async = true,
					lsp_format = "fallback",
				})
			end, {
				desc = "Format file or selection",
			})
		end,
	},
	-- Integrated terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		keys = {
			{
				"<leader>tt",
				function()
					vim.cmd(vim.v.count1 .. "ToggleTerm")
				end,
				desc = "Toggle terminal",
			},
			{
				"<leader>ts",
				"<cmd>TermSelect<cr>",
				desc = "Select terminal",
			},
			{
				"<leader>ta",
				"<cmd>ToggleTermToggleAll<cr>",
				desc = "Toggle all terminals",
			},
		},
		opts = {
			size = 15,
			open_mapping = [[<c-\>]],
			direction = "horizontal",
			shade_terminals = false,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			close_on_exit = true,
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)

			-- Terminal-mode navigation
			vim.keymap.set("t", "kj", [[<C-\><C-n>]], {
				desc = "Exit terminal mode",
			})

			vim.keymap.set("t", "<leader>t1", [[<C-\><C-n><cmd>1ToggleTerm<cr>]], {
				desc = "Switch to terminal 1",
			})

			vim.keymap.set("t", "<leader>t2", [[<C-\><C-n><cmd>2ToggleTerm<cr>]], {
				desc = "Switch to terminal 2",
			})

			vim.keymap.set("t", "<leader>t3", [[<C-\><C-n><cmd>3ToggleTerm<cr>]], {
				desc = "Switch to terminal 3",
			})

			vim.keymap.set("t", "<leader>ts", [[<C-\><C-n><cmd>TermSelect<cr>]], {
				desc = "Select terminal",
			})
		end,
	},
})
