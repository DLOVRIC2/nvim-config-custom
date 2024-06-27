-- after/magma-nvim.lua

-- Evaluate operator
vim.keymap.set('n', '<leader>no', ':MagmaEvaluateOperator<CR>', {silent = true, noremap = true})

-- Evaluate current line
vim.keymap.set('n', '<leader>nl', ':MagmaEvaluateLine<CR>', {silent = true, noremap = true})

-- Evaluate visual selection
vim.keymap.set('x', '<leader>ev', ':<C-u>MagmaEvaluateVisual<CR>', {silent = true, noremap = true})

-- Re-evaluate cell
vim.keymap.set('n', '<leader>nc', ':MagmaReevaluateCell<CR>', {silent = true, noremap = true})

-- Delete current cell
vim.keymap.set('n', '<leader>nd', ':MagmaDelete<CR>', {silent = true, noremap = true})

-- Show output of the last evaluation
vim.keymap.set('n', '<leader>no', ':MagmaShowOutput<CR>', {silent = true, noremap = true})

-- Magma settings
vim.g.magma_automatically_open_output = true 
vim.g.magma_image_provider = "kitty"

-- Initialisation functions for different kernels
local function MagmaInitPython()
    vim.cmd[[
    :MagmaInit python3
    :MagmaEvaluateArgument a=5
    ]]
end

-- after/magma-nvim.lua
vim.cmd [[
function! MagmaInitPython()
    MagmaInit python3
    MagmaEvaluateArgument a=5
endfunction

command! MagmaInitPython call MagmaInitPython()
]]
