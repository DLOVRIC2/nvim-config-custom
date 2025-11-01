-- Render markdown in-buffer configuration
require('render-markdown').setup({
    -- Render markdown by default when opening .md files
    enabled = true,
    -- Maximum file size in MB to attempt to render (prevents lag on huge files)
    max_file_size = 10.0,
    -- Debounce time for re-rendering when editing (milliseconds)
    debounce = 100,
    -- Render in all buffers or just markdown
    file_types = { 'markdown' },
    -- Heading settings
    headings = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
    -- Code block highlighting
    code = {
        enabled = true,
        sign = true,
        style = 'full',
        width = 'block',
        border = 'thin',
    },
    -- Checkbox rendering
    checkbox = {
        enabled = true,
        unchecked = '󰄱 ',
        checked = '󰱒 ',
    },
})

-- Keybindings for markdown rendering
-- Toggle render on/off in current buffer
vim.keymap.set('n', '<leader>mp', ':RenderMarkdown toggle<CR>', { desc = 'Toggle Markdown render in-place' })
vim.keymap.set('n', '<leader>mr', ':RenderMarkdown toggle<CR>', { desc = 'Toggle Markdown render (alias)' })
