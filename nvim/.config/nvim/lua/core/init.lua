require("core.mappings")
require("core.packer")
require("core.ftdetect")

-- Indent
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Backup with undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim-undodir"
vim.opt.undofile = true

-- Don't highlight all searches
-- vim.opt.hlsearch = false

-- Minimum lines to show ahead while scrolling
vim.opt.scrolloff = 8

-- vim.opt.updatetime = 50

-- Disable 'signcolumn' - gutter left of line numbers
vim.opt.signcolumn = 'no'
-- Use same line for status line (lualine), commands, command output
-- vim.opt.cmdheight = 0

-- Disable 'Warning: changing a readonly file'
vim.cmd("au BufEnter * set noro")

