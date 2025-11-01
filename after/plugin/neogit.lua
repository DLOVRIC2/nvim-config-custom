-- Neogit configuration
local neogit = require('neogit')

neogit.setup({
    -- Disable built-in commit popup (we'll use the commit editor)
    disable_builtin_notifications = false,
    -- Use telescope for select operations
    use_telescope = true,
    -- Integration with diffview
    integrations = {
        diffview = true,
        telescope = true,
    },
    -- Commit popup options
    commit_popup = {
        kind = "split",
    },
    -- Preview window options
    preview_buffer = {
        kind = "split",
    },
    -- Popup window options
    popup = {
        kind = "split",
    },
    -- Signs for staged/unstaged changes
    signs = {
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
    },
    -- Auto-refresh git status
    auto_refresh = true,
    -- Disable line numbers in Neogit buffers
    disable_line_numbers = true,
    -- Graph style for log
    graph_style = "unicode",
})

-- Keybindings for Neogit
-- Main Neogit interface
vim.keymap.set('n', '<leader>gg', ':Neogit<CR>', { desc = 'Open Neogit' })
vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>', { desc = 'Git commit with Neogit' })
vim.keymap.set('n', '<leader>gp', ':Neogit push<CR>', { desc = 'Git push with Neogit' })
vim.keymap.set('n', '<leader>gl', ':Neogit log<CR>', { desc = 'Git log with Neogit' })

-- Keep fugitive for quick git status (legacy)
-- <leader>gs is already mapped in fugitive.lua
