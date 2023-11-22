-- Sets the cursor style in different modes (empty string disables special GUI cursors)
-- vim.opt.guicursor = ""

-- Enables line numbers
vim.opt.nu = true

-- Enables relative line numbers (line number relative to the cursor line)
vim.opt.relativenumber = true

-- Sets the number of spaces a tab counts for
vim.opt.tabstop = 4

-- Sets the number of spaces used for each step of (auto)indent
vim.opt.softtabstop = 4

-- Sets the number of spaces to use for each step of the indent
vim.opt.shiftwidth = 4

-- Converts tabs to spaces
vim.opt.expandtab = true

-- Enables smart indentation, which adjusts the indentation of lines intelligently based on the syntax
vim.opt.smartindent = true

-- Disables text wrapping
vim.opt.wrap = false

-- Disables creation of swap files
vim.opt.swapfile = false

-- Disables file backups
vim.opt.backup = false

-- Sets the directory for storing undo files
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Enables persistent undo, which allows you to undo changes even after closing and reopening a file
vim.opt.undofile = true

-- Disables highlighting all matches of search patterns
vim.opt.hlsearch = false

-- Enables incremental search, which shows matches as you type
vim.opt.incsearch = true

-- Enables 24-bit RGB color in the TUI
vim.opt.termguicolors = true

-- Sets the minimum number of lines to keep above and below the cursor
vim.opt.scrolloff = 8

-- Always display the sign column (used for displaying information like Git markers)
vim.opt.signcolumn = "yes"

-- Appends '@-@' to the 'isfname' option (affects how file names are recognized)
vim.opt.isfname:append("@-@")

-- Reduces the time it takes for messages to be displayed (useful for plugins that use the message line)
vim.opt.updatetime = 50

-- Sets a column for text alignment and wrapping (commonly used for code style enforcement)
vim.opt.colorcolumn = "120"
