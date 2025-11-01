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

-- Toggle Claude terminal
vim.keymap.set("n", "<leader>cc", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })

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
