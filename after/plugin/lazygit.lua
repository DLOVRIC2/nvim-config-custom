-- Lazygit configuration
vim.g.lazygit_floating_window_winblend = 0
vim.g.lazygit_floating_window_scaling_factor = 0.9
vim.g.lazygit_floating_window_use_plenary = 0
vim.g.lazygit_use_neovim_remote = 1

-- Keymaps
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { desc = 'Open LazyGit', silent = true })
vim.keymap.set('n', '<leader>lf', ':LazyGitFilterCurrentFile<CR>', { desc = 'LazyGit file history', silent = true })

-- Keep Escape working inside lazygit terminal
-- Only exit terminal mode with double-Escape or Ctrl+\ Ctrl+n
vim.api.nvim_create_autocmd('TermOpen', {
    pattern = '*',
    callback = function()
        local opts = { buffer = true, silent = true }
        -- Single Escape stays in terminal, double Escape exits to normal mode
        vim.keymap.set('t', '<Esc>', '<Esc>', opts)
        vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], opts)
    end,
})
