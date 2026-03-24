-- Enable true colors
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Configure cyberdream BEFORE loading it
require("cyberdream").setup({
  transparent = false, -- 🔥 THIS is the key fix
})

-- Apply colorscheme
vim.cmd.colorscheme("cyberdream")
