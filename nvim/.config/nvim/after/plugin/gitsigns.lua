require("gitsigns").setup()

-- Transparent background
vim.cmd([[highlight SignColumn     guibg=NONE]])
vim.cmd([[highlight GitSignsAdd    guibg=NONE]])
vim.cmd([[highlight GitSignsChange guibg=NONE]])
vim.cmd([[highlight GitSignsDelete guibg=NONE]])
