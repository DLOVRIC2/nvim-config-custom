-- Map <Leader>f to run :Prettier in Normal mode
vim.api.nvim_set_keymap('n', '<Leader>f', ':Prettier<CR>', { noremap = true, silent = true })

-- Optionally, if you want to run it in Visual mode as well
vim.api.nvim_set_keymap('v', '<Leader>f', ':Prettier<CR>', { noremap = true, silent = true })
