-- Markdown Preview configuration (for Mermaid diagrams and rich preview)

-- Don't auto-start preview when opening markdown files
vim.g.mkdp_auto_start = 0

-- Auto-close preview when switching away from markdown buffer
vim.g.mkdp_auto_close = 1

-- Refresh on typing (not just on save) for live updates
vim.g.mkdp_refresh_slow = 0

-- Use default browser
vim.g.mkdp_browser = ''

-- Preview server options
vim.g.mkdp_preview_options = {
    mkit = {},
    katex = {},
    uml = {},
    maid = {},  -- Mermaid diagrams
    disable_sync_scroll = 0,
    sync_scroll_type = 'middle',
    hide_yaml_meta = 1,
    sequence_diagrams = {},
    flowchart_diagrams = {},
    content_editable = false,
    disable_filename = 0,
    toc = {}
}

-- Use GitHub-style markdown rendering
vim.g.mkdp_markdown_css = ''
vim.g.mkdp_highlight_css = ''

-- Page title (will show filename)
vim.g.mkdp_page_title = '「${name}」'

-- Keybindings for markdown preview
vim.keymap.set('n', '<leader>md', '<cmd>MarkdownPreview<cr>', { desc = 'Markdown Preview (with diagrams)' })
vim.keymap.set('n', '<leader>ms', '<cmd>MarkdownPreviewStop<cr>', { desc = 'Markdown Preview Stop' })
vim.keymap.set('n', '<leader>mt', '<cmd>MarkdownPreviewToggle<cr>', { desc = 'Markdown Preview Toggle' })
