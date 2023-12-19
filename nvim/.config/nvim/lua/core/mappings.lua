-- Leader space
vim.g.mapleader = " "
-- Open file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Esperanto keys
vim.api.nvim_set_option('langmap', 'ĉx,ĝw,ĥ],ĵ[,ŝq,ŭy,ĈX,ĜW,Ĥ},Ĵ{,ŜQ,ŬY')

-- Save file
-- Show nice error if file is readonly
function is_file_writable()
    local current_file = vim.fn.bufname(vim.fn.bufnr('%'))
    -- returns `0` if file DOESNT exist, OR is writable by user
    local writable = vim.fn.system("! test -f " .. current_file .. " || test -w " .. current_file .. " ; echo $?")
    return string.sub(writable, 1, 1) == '0'
end
function save_file()
    if is_file_writable() then
        vim.cmd.write()
    else
        vim.cmd "echohl ErrorMsg"
        vim.cmd "echom 'File is readonly'"
        vim.cmd "echohl None"
    end
end
vim.keymap.set("n", "<C-s>", save_file)
vim.keymap.set("i", "<C-s>", save_file)

-- Switch to previous buffer
vim.keymap.set("n", "tt", "<cmd>b#<CR>");

-- Enable autocompiler
-- vim.keymap.set("n", "<C-y>", ":!setsid autocomp % &<CR>", { silent = true })

-- Move selection up/down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Preserve cursor position when merging lines
vim.keymap.set("n", "J", "mzJ`z")

-- Override paste without copying deleted text
-- ??? Same as Shift+P ???
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Disable Shift+Q
vim.keymap.set("n", "Q", "<nop>")

-- Switch tmux projects
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- Quickfix ???
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Select all
vim.keymap.set("n", "<C-g>", "ggVG")

-- Tree-sitter
vim.keymap.set("n", "<leader>tu", "<cmd>TSUpdate<CR>")
vim.keymap.set("n", "<leader>tp", "<cmd>TSPlaygroundToggle<CR>")
vim.keymap.set("n", "<leader>th", "<cmd>TSHighlightCapturesUnderCursor<CR>")

-- Toggle wrap
vim.keymap.set("n", "<leader>z", function ()
    if vim.wo.wrap then
        vim.wo.wrap = false
        print("Line wrapping is OFF")
    else
        vim.wo.wrap = true
        print("Line wrapping is ON")
    end
end)

-- Stop highlighting searched text
vim.keymap.set('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true })

-- Start a new find-replace command without terms
vim.keymap.set("n", '?', ':%s/')

-- Make open file executable
vim.keymap.set("n", "<C-M-x>", ":!chmod +x %<CR>")

