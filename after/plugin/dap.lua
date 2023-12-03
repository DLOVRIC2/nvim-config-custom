-- Import dap and dapui modules
local dap = require('dap')
local dapui = require('dapui')

-- Setup dapui
dapui.setup()

-- Set dap listeners for dapui
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
--
-- DAP Keymaps in Normal mode

-- Toggle a breakpoint at the current line
vim.keymap.set("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { silent = true, desc = "Toggle Breakpoint" })

-- Start or continue the debug session
vim.keymap.set("n", "<leader>c", "<cmd>lua require'dap'.continue()<CR>", { silent = true, desc = "Continue" })

-- Step over a function or a line of code; executes it without stepping into it
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.step_over()<CR>", { silent = true, desc = "Step Over" })

-- Step into a function or the next line of code; if a function is on the current line, it goes inside it
vim.keymap.set("n", "<leader>ds", "<cmd>lua require'dap'.step_into()<CR>", { silent = true, desc = "Step Into" })

-- Step out of the current function scope
vim.keymap.set("n", "<leader>dso", "<cmd>lua require'dap'.step_out()<CR>", { silent = true, desc = "Step Out" })

-- Open the DAP REPL (Read-Eval-Print Loop); an interactive debugging console
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>", { silent = true, desc = "Open REPL" })

-- DAP Python Specific Keymaps

-- Run the test method where the cursor is located in a Python file
-- vim.keymap.set("n", "<leader>dt", function() require('dap-python').test_method() end, { silent = true, desc = "Test Method" })
vim.keymap.set("n", "<leader>dt", function()
    local dap_python = require('dap-python')

    -- Ensure that the Python configuration is correctly accessed
    if type(dap.configurations.python) == "function" then
        dap.configurations.python = dap.configurations.python()
    end

    -- Save the original configuration
    local original_config = vim.deepcopy(dap.configurations.python)

    -- Modify the configuration to include the --no-cov argument
    dap.configurations.python = {
        {
            type = 'python',
            request = 'launch',
            name = "Launch file",
            program = "${file}",
            args = {"--no-cov"},
        },
    }

    -- Run the test method
    dap_python.test_method()

    -- Restore the original configuration
    dap.configurations.python = original_config
end, { silent = true, desc = "Test Method with --no-cov" })
