-- ========================
-- LSP Keymaps
-- ========================
--
-- These keymaps are only active when an LSP server attaches to the current buffer.

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lawlesslos-lsp-attach", { clear = true }),

    callback = function(event)
        local opts = { buffer = event.buf, silent = true }

        -- Navigation
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, {
            desc = "Go to definition",
        }))

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, {
            desc = "Go to declaration",
        }))

        vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, {
            desc = "Go to references",
        }))

        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, {
            desc = "Go to implementation",
        }))

        -- Information
        vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, {
            desc = "Hover documentation",
        }))

        vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, {
            desc = "Signature help",
        }))

        -- Code actions
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, {
            desc = "Rename symbol",
        }))

        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, {
            desc = "Code action",
        }))

        -- Diagnostics
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, vim.tbl_extend("force", opts, {
            desc = "Open diagnostic",
        }))

        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, {
            desc = "Previous diagnostic",
        }))

        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, {
            desc = "Next diagnostic",
        }))
    end,
})
