-- Glow markdown preview configuration
require('glow').setup({
    -- Style can be "dark" or "light"
    style = "dark",
    -- Width of the preview window (default: 80)
    width = 120,
    -- Height ratio of window to screen (0-1)
    height_ratio = 0.8,
    -- Width ratio of window to screen (0-1)
    width_ratio = 0.8,
})

-- Keybindings for markdown preview (floating window)
vim.keymap.set('n', '<leader>mg', ':Glow<CR>', { desc = 'Markdown Glow preview (floating window)' })
