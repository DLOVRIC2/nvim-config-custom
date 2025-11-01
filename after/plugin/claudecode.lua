-- Claude Code integration setup
local ok, claudecode = pcall(require, 'claudecode')
if not ok then
    return
end

-- Setup with default configuration
claudecode.setup({
    -- Auto-start the server
    auto_start = true,

    -- Log level
    log_level = "info",

    -- Custom terminal command with --dangerously-skip-permissions flag
    terminal_cmd = "claude --dangerously-skip-permissions",

    -- Terminal configuration
    terminal = {
        split_side = "right",
        split_width_percentage = 0.30,
        provider = "auto",
        auto_close = true,
    },

    -- Focus behavior after sending code
    focus_after_send = false,

    -- Track selection
    track_selection = true,
})

-- Keymaps for Claude Code (using <leader>c* prefix)

-- Toggle Claude terminal (opens and focuses Claude)
vim.keymap.set("n", "<leader>cc", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })

-- Open Claude without stealing focus
vim.keymap.set("n", "<leader>co", function()
    vim.cmd("ClaudeCode")
    vim.cmd("wincmd p") -- Return to previous window
end, { desc = "Open Claude (no focus)" })

-- Focus Claude terminal
vim.keymap.set("n", "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude" })

-- Send visual selection to Claude
vim.keymap.set("v", "<leader>cs", "<cmd>ClaudeCodeSend<cr>", { desc = "Send to Claude" })

-- Select Claude model
vim.keymap.set("n", "<leader>cm", "<cmd>ClaudeCodeSelectModel<cr>", { desc = "Select Claude Model" })

-- Add current buffer to Claude context
vim.keymap.set("n", "<leader>cb", "<cmd>ClaudeCodeAddBuffer<cr>", { desc = "Add Buffer to Claude" })

-- Accept diff proposed by Claude
vim.keymap.set("n", "<leader>ca", "<cmd>ClaudeCodeAcceptDiff<cr>", { desc = "Accept Claude Diff" })

-- Deny/reject diff proposed by Claude
vim.keymap.set("n", "<leader>cd", "<cmd>ClaudeCodeDenyDiff<cr>", { desc = "Deny Claude Diff" })

-- Terminal mode keybindings for easier navigation
-- Press Escape in terminal mode to go back to editor
vim.keymap.set("t", "<Esc>", "<C-\\><C-n><C-w>h", { desc = "Exit terminal and return to editor" })

-- Alternative: Ctrl+h to quickly move back to editor from terminal
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move to editor from terminal" })
