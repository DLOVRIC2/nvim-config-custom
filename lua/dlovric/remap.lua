-- Set space as the leader key
vim.g.mapleader = " "

-- Map '<leader>e' to open the command line window in normal mode
-- Ever since I added the nvim-tree this has been replaced.
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
local api = require("nvim-tree.api")
vim.keymap.set("n", "<leader>e", api.tree.toggle)

-- Move a block of text down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Move a block of text up in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join lines and keep the cursor in place in normal mode
vim.keymap.set("n", "J", "mzJ`z")

-- Scroll down half a page and recenter in normal mode
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Scroll up half a page and recenter in normal mode
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move to the next search result and recenter in normal mode
vim.keymap.set("n", "n", "nzzzv")

-- Move to the previous search result and recenter in normal mode
vim.keymap.set("n", "N", "Nzzzv")

-- Paste over without yanking the replaced text in visual mode (x)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Map Ctrl-C to Escape in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable the Q command in normal mode
vim.keymap.set("n", "Q", "<nop>")

-- Open a new Tmux window in normal mode
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format the current buffer using LSP in normal mode
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Go to the previous item in location list and center the screen in normal mode
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace the word under the cursor globally with confirmation in normal mode
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the current file executable in normal mode
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


-- Reload the current buffer in normal mode
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
