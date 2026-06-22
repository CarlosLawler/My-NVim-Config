-- Enable true colors
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Configure cyberdream BEFORE loading it
require("cyberdream").setup({
    transparent = false, -- this keeps backgrounds solid/readable
})

-- Apply colorscheme
vim.cmd.colorscheme("cyberdream")

-- Make diff highlights readable
-- Removes harsh background colors in Diffview/vimdiff.
local function set_diff_highlights()
    vim.cmd("highlight DiffAdd guibg=NONE ctermbg=NONE")
    vim.cmd("highlight DiffChange guibg=NONE ctermbg=NONE")
    vim.cmd("highlight DiffDelete guibg=NONE ctermbg=NONE")
    vim.cmd("highlight DiffText guibg=NONE ctermbg=NONE gui=underline cterm=underline")
end

set_diff_highlights()

-- Reapply if the colorscheme is ever reloaded
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = set_diff_highlights,
})
