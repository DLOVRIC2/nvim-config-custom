-- Bufferline configuration
require('bufferline').setup({
    options = {
        mode = 'buffers',
        numbers = 'none',
        close_command = 'bdelete! %d',
        right_mouse_command = 'bdelete! %d',
        left_mouse_command = 'buffer %d',
        middle_mouse_command = nil,
        indicator = {
            icon = '|',
            style = 'icon',
        },
        buffer_close_icon = 'x',
        modified_icon = '*',
        close_icon = 'x',
        left_trunc_marker = '<',
        right_trunc_marker = '>',
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
        -- Integration with nvim-tree
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                highlight = 'Directory',
                separator = true,
            }
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        persist_buffer_sort = true,
        separator_style = 'thin',
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = 'insert_after_current',
    }
})

-- Keymaps for buffer navigation
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { desc = 'Next buffer', silent = true })
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { desc = 'Previous buffer', silent = true })
vim.keymap.set('n', '<leader>bp', ':BufferLinePick<CR>', { desc = 'Pick buffer', silent = true })
vim.keymap.set('n', '<leader>bc', ':BufferLinePickClose<CR>', { desc = 'Pick buffer to close', silent = true })
vim.keymap.set('n', '<leader>bx', ':bdelete<CR>', { desc = 'Close current buffer', silent = true })
vim.keymap.set('n', '<leader>bo', ':BufferLineCloseOthers<CR>', { desc = 'Close other buffers', silent = true })
vim.keymap.set('n', '<leader>bl', ':BufferLineCloseLeft<CR>', { desc = 'Close buffers to the left', silent = true })
vim.keymap.set('n', '<leader>br', ':BufferLineCloseRight<CR>', { desc = 'Close buffers to the right', silent = true })
