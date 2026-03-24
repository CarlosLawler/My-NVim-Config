-- ========================
-- Telescope Configuration
-- ========================

local builtin = require("telescope.builtin")

-- Find files
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find files" })

-- Search git-tracked files
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find git files" })

-- Grep for a string (manual input)
vim.keymap.set("n", "<leader>ps", function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep for string" })
